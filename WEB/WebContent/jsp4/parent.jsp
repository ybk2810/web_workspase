<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#usedID").hide();
		$("#unusedID").hide();
		
		$("#btn1").on("click", function(){
			var id = $("#id").val();
			window.open("sub.jsp?id=" + id, "아이디검색", "width900, height=600, left=300, top=150");
		})
	})
</script>
</head>
<body>
	<input type="text" name="" id="id" />
	<input type="button" value="아이디검색" id="btn1"/>
	<input type="text" name="" id="test" />
	<div id="msg">
	
	</div>
	<div id="usedID">
		<span>사용할 수 없는 아이디입니다.</span>
	</div>
	<div id="unusedID">
		<span>사용할 수 없는 아이디입니다.</span>
	</div>
</body>
</html>