<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function() {
	//쿠키에 popup1의 값이 존재하지 않으면
	<%
		out.println("console.log('하하하')");
		// 쿠키에 접근해서 쿠키를 브라우저 콘솔에 출력
		Cookie[] cList = request.getCookies();
		
		boolean isShow = true;
		
		for(Cookie c : cList){
			/* out.println("console.log('" + c.getName() + " : " + c.getValue() + "')"); */
			if(c.getName().equals("popup1")&&c.getValue().equals("no")){
				isShow = false;
			}
		}
		if (isShow){
			
	%>
 
	window.open("popup2.jsp", "공지사항","width=400,height=500 , left=300,top=100");
	<%
		}
	%>
}
</script>
</head>
<body>
   <h3>메인페이지 입니다.</h3>

   <!-- popup.jsp -->

</body>
</html>