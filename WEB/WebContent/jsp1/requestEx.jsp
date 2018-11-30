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
		//request 객체
		request.setCharacterEncoding("UTF-8");
		String method = request.getMethod();
		String name = request.getParameter("name");
		String ip = request.getRemoteAddr();
		String queryString = request.getQueryString();
		
		out.println("<h2>method: " + method + "</h2>");
		out.println("<h2>name: " + name + "</h2>");
		out.println("<h2>ip: " + ip + "</h2>");
		out.println("<h2>queryString: " + queryString + "</h2>");
	%>
</body>
</html>