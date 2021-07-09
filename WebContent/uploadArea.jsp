<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Area</title>
</head>
<body>
	<div>
        <form id="uploadForm" action='fileUpload.jsp' method='POST' enctype="multipart/form-data">
            <input id="uploadBtn" type='file' name='userfile' multiple>
            <button type="submit">업로드</button>
        </form>
    </div>
</body>
</html>