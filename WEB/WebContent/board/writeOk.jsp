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
<!-- 파라미터값부터갖고오자 -->
<% 
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	
// 	out.println("writer:"+writer);
// 	out.println("title:"+title);
// 	out.println("contents:"+contents);

// dao vo에 저장하기
	
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	
	vo.setWriter(writer);
	vo.setTitle(title);
	vo.setContents(contents);
	
	dao.add(vo);
	dao.close();
	response.sendRedirect("list.jsp");
	
%>

</body>
</html>