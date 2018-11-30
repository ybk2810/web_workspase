<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jqueryAjax01.jsp</title>
<style type="text/css">
	img{
		width: 700px;
		height: 600px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("img").on("click",function(){
			/* console.log("nice"); */
			/* $("img").attr("src","../images/nice2.jpg") */
			$.ajax({
				type:"GET",
				async: true,
				url: "getJSON.jsp",
				dataType: "html",
				// 전송받을 데이터: html, xml, json
				// getJDON.JSP?id=aaa&ps=bbb
				data: {"id": "aaa", "pw": "bbb"},
				success: function(response, status, request){
					console.log("success");
					//console.log(response);
					$("img").attr("src",response);
				},
				error: function(response, status, request){
					console.log("error");
				},
				complete: function(){
					console.log("Ajax 통신 끝");
					$("img").fadeIn(2000);
				},
				beforeSend: function(){
					$("img").fadeOut(2000);
				}
			});
		})
		
	})
</script>
</head>
<body>
	<img src="../images/nice.jpg" alt="nice" />
</body>
</html>