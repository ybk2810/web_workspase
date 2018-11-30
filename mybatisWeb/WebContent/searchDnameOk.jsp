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
		String dname = request.getParameter("dname");
		if(dname!=null){	
			DeptDAO dao = new DeptDAO();
			DeptVO vo = dao.selectDept(dname);
	%>
			<h3><%=vo.getDeptno() %></h3>
			<h3><%=vo.getDname() %></h3>
			<h3><%=vo.getLoc() %></h3>
			<a href="deptList.jps">목록가기</a>
	<%
		}
	
	%>
</body>
</html>