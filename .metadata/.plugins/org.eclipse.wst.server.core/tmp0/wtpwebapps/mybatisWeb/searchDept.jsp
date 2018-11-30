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
	<form action="searchDeptOk.jsp">
		부서 번호로 검색 : 
		<input type="text" name="deptno" id="" />
		<input type="submit" value="검색" />
	</form>
</body>
</html>