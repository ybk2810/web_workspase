<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type = "text/css">
img{
width: 300px;
height: 300px;
}
</style>
</head>
<body>
<%
	String poster = request.getParameter("moviename");
%>
<div><img src="../images/<%=poster %>.jpg" alt="" /></div>
</body>
</html>