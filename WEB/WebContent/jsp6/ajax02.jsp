<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax02.jsp</title>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
	function helloToServer(url){
		var id = document.getElementById("name").value;
		var pw = document.getElementById("pw").value;
		
		var params = "id=" + id + "&pw=" + pw
		console.log(params)
		sendRequest("hello.jsp", params, callback, "GET");
	}
	
	function callback(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var div = document.getElementById("div1");
			div.innerHTML = "<h2>" + xhr.responseText + "</h2>";
		}
	}
	
</script>
</head>
<body>
	<p>
		버튼을 누르면 hello.jsp의 내용을 div영역에 출력하고자 한다.
	</p>
	
	<form action="">
	ID: <input type="text" name="name" id="name" />	<br />
	PW: <input type="text" name="pw" id="pw" />	<br />
	<input type="button" value="입력" onclick="helloToServer('hello.jsp');"/>
	</form>
	
	<div id="div1">
	</div>
</body>
</html>