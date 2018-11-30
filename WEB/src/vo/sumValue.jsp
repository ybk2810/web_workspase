<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jsp 구성요소
    1.page directive -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- html주석 -->
	<%-- JSP주석  --%>
	<%
	/* 2.scriptlet */
	for(int i=1;i<=300; i++){
		sum+=i;
	}
	/*out.println(sum);*/
	%>
	<!-- 3. jsp expression -->
	<h2>1부터 300까지의 합은 <%=sum %>입니다.</h2>
	
	<!-- 4. declaration -->
	<%!
	int sum = 0;
	%>
	
</body>
</html>