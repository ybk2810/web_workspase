<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table,td,th{
		border:1px solid black;
		border-collapse: collapse;
	}
	table{
		margin: 30px auto;
		text-align: center;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<th>${vo.bno}</th>
				<th>${vo.title}</th>
				<th>${vo.writer}</th>
			</tr>
		</c:forEach>
		
	</table>
</body>
</html>