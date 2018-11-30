<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<%
		Object obj1 =pageContext.getAttribute("id1");
		Object obj2 =request.getAttribute("id2");
		Object obj3 =session.getAttribute("id3");
		Object obj4 =application.getAttribute("id4");
		
		out.println("id1: " + obj1);
		out.println("id2: " + obj2);
		out.println("id3: " + obj3);
		out.println("id4: " + obj4);
	%> --%>

	<h1>${id1}</h1>
	<h1>${id2}</h1>
	<h1>${sessionScope.id3}</h1>
	<h1>${applicationScope.id3}</h1>
	<!-- null인 것들은 생략됨 -->
</body>
</html>