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

</script>
</body>
</html>