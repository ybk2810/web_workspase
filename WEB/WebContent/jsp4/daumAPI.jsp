<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>daumAPI</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	window.onload = function(){
		var btn1 = document.getElementById("btn1");
		btn1.onclick = openDaumAPI;
	}
	function openDaumAPI(){
		console.log("test");
		new daum.Postcode({
			// 성공시에 처리할 함수
			oncomplete: function(data){
				console.dir(data);
				document.getElementById("addrs").value=data.postcode1;
				document.getElementById("addrs2").value=data.postcode2;
				document.getElementById("addrs3").value=data.addressEnglish;
			}
		}).open();
	}
</script>
</head>
<body>
	<input type="text" name="" id="post1" />
	<input type="button" value="우편번호찾기"  id="btn1" /> <br />
	<input type="text" name="" id="addrs" disabled="disabled" />
	<input type="text" name="" id="addrs2" disabled="disabled" />
	상세주소
	<input type="text" name="" id="addrs3" disabled="disabled" />
</body>
</html>