<%@page import="java.util.ArrayList"%>
<%@page import="VO.FoodVO"%>
<%@page import="DAO.FoodDAO"%>
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
		String kind = request.getParameter("kind");
	
		FoodDAO dao = new FoodDAO();
		ArrayList<Integer> list = dao.getByKind(kind);
	%>
</body>
</html>