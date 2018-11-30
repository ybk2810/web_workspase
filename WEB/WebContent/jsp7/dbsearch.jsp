<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	//1. parameter 값
	String name = request.getParameter("name");
	
	if(name != null){
	//2. db연결
	ProductDAO dao = new ProductDAO();
	// 3. db로 부터 사진 이미지 경로 가져오기
	ProductVO vo = dao.getByName(name);
	
	
	out.println(vo.getImgfile());
	}else{
		out.println("../images/f-22.jpg");
	}
%>

    
    