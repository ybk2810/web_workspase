<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/boarder.css" />
</head>
<body>

<%
	String b = request.getParameter("bno");
/* 		System.out.println(p); */
		if (b!= null) {
			int bno = Integer.parseInt(b);

		BoardDAO dao = new BoardDAO();
		BoardVO vo = dao.selectOne(bno);
		dao.raiseHits(bno);
		dao.close();
	

	%>
	<table>
	<tr>
	<th>글번호</th>
	<td><%=vo.getBno() %></td>
	<th>작성자</th>
	<td><%=vo.getWriter() %></td>
	<th>조회수</th>
	<td><%=vo.getHits() %></td>
	<th>작성일자</th>
	<td><%=vo.getRegdate() %></td>
	</tr>
	
	
	<tr>
		<td>제목</td>
		<td colspan="5"><%= vo.getTitle() %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="5"><%= vo.getContents() %></td>
	</tr>
	<tr>
	<td colspan="6">
	<a href="list.jsp"><input type="button" value="목록"/></a>
	<a href="deleteOk.jsp?bno=<%= vo.getBno() %>"><input type="button" value="삭제" /></a>
	<a href="modifyForm.jsp?bno=<%= vo.getBno() %>"><input type="button" value="수정" /></a>
	</td>
	</tr>
</table>
<%
		}
%>
</body>
</html>