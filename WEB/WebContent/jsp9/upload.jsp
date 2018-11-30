<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload.jsp</title>
</head>
<body>
	<form action="uploadOk.jsp" method="post" enctype="multipart/form-data">
		<input type="text" name="txt" id="" />
		<input type="file" name="dataFile" id="" />
		<input type="submit" value="전송"/>
	</form>
</body>
</html>