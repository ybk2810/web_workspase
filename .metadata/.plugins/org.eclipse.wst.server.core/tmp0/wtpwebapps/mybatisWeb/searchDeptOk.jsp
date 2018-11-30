<%@page import="kr.co.acorn.web.vo.DeptVO"%>
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
	<%
		String no = request.getParameter("deptno");
		if(no!=null){	
			int deptno = Integer.parseInt(no);
			DeptDAO dao = new DeptDAO();
			DeptVO vo = dao.selectOne(deptno);
	%>
			<h3><%=vo.getDeptno() %></h3>
			<h3><%=vo.getDname() %></h3>
			<h3><%=vo.getLoc() %></h3>
			<a href="searchDeptNo.jsp">목록가기</a>
	<%
		}
	
	%>
</body>
</html>