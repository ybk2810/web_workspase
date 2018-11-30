<%@page import="VO.FoodVO"%>
<%@page import="java.util.ArrayList"%>
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
	Cookie[] clist = request.getCookies();
	for( Cookie c : clist ){
		out.println("<h2>쿠키 : "+c.getName()+" : "+c.getValue()+"</h2>");
	}
	%>
</body>
</html>