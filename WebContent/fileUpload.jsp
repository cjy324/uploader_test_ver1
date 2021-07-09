<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

    
<%
	String uploadState = "실패";
	String fileName = "";
	int sizeLimit = 15*1024*1024;
	
	String realPath = request.getServletContext().getRealPath("upload");
	
	File dir = new File(realPath);
	if(!dir.exists()){
		dir.mkdirs();
	};
	
	MultipartRequest multiReq = new MultipartRequest(
			request, 
			realPath, // 파일을 저장할 디렉토리 지정
			sizeLimit, // 첨부파일 최대 용량 설정(bite)
			"utf-8", // 인코딩 방식 지정
			new DefaultFileRenamePolicy() // 중복 파일 처리(동일한 파일명이 업로드되면 뒤에 숫자 등을 붙여 중복 회피)
			);
	fileName = multiReq.getFilesystemName("userfile");
	
	uploadState = "완료";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<p>업로드 상태 : <%=uploadState%></p>
	<p>파일명 : <%=multiReq.getFilesystemName("userfile") %></p>
	<p>업로드 경로 : ${pageContext.request.contextPath}/upload/<%=fileName%></p>
	<p>물리적 경로 : <%=realPath%></p>
	<img src="${pageContext.request.contextPath}/upload/<%=fileName%>">
</body>
</html>