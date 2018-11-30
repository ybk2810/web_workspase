<%@page import="kr.co.acorn.web.vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table,td,th{
		border: 1px solid black;
		border-collapse: collapse;
	}
	table{
		text-align: center;
		margin: 10px auto;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th></th>
			<th>부서번호</th>
			<th>부서명</th>
			<th>위치</th>
		</tr>
		<%
			DeptDAO dao = new DeptDAO();
			List<DeptVO> list = dao.selectAll();
			for(DeptVO vo: list){
		%>
		<tr>
			<td><input type="checkbox" name="ck" id="" /></td>
			<td><%= vo.getDeptno() %></td>
			<td><%= vo.getDname() %></td>
			<td><%= vo.getLoc() %></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="4">
				<a href="addDept.jsp">
					<input type="button" value="부서 추가" />
				</a>
				<a href="searchDname.jsp">
					<input type="button" value="부서명 검색" />
				</a>
				<a href="searchDept.jsp">
					<input type="button" value="부서번호 검색" />
				</a>
				<a href="dropDept.jsp">
					<input type="button" value="삭제하러가기" />
				</a>
			</td>
		</tr>
	</table>
</body>
</html>