<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<%
		String n1 = request.getParameter("no1");
		String n2 = request.getParameter("no2");
		int no1 = Integer.parseInt(n1);
		int no2 = Integer.parseInt(n2);
	%> --%>
	
	<h1>큰값: ${param.no1 > param.no2?param.no1:param.no2}</h1>
	
	<c:if test="${param.no1 >= param.no2}">
		<h2>큰값 : ${param.no1}</h2>
	</c:if>
	
	<c:if test="${param.no1 < param.no2}">
		<h2>작은값값 : ${param.no2}</h2>
	</c:if>
	
</body>
</html>