<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax01.jsp</title>
	<!-- 
		Ajax (Asynchronous Javascript and XML)
		장점: 
			페이지 이동 없이 고속으로 화면을 전환할 수 있다.
			서버 처리를 기다리지 않고, 비동기 요청이 가능하다.
			수신하는 데이터 양을 줄일수 있고 클라리언트에게 처리를 위임할 수 있다.
		
		단점:
			ajax를 쓸 수 없는 브라우저
			http 클라이언트의 기능이 한정
			페이지 이동없는 통신으로 인한 보안상의 문제
			요청을 남발하면 역으로 서버 부하가 늘 수 있음
	 -->
<script type="text/javascript">
	// 비동기 통신을 담당하는 객체 : XMLHttprequest
	
	var xhr = null;
	
	// 크로스 브라우징을 위해
	function getXMLHttpRequest(){
		// MS 브라우저
		if(window.ActiveXObject){
			try{
				return new ActiveXObject("MsMXL2.XMLHTTP");
			}catch (e){
				try{
					return new ActiveXObject("Microsoft.XMLHTTP")
				}catch (e1){
					return null;
				}
			}
		}else if(window.XMLHttpRequest){
			return new XMLHttpRequest();
		}else{
			return null;
		}
	}
	
	function load(url){
		// 1. XMLHttpRequest객체
		xhr = getXMLHttpRequest();
		
		// 2. callback 함수 정의
		// callback: 대기하고 있다가 응답이 오면 자동으로 호출되는 함수
		xhr.onreadystatechange = viewMessage;
		
		// 3. open("방식", 접근주소, 비동기화 여부)
		xhr.open("GET", url, true);
		// true: 비동기방식, false: 동기화
		
		// 4.send();
		xhr.send();
		
		// POST 방식 : send("전달파라미터")
		// GET 방식 : send();
	}
	
	function viewMessage(){
		// console.log("비동기통신중." + xhr.readyState);
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log(xhr.responseText);
			var div = document.getElementById("divData");
			div.innerHTML = "<h2>" + xhr.responseText + "</h2>";
		}
	}
</script>
</head>
<body>

	<h3>Ajax</h3>
	<a href="simple1.txt">simple1.txt</a>
	
	<!-- simple1.txt 버튼을 누르면 load()함수를 호출 
	load()에 간단한 메세지를 브라우저 콘솔에 출력
	-->
	<input type="button" value="simple1.txt" onclick="load('simple1.txt');"/>
	<input type="button" value="simple1.jsp" onclick="load('simple1.jsp');"/>
	<input type="button" value="simple2.txt" onclick="load('simple2.txt');"/>
	<input type="button" value="simple2.jsp" onclick="load('simple2.jsp');"/>

	
	<div id="divData">
	</div>
	<%
	
	%>
</body>
</html>