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
		/* response 객체*/
		int status = response.getStatus();
		out.println("상태: " + status);
	
		// 200: 정상
		// 404: Not Found
		// 405: doGet, doPost
		// 500: server side login error
		
		
	%>
	
	<h2>다른 페이지로 이동</h2>
	<!-- 1. sendRedirect 방식 -->
	<%
/* 		response.sendRedirect("menu.jsp"); */
	/* http://localhost:8080/WEB/jsp1/menu.jsp */
	%>
	<!-- menu.jsp -->
	<!-- 2. forward 방식 -->
	<%
		RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");
		rd.forward(request, response);
		/* http://localhost:8080/WEB/jsp1/responseEx.jsp */
	%>
</body>
</html>