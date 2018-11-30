<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello JSP World</h1>
	<%
		/*scriptlet*/
		for(int i=0; i<100; i++){
	%>
			<h2>안녕하세요 JSP 세상으로 오신것을 환영합니다.</h2>
			
	<%
		}
	%>
	
</body>
</html>