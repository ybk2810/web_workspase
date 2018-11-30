<%@page import="VO.ReviewVO"%>
<%@page import="DAO.ReviewDAO"%>
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
	String contents = request.getParameter("contents");
	String fno = request.getParameter("fno");
	String id = request.getParameter("id");
	int no = Integer.parseInt(fno);
	
	
// 	out.println("writer:"+writer);
// 	out.println("title:"+title);
// 	out.println("contents:"+contents);

// dao vo에 저장하기
	
	ReviewDAO dao = new ReviewDAO();
	ReviewVO vo = new ReviewVO();
	
	vo.setRcontents(contents);
	
	dao.add(vo, no, id);
	dao.close();
	
	out.println(vo.getFno());
	out.println(id);
	out.println(vo.getRcontents());
	response.sendRedirect("mainDetail.jsp?fno="+fno);
	
%>
</body>
</html>