<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String deptno = request.getParameter("deptno");
      
	if(deptno != null){
		int no = Integer.parseInt(deptno);
        
		DeptDAO dao = new DeptDAO();
		dao.drop(no);
         
	}
	response.sendRedirect("deptList.jsp");
%>