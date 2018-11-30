<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- a.jsp 불러오기 -->
	<%-- <%@ include file="a.jsp" %> --%>
	
	<!-- jsp action tag -->
	<jsp:include page="a.jsp"></jsp:include>
	<%
		/* out.println(a); */
	%>
</body>
</html>