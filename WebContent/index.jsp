<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>UPLOADER</title>
</head>
<body>
	<section class="main_section">
        <div class="title_bar">
            <h1>UPLOADER</h1>
        </div>
        <div class="uploader_body">
            <div id="top_area" class="top_area">
                <input type="checkbox">
                <div>파일 항목</div>
                <div>파일 크기</div>
            </div>
            <div id="upload_area" class="upload_area">
                <iframe id="upload_frame" class="upload_frame" src="uploadArea.jsp" frameborder="0"></iframe>
            </div>
            <div id="info_area" class="info_area">
                <ul>
                    <li id="basic_file_info" class="basic_file_info">
                        최대
                        <span>20</span>
                        개
                        <span>300 MB</span>
                        제한
                    </li>
                    <li id="current_file_info" class="current_file_info">
                        <span>0</span>
                        개 ,
                        <span>0 byte</span>
                        <span>추가됨</span>
                    </li>
                </ul>
            </div>
            <div id="btn_area" class="btn_area">
                <table>
                    <tbody>
                        <tr>
                            <td>
                            	<button type="button" id="button_add" onclick="selectFiles()">
                            		<span>파일추가</span>
                            	</button>
                                <button type="button">
                                    <span>항목제거</span>
                                </button>
                                <button type="button">
                                    <span>전체 제거</span>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
 		<div class="uploaded_body">
    		<iframe class="uploaded_frame" src="fileUpload.jsp" frameborder="0"></iframe>
    	</div>
    </section>
	
<script lang="text/javascript">
	//iframe window 가져오기
	const uploadWindow = document.getElementById('upload_frame').contentWindow;

	// 버튼으로 input 불러오기
	function selectFiles() {
		uploadWindow.document.getElementById("fileInput").click();
	}
	
	// 파일 업로드
	function setUploadFiles(e){
		// 파일 배열 가져오기
		const files = e.target.files;
		console.log(files);
		
		// file정보를 담을 formData 객체 생성
	    const formData = new FormData()
	    for(let i = 0; i <= files.length; i++){
	        formData.append("file-" + i, files[i]);
	    }
		
	 	// ajax를 하기 위한 XmlHttpRequest 객체
	    const xhttp = new XMLHttpRequest();
	 	
	 	// http 요청 타입 / 주소 / 동기식 여부 설정
	    xhttp.open("POST", "fileUpload.jsp", true); // 메서드와 주소 설정
	    // http 요청
	    xhttp.send(formData);   // 요청 전송
	 	// XmlHttpRequest의 요청
	    xhttp.onreadystatechange = function(e){   // 요청에 대한 콜백
	        // XMLHttpRequest를 이벤트 파라미터에서 취득
	        const req = e.target;
	        console.log(req);   // 콘솔 출력
	
	        // 통신 상태가 완료가 되면...
	        if(req.readyState === XMLHttpRequest.DONE) {    // 요청이 완료되면
	            // Http response 응답코드가 200(정상)이면..
	            if(req.status === 200) {
	                console.log("성공")
	                console.log(xhttp.responseText)
	
	            }else{
	            	console.log("실패")
	                console.error(xhttp.responseText)
	            }
	        }
	    } 
	}
	
	
	
		
	
</script>    
</body>
</html>