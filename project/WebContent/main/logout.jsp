<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <%
    //plogout.jsp
    //session객체를 무효화한다
    session.invalidate();
    
    //login.jsp redirect
    
    response.sendRedirect("main.jsp");
    %>