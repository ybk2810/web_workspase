<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리리랜드 회원관리 서비스 로그인</title>


<!-- jquery 사용해서 값 전달하기  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
/*  	$(function() {
		$("input#btn1").on("click", function login() {
			//console.log("로긴확인")

 			var frm = document.frm

			frm.action = "loginOk.jsp";
			frm.meethod = "get";
			frm.submit();
		}) 
	})
*/
</script>
</head>
<body>
	<div>
	<%
		Object obj = session.getAttribute("id");
		String id = (String) obj;
		if (id != null) {
			out.println(id + " 로그인 되어 있음");
	%>
		<a href="logout.jsp">로그아웃</a>
	
	<%			
		} else {
	%>
	<form action="loginOk.jsp" name="frm" id="ftm">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" id="id" /></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name="pw" id="pw" /></td>
			</tr>
			<tr>

				<td colspan="2"><input type="submit" value="로그인" id="btn1" />
				<a href="regForm.jsp">
				<input type="button" value="회원가입" id="btn2" />
				</a>
				</td>
				
			</tr>
		</table>
	</form>
	
	<%
		}
	%>
</div>
</body>
</html>
