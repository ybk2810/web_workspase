<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<style type="text/css">
	.img-size{
		width: 300px;
		height: 300px;
		fload: left;
		margin: 30px;
	}
	lid{
		list-sytle: none;
	}
</style>
</head>
<body>
	<ul>
		<%
			// 업로드한 이미지 출력
			String saveDir = application.getRealPath("/upload");
			File f = new File(saveDir);
			
			String[]list = f.list();
			for(String x: list) {
				String path = "../upload/"+x;
		%>
		<li><img src="<%=path %>" class="img-size"alt="" /></li>
		<%
			}
		%>
	</ul>
</body>
</html>