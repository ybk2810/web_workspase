<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl06.jsp</title>
</head>
<body>
	<%
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> list = dao.selectAll(1,10);
		
		session.setAttribute("list", list);
		dao.close();
	%>
	
	<c:redirect url="jstl07.jsp">
		<c:param value="code1" name="aaa" />
		<c:param value="code2" name="bbb" />
	</c:redirect>
	
	<%-- <jsp:forward page="jstl07.jsp">
		<jsp:param value="code1" name="aaa"></jsp:param>
		<jsp:param value="code2" name="bbb"></jsp:param>
	</jsp:forward> --%>
	
	<!-- 
		redirect
		forward 
	-->
</body>
</html>