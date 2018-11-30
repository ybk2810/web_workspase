<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax08.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	/* 
	중복검사 버튼을 누르면 input:text에 있는 내용을 브라우저 콘솔에 출력
	*/
	$(function(){
		$("#txt").on("keyup", function(){
			$.ajax({
				url: "dbdata.jsp",
				type: 'get',
				data: {id:$("#txt").val()},
				success: function(data){
					console.log("성공" + data);
					//공백제거
					data = data.trim();
					if(data=="success"){
						$("#div1").html("<span id='red'>존재하는 아이디입니다</span>");
					}else {
						$("#div1").html("<span id='blue'>사용가능한 아이디입니다</span>");
					}
				}
			})
		})
		
		$("#btn").on("click", function(){
			console.log($("#txt").val());
		})
	})
	
</script>
</head>
<body>
	<input type="text" name="txt" id="txt" />
	<input type="button" value="중복검사" id="btn" />
	<div id="div1"></div>
</body>
</html>