<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl02.jsp</title>
</head>
<body>
	<h2>jstl02</h2>
	
	<%-- <%
		Object num1 = session.getAttribute("num1");
	%> --%>
	
	<h1>${num1 + num2}</h1>

	<h1>큰값: ${num1 > num2?num1:num2}</h1>
	<c:if test="${num1 < num2}">
		<h2>num1이 더 작다.</h2>
	</c:if>
</body>
</html>