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
		String msg = request.getParameter("msg");
	
		//PrintWriter out = response.getWriter();
		
		out.println("하하하... 점심점심.. ");
	%>
	
	<h2>메세지 : <%= msg %></h2>
</body>
</html>