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
		pageContext.setAttribute("id1", "aaa");
		request.setAttribute("id2", "bbb");
		session.setAttribute("id3", "ccc");
		application.setAttribute("id3", "ddd");
	%>
	<a href="el04.jsp">이동하기</a>
</body>
</html>