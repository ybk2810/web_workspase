<%@page import="vo.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	
		hw2.jsp 이동
		부서테이블의 모든 데이터를 가져와 화면에 테이블 형태로 출력하세요
		(단, JSTL을 사용해서) 
	
	-->

	<%
		DeptDAO dao = new DeptDAO();
		ArrayList<DeptVO> list = dao.selectAll();
		
		session.setAttribute("list", list);
		dao.close();
	%>
	
	<jsp:forward page="hw2.jsp">
		<jsp:param value="code1" name="aaa"></jsp:param>
		<jsp:param value="code2" name="bbb"></jsp:param>
		<jsp:param value="code3" name="ccc"></jsp:param>
	</jsp:forward>
	
</body>
</html>