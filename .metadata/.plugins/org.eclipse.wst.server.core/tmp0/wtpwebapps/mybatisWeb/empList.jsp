<%@page import="kr.co.acorn.web.vo.EmpVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empList</title>
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
			<th>사원번호</th>
			<th>사원명</th>
			<th>직업</th>
			<th>상사사원번호</th>
			<th>입사일</th>
			<th>급여</th>
			<th>수수료</th>
			<th>부서번호</th>
		</tr>
		<%
			EmpDAO dao = new EmpDAO();
			List<EmpVO> list = dao.selectAll();
			for(EmpVO vo: list){
		%>
		<tr>
			<td><input type="checkbox" name="ck" id="" /></td>
			<td><%= vo.getEmpno() %></td>
			<td><%= vo.getEname() %></td>
			<td><%= vo.getJob() %></td>
			<td><%= vo.getMgr() %></td>
			<td><%= vo.getHiredate() %></td>
			<td><%= vo.getSal() %></td>
			<td><%= vo.getComm() %></td>
			<td><%= vo.getDeptno() %></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="9">
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