<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reg.jsp</title>
<style type="text/css">
#div1{
/* color: red; */
display:inline;
}
#red{
color: red;
}
#blue{
color: blue;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

/***ID 중복검사***/
	$(function(){
		$("#id").on("keyup",function(){
			/* console.log("키보드 눌림"); */
			$.ajax({
				url:"fmdbdata.jsp",
				type:'get',
				data:{id:$("#id").val()},
				success:function(data){
					/* console.log("성공"+data) */
						//공백제거
						data=data.trim();
						if(data=="success"){
							$("#div1").html("<span id='red'>존재하는 아이디입니다</span>");
						}else{
							$("#div1").html("<span id ='blue'>사용가능한 아이디입니다</span>");
						}
				}
			});
		})
	})
/*** 주소찾기 ***/
	window.onload=function(){
		var btn1= document.getElementById("faddr");
		btn1.onclick=openDaumAPI;
	}
	function openDaumAPI(){
		/* console.log("test"); */
		//json 타입	
		new daum.Postcode({
				//성공시에 처리할 함수
			oncomplete:function(data){
				//console.dir(data);
				//document.getElementById("pcode1").value=data.zonecode;
				//document.getElementById("pcode2").value=data.postcode;
				//document.getElementById("addr1").value=data.roadAddress;
				document.getElementById("addr1").value=data.zonecode;
				document.getElementById("addr2").value=data.roadAddress;
				//document.getElementById("addr2").value=data.jibunAddress;
				document.getElementById("addr3").value=data.addressEnglish;
			}
		}).open();
	}
	
</script>
</head>
<body>
	<form action="regOk.jsp" method="get">	<h1>회원가입하기</h1>
		<table>
			<tr>
				<th>ID</th>
					<td colspan="3">
					<input type="text" name="id" value="" id="id" />
					<div id="div1"></div>
					</td>
					<td></td>
			</tr>
			<tr>
				<th>비밀번호:</th>
					<td colspan="3">
					<input type="password" name="pw" id="pw" />
					</td>
			</tr>
			<tr>
				<th>이름:</th>
					<td colspan="3">
					<input type="text" name="name" value="" id="name" />
					</td>
			</tr>
			<tr>
				<th>별명:</th>
					<td colspan="3">
					<input type="text" name="Nname" value="" id="Nname" />
					</td>
			</tr>
			<tr>
				<th>주소: </th>
					<td colspan="3">
					<input type="button" name="findaddr" value="주소찾기" id="faddr"/><br />
					<!-- <input type="text" name="pcode1" value="새우편번호" id="pcode1" />
					<input type="text" name="pcode2" value="구우편번호" id="pcode2" /> -->
					<input type="text" name="addr1" value="도로명주소" id="addr1" />
					<input type="text" name="addr2" value="상세주소" id="addr2" />
					<input type="text" name="addr3" value="영문주소" id="addr3" />
					</td>			
			</tr>
			<tr>
				<th>전화번호:</th>
					<td colspan="3">
						<select name="domain" id=pnum>
							<option value="">직접입력</option>
							<option value="010" id="p1">010</option>
							<option value="011" id="p2">011</option>
							<option value="016" id="p3">016</option>
							<option value="018"id ="p4">018</option>
					<input type="text" name="pnum1" id="pnum1" />
					- <input type="text" name="pnum2" id="pnum2" />
					- <input type="text" name="pnum3" id="pnum3" />	
					</td>
			</tr>
			<tr>
				<td colspan="3" id="b">	
					<input type="submit" value="가입합니다" id="btn1"/>
					<input type="button" value="취소합니다" id="btn2"/>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>