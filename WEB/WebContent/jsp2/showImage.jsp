<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 자원을 표시하는 방법 -->
<!-- 1. 상대경로 -->

<!-- WebContent/jsp2/showImage.jsp -->
<!-- WebContent/images/lion.gif -->

<img src="../images/lion.gif" alt="라이언" />


<!-- 2. 절대경로 -->
<img src="http://localhost:8080/WEB/images/lion.gif" alt="라이언" />

</body>
</html>