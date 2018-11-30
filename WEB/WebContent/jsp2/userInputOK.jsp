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
		String txt = request.getParameter("txt");
	
		// 쿠키: 서버가 사용자 브라우저에 남기는 작은 정보의 조각
		out.println("<h2>" + txt + "</h2>");
	
		Cookie c = new Cookie("txt", txt);
		c.setMaxAge(60*60*24*365);
		response.addCookie(c);
	%>
	<a href="userCookieList.jsp">쿠키확인하러가기</a>
</body>
</html>