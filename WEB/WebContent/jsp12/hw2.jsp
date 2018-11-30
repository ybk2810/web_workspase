<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hw2.jsp</title>
</head>
<body>
	<c:forEach var="vo" items="${list}">
		<h2>${vo.deptno} ${vo.dname} ${vo.loc}</h2>
		<hr color="blue"/>
	</c:forEach>
</body>
</html>