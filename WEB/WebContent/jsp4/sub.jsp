<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sub.jsp</title>
<script type="text/javascript">
	window.onload = function(){
		document.getElementById("btn2").onclick = function(){
			var txt = document.getElementById("id").value;
			console.log(txt);
			//opener.document.getElementById("test").value = '하하하';
			opener.document.getElementById("msg").innerHTML="<h2>존재하는 id입니다</h2>";
		}
	}
</script>
</head>
<body>
	<%
		String id = request.getParameter("id");
		MemberDAO dao = new MemberDAO();
		boolean isOk = dao.isExist(id);
		if(isOk == true){
			
		}else{
			
		}
		out.println("isOk: " + isOk); 
		%>
		<input type="text" name="" id="id" value=<%=isOk %>/>
		<input type="button" value="완료" id="btn2"/>
	
</body>
</html>