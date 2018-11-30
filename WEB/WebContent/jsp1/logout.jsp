<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// session 객체를 무효화
	session.invalidate(); 
	
	// login.jsp redirect
	response.sendRedirect("login.jsp");
	%>
</body>
</html>