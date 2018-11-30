<%@page import="DAO.FmemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ploginOk</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){			
		$(function (){
			opener.location.reload(); //부모창 리프레쉬
			self.close();		
		})
	})	
	
</script>
</head>
<body>
	<%
    	String id = request.getParameter("id");
		String pw = request.getParameter("pw");

/* 		out.println("id : " + id + " 입니다");
		out.println("pw : " + pw + " 입니다"); */

 		FmemberDAO dao = new FmemberDAO();
		boolean isOk = dao.isExist(id,pw);
		dao.close();

  		if (isOk) {
			//존재하면
			//out.println("로그인성공");
			session.setAttribute("id", id);
	%>
	<script type="text/javascript">
		alert("로그인 성공");
	</script>
	<%

		} else {
	%>
	<script type="text/javascript">
		alert("아이디 또는 비밀번호가 일치하지 않습니다");
		location.href="login.jsp";
	</script>
	<%
		
  		 /* response.sendRedirect("login.jsp"); */
		}
	%>

</body>
</html>