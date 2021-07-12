<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Upload Area</title>
</head>
<body id="upload_area">
	<div style="height: 200px">
		<input id="fileInput" type='file' onchange="parent.setUploadFiles(event)" name='userfile' multiple style="display: none;">	
		<ul id="uploadZone" style="height: 100%; border: 2px solid;"></ul>
	</div>
<script type="text/javascript">
	const fileInput = document.getElementById("fileInput");
	const uploadZone = document.getElementById("uploadZone");
	        
	// 업로드 될 파일리스트 그리기
	function showFiles(files) {
		
		let fileListLi = ""	// dropZone에 drop한 파일별 태그 생성
	    
	    for(let i = 0; i < files.length; i++) {
	    	fileListLi += "<li>";
	    	fileListLi += "<input id='chk_file_" + [i] + "' type='checkbox'  value='false'>";
	    	fileListLi += "<span>" + files[i].name + "</span>";
	    	fileListLi += "</li>";
	    }
		
		uploadZone.innerHTML = fileListLi;
	}
	
	// 업로드 될 파일리스트 값 세팅
	function setFiles(newFiles) {
		
    // 현재 세팅되있는 파일과 동일한 파일인지 체크
    for(let i = 0; i < fileInput.files.length; i++){
        for(let k = 0; k < newFiles.length; k++){
            if(fileInput.files[i] = newFiles[k]){
                alert(newFiles[k].name + "은 중복된 파일입니다.")
                return;
            }
        }
    }
    
	    fileInput.files = newFiles	// input file 영역에 파일 항목을 드랍된 파일들로 대체
	    showFiles(fileInput.files)	// dropZone에 파일리스트 그리기	    
	}
	
	// input에 파일이 들어오면 dropZone에 업로드 될 파일리스트 그리기
	fileInput.addEventListener("change", function(e) {
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
	    	// 만약 files의 갯수가 1보다 작으면 "폴더 업로드 불가" 알림
	        if (files.length < 1) {
	            alert("폴더 업로드 불가")
	            return
	        }
	    	// uploadZone에 드랍된 파일들로 파일리스트 세팅
	        setFiles(files)
	    } else {
	        alert("ERROR")
	    }
	
	})
</script>
</body>
</html>