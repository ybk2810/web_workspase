<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl07.jsp</title>
</head>
<body>
	<h2>${param.aaa}</h2>
	<h2>${param.bbb}</h2>
	<%-- <h2>${list}</h2> --%>
	
	<c:forEach var="vo" items="${list}">
		<h2>${vo.bno}</h2>
		<h2>${vo.title}</h2>
		<hr color="blue"/>
	</c:forEach>
	
</body>
</html>