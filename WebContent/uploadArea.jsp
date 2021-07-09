<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Area</title>
</head>
<body>
	<div style="height: 100%">
		<form id="uploadForm" action='fileUpload.jsp' method='POST'
			enctype="multipart/form-data">
			<input id="fileInput" type='file' name='userfile' multiple>
			<button type="submit">업로드</button>
			
			<div id="uploadZone" style="height: 100px; border: 2px solid;">
				dropzone
			</div>
		</form>
	</div>
<script lang="text/javascript">
	
	const file = document.getElementById("fileInput")
    const uploadZone = document.getElementById("uploadZone")
            
    // 업로드 될 파일리스트 그리기
    function showFiles(files) {
		
		uploadZone.innerHTML = ""	// dropZone에 drop한 파일별 태그 생성
        
        for(let i = 0; i < files.length; i++) {
        	uploadZone.innerHTML += "<p>" + files[i].name + "</p>"
        }
    }

    function selectFile(files) {
        
        file.files = files	// input file 영역에 파일 항목을 드랍된 파일들로 대체
        showFiles(file.files)	// dropZone에 파일리스트 그리기
        
    }
            
	file.addEventListener("change", function(e) {
	    showFiles(e.target.files)
	})

	// 드래그한 파일이 최초로 uploadZone에 진입했을 때
	uploadZone.addEventListener("dragenter", function(e) {
	    e.stopPropagation()
	    e.preventDefault()	
	})

	// 드래그한 파일이 uploadZone을 벗어났을 때
	uploadZone.addEventListener("dragleave", function(e) {
	    e.stopPropagation()
	    e.preventDefault()
	})

	// 드래그한 파일이 uploadZone에 머물러 있을 때
	uploadZone.addEventListener("dragover", function(e) {
	    e.stopPropagation()
	    e.preventDefault()
	})

	// 드래그한 파일이 uploadZone에 드랍되었을 때
	uploadZone.addEventListener("drop", function(e) {
	    e.preventDefault()

	    const files = e.dataTransfer && e.dataTransfer.files
	    console.log(files)
	
	    if (files != null) {
	        if (files.length < 1) {
	            alert("폴더 업로드 불가")
	            return
	        }
	        selectFile(files)
	    } else {
	        alert("ERROR")
	    }
	
	})
	
	// http://yoonbumtae.com/?p=3225
			
			
			
	// 이미지 업로드
	function doUpload(event){
	    // form으로부터 FormData 가져오기
	    const form = document.getElementById("uploadForm");
	    const formData = new FormData(form)
	    // ajax를 하기 위한 XmlHttpRequest 객체
	    const xhttp = new XMLHttpRequest();
	
	    // http 요청 타입 / 주소 / 동기식 여부 설정
	    xhttp.open("POST", "http://127.0.0.1:8085/doUpload", true); // 메서드와 주소 설정
	    // http 요청
	    xhttp.send(formData);   // 요청 전송
	    // XmlHttpRequest의 요청
	    xhttp.onreadystatechange = function(e){   // 요청에 대한 콜백
	        // XMLHttpRequest를 이벤트 파라미터에서 취득
	        const req = e.target;
	        // console.log(req);   // 콘솔 출력
	
	        // 통신 상태가 완료가 되면...
	        if(req.readyState === XMLHttpRequest.DONE) {    // 요청이 완료되면
	            // Http response 응답코드가 200(정상)이면..
	            if(req.status === 200) {
	                const imagesName = JSON.parse(req.responseText);  // parse: json타입을 object형식으로 변환
	                const imagesNameLength = Object.keys(imagesName).length; // 내장 객체 Object를 이용하면 JSON형태의 객체 값의 개수를 확인할 수 있다.
	
	                for(let i = 0; i < imagesNameLength; i++){
	                    // img 태그 생성
	                    const newImg = editWindow.document.createElement("img");
	                    // img 태그의 속성 설정 
	                    newImg.src = "http://127.0.0.1:8085/" + imagesName[i];
	                    const newImgWidth = prompt('가로 길이를 입력해 주세요.(단위: px)');
	                    newImg.width = newImgWidth;
	            
	                    // img 태그의 속성 설정 완료 후 커서 위치에 img node 삽입
	                    range.insertNode(newImg);
	                }
	
	                // IE상에서 focus 위치를 잡지 못해 다시 focus를 잡아주어야 함
	                autoFocus()
	                selection = editWindow.document.getSelection();
	                selection.removeAllRanges();
	                selection.addRange(range);
	
	            }else{
	                console.error(xhttp.responseText)
	            }
	        }
	    } 
	};

</script>
</body>
</html>