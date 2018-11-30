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
		$("input").on("click", getText);
	})
	function getText(){
		$.ajax({
			url:'server01.jsp',
			type:'get',
			data:"",
			/* data:{name:value} */
			dataType:"text",
			deforeSend: function(){
				alert("전송전 호출");
			},
			error: function(){alert("에러");},
			complete: function(){alert("완료");},
			success: function(data){
				/* console.dir(data); */
				var dataArray = data.trim().split(",");
				for(var i=0; i<dataArray.length; i++){
					var str = dataArray[i];
					var txt = "<li>" + str + "</li>";
					$("ul").append(txt);
				}
			}
		})
	}
	
</script>
</head>
<body>
	<h2>부서목록</h2>
   
   <input type="button" value="출력" />
   
   <div>
      <ul></ul>
   </div>
</body>
</html>