<%@page import="java.util.ArrayList"%>
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
		String p= request.getParameter("pno");
		
		ArrayList<Integer> list = null;
		int no = Integer.parseInt(p);
		Object obj = session.getAttribute("cart");
		if(obj == null){
			list = new ArrayList<Integer>();
		}else{
			list = (ArrayList<Integer>)obj;
		}
		
		// 기존에 존재하는지 여부 판단
		
		
		// 존재하면 수량변경
		
		// 없으면 추가
		
		// list에 상품번호를 추가
		list.add(no);
		
		for(Integer it : list){
			out.println(it);
		}
		
		session.setAttribute("cart", list);
		
		/* viewCart.jsp 이동 redirect 방식 */
		response.sendRedirect("viewCart.jsp");
	%>
</body>
</html>