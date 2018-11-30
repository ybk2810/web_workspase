
<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
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
String bno = request.getParameter("bno");
if(bno!=null){
int no = Integer.parseInt(bno);
String title = request.getParameter("title");
String contents = request.getParameter("contents");
	
BoardDAO dao = new BoardDAO();
BoardVO vo = new BoardVO();

vo.setBno(no);
vo.setTitle(title);
vo.setContents(contents);
dao.modify(vo);
dao.close();
}
response.sendRedirect("list.jsp");
%>

</body>
</html>