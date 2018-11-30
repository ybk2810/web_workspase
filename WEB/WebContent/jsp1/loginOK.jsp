<%@page import="dao.MemberDAO"%>
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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<h4>
<%
out.println("id: " + id);
out.println("pw: " + pw);
%>
</h4>

<%
	MemberDAO dao = new MemberDAO();
	boolean isOK = dao.isExist(id,pw);
	dao.close();
	
	if(isOK) {
		out.println("로그인 성공");
		// session이라는 내장객체에id속성의 값을 지정
		session.setAttribute("id",id);
	}else {
		out.println("<h1>로그인하세요!</h1>");
	}
	response.sendRedirect("login.jsp");
%>

		
</body>
</html>