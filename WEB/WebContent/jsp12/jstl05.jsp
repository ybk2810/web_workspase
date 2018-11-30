<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl05.jsp</title>
</head>
<body>
	<!-- 1부터 10까지 h2사이즈로 값을 출력 -->
	
<%-- 	<%
		for(int i=1; i<=10; i++){
			out.println("<h2>" + i + "</h2>");
		}
	%> --%>
	
	<c:forEach begin="1" end="10" var="i" step="1">
		<h2>${i}</h2>
	</c:forEach>
</body>
</html>