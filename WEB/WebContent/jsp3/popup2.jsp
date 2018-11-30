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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript">
function closeWindow (){
	/* 체크박스 체크유무 콘솔에 출력 */
	console.dir($("#ck"));
	//console.log($("#ck")[0].checked);
	if($("#ck")[0].checked){
		$.cookie("popup1","no",{expires:1});
	}
	window.close();
}
</script>
</head>

<body>
	
	<h3>popup.jsp</h3>
	
	<h3>공지사항</h3>
	
	<p>공사중입니다.  언제끝날지 몰라요...</p>
	<img src="../images/service_maintence.png" alt="" />
	
	
	<form action="" name="frm">
	<input type="checkbox"  name = "ck"  id="ck"  />
	<span>오늘 더 이상 보지 않기</span>
	<a href="javascript:closeWindow();">[닫기]</a>
	</form>
</body>
</html>