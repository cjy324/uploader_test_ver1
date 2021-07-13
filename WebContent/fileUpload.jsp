<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

    
<%
	String uploadState = "업로드";
	
	//첨부파일 최대 용량 설정
	int sizeLimit = 15*1024*1024;  // 15MB
	// 실제 파일을 업로드할 경로 설정
	String realPath = request.getServletContext().getRealPath("upload");
	
	File dir = new File(realPath);
	if(!dir.exists()){	// 만약, realPath 경로에 폴더가 없으면 폴더 생성
		dir.mkdirs();
	};
	
	// Multipart로 요청 받기 위한 객체 생성
	MultipartRequest multiReq = new MultipartRequest(
				request, 
				realPath, // 파일을 저장할 디렉토리 지정
				sizeLimit, // 첨부파일 최대 용량 설정(bite)
				"utf-8", // 인코딩 방식 지정
				new DefaultFileRenamePolicy() // 중복 파일 처리(동일한 파일명이 업로드되면 뒤에 숫자 등을 붙여 중복 회피)
			);
	// 각 파일별 이름 받아오기
	String fileName = multiReq.getFilesystemName("files");
	
	String test1 = multiReq.getContentType("slicedFiles");
	String test2 = multiReq.getContentType("files");
	
	System.out.print(test1);
	System.out.print(test2);
	
	uploadState = "완료";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Uploaded State Area</title>
</head>
<body>
	<div>
		<p>업로드 상태 : <%=uploadState%></p>
		<p>파일명 : <%=multiReq.getFilesystemName("files") %></p>
		<p>업로드 경로 : ${pageContext.request.contextPath}/upload/<%=fileName%></p>
		<p>물리적 경로 : <%=realPath%></p>
		<img src="${pageContext.request.contextPath}/upload/<%=fileName%>">
	</div>
</body>
</html>