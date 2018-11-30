<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="">
		<input type="text" name="dan" id="" />
		<input type="submit" value="출력" />
	</form>
	
	<%
	String dan = request.getParameter("dan");
	if(dan !=null){
		int d = Integer.parseInt(dan);
	%>
	<h2><%=dan %>단</h2>
	<%
	for(int i=1; i<=9; i++){
	%>
		<h3><%=d %> * <%=i %> = <%=d*i %></h3>
	<%
	}
	}
	%>
</body>
</html>