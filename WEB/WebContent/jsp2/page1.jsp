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
		// jsp 구성요소
		// 1. 지시어
		// 2. scriptlet
		// 3. expression
		// 4. 선언부
		
		// 따로 선언하지 않아도 항상 내부적으로 
		// 선언되어 따로 선언하지 않아도 되는 객체
		
		/*
			pageContext: 현재 JSP 페이지의 컨텍스트를 나타내는 객체
			request: 사용자의 요청을 객체화 시켜놓은것
			session: 웹 브라우저의 정보를 유지하기 위한 세션정보를 저장하고 있는 객체
			application: 웹 애플리케이션 Context의 정보를 저장하고 있는 객체
			
			내장객체 속성값 지정	
		*/
		
		pageContext.setAttribute("id1", "aaa");
		request.setAttribute("id2", "bbb");
		session.setAttribute("id3", "ccc");
		application.setAttribute("id4", "ddd");
		/* 
		Object obj1 = pageContext.getAttribute("id1");
		String id1 = (String)obj1;
		out.println("pageContext: " + id1 + "<br />");

		Object obj2 = request.getAttribute("id2");
		String id2 = (String)obj2;
		out.println("request: " + id2 + "<br />");

		Object obj3 = session.getAttribute("id3");
		String id3 = (String)obj3;
		out.println("session: " + id3 + "<br />");

		Object obj4 = application.getAttribute("id4");
		String id4 = (String)obj4;
		out.println("application: " + id4 + "<br />"); */
		
		// 1. redirect
		response.sendRedirect("page2.jsp");
		
		// 2. forward
		/* RequestDispatcher rd = request.getRequestDispatcher("page2.jsp");
		
		rd.forward(request, response); */
	%>
</body>
</html>