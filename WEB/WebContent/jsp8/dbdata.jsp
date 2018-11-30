<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	boolean idCheck = false;
	if(id!=null){
		MemberDAO dao = new MemberDAO();
		idCheck = dao.isExist(id);
		dao.close();
	}
	
%>
<%= idCheck == true?"success":"fail"%>


