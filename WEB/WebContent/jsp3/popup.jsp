<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
img{
      width : 400px;
      height : 200px;
}
</style>

<script type="text/javascript">
	function closeWindow(){
		/* window.close(); */
		
		// form test.jsp로 전달
		/* document.frm.method = "get";
		document.frm.action = "test.jst"; */
		document.frm.submit(); 
		
	}
</script>
</head>

<body>
	<%
	
	
	
		String ck = request.getParameter("ck");
		// 이 값이 null이 체크 안함
		// 이 값이 on이 체크한 상태
		if(ck != null){
			// 쿠키에 추가
			Cookie c = new Cookie("popup1", "no");
			// popup1 no
			c.setMaxAge(60);
			response.addCookie(c);
		}
		
		out.println("<script type='text/javascript'>");
		out.println("window.onload = function(){window close();}");
		out.println("</script>");
	
	%>
	
	<h3>popup.jsp</h3>
	
	<h3>공지사항</h3>
	
	<p>공사중입니다.  언제끝날지 몰라요...</p>
	<img src="../images/service_maintence.png" alt="" />
	
	
	<form action="" name="frm">
	<input type="checkbox"  name = "ck"  id=""  />
	<span>오늘 더 이상 보지 않기</span>
	<a href="javascript:closeWindow();">[닫기]</a>
	</form>
</body>
</html>