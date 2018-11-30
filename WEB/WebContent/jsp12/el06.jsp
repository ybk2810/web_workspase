<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <%
		String[] hobbyList = request.getParameterValues("hobby");
	
		for(String x : hobbyList){
			out.println("<h1>" + x + "</h1>");
		}
	%> --%>
	<h1>${paramValues.hobby[0]}</h1>
	<h1>${paramValues.hobby[1]}</h1>
	<h1>${paramValues.hobby[2]}</h1>
	<h1>${paramValues.hobby[3]}</h1>
</body>
</html>