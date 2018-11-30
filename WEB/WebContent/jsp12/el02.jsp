<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<%
		String n = request.getParameter("no");
		// 1 증가한 값을 출력
		if(n!=null){
			int no1 = Integer.parseInt(n);
			out.println(++no1);
		}
	%> --%>
	
	<h1>${param.no}</h1>
</body>
</html>