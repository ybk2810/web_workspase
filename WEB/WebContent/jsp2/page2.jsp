<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page2</title>
</head>
<body>

	<%
		Object obj1 = pageContext.getAttribute("id1");
		String id1 = (String)obj1;
		out.println("pageContext: " + id1 + "<br />");
	
		Object obj2 = request.getAttribute("id2");
		String id2 = (String)obj2;
		out.println("request: " + id2 + "<br />");
	
		Object obj3 = session.getAttribute("id3");
		String id3 = (String)obj3;
		out.println("session: " + id3 + "<br />");
	
		Object obj4 = application.getAttribute("id4");
		String id4 = (String)obj4;
		out.println("application: " + id4 + "<br />");
	%>
</body>
</html>