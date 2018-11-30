<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<h3>중복</h3>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberDAO dao = new MemberDAO();
		
		boolean isOk = dao.isExist(id,pw);
		
		if(isOk){
			out.println("<h3> 환영합니다. " + id + "님 </h3>");
		}else {
			out.println("아이디 또는 패스워드가 틀렸습니다.");
		}
	%>
