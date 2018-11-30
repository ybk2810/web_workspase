<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
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
			<th>작성자</th>
			<th>제목</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<th><a href="board.do?cmd=detail&no=${vo.bno}">${vo.bno}</a></th>
				<th><a href="board.do?cmd=detail&no=${vo.bno}">${vo.writer}</a></th>
				<th><a href="board.do?cmd=detail&no=${vo.bno}">${vo.title}</a></th>
				<th>${vo.hits}</th>
				<th>${vo.regdate}</th>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				<a href="board.do?cmd=write">
					<input type="button" value="글쓰기" />
				</a>
			</td>
		</tr>
	</table>
</body>
</html>