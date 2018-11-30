<%@page import="VO.FoodVO"%>
<%@page import="DAO.FoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String name = request.getParameter("fname");
	FoodDAO dao = new FoodDAO();
	FoodVO vo = dao.getByName(name);
	
	out.println(vo.getFno());
	out.println("<img src='"+vo.getFimage()+"' alt='' id='ww' />");
	out.println(vo.getFname());
	out.println(vo.getKind());
	out.println(vo.getPnum()+"");
	out.println("조리시간 : "+vo.getCtime()+"분"); 
%>