<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="requestEx.jsp?name=hong">request객체확인하기</a>
	
	<form action="requestEx.jsp" method="post">
		<input type="hidden" name="name" value ="수요일"/>
		<input type="submit" value="확인" />
	</form>
	
	<a href="responseEx.jsp">response객체확인</a>
</body>
</html>