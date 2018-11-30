<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("input#btn1").on("click", function(){
			/* console.log("푸하하"); */
			var frm = document.frm
			
			frm.action = "loginOK.jsp";
			frm.method = "get";
			frm.submit();
		})
	})
</script>

</head>
<body>
<%
	Object obj = session.getAttribute("id");
	String id = (String)obj;
	if(id != null){
		out.println(id + "로그인 되어 있음");
%>
id <a href="logout.jsp">로그아웃</a>
<%
	}else{
%>
	<form action="loginOK.jsp" name="frm" id="frm">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" id="id" /></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" name="pw" id="pw" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- input:button[value='로그인']#btn1
					input:button[value='회원가입']#btn2 -->
					<input type="button" value="로그인" id="btn1" />
					<input type="button" value="회원가입" id="btn2" />
				</td>
			</tr>
		</table>
	</form>
	<%
	}
	%>
</body>
</html>