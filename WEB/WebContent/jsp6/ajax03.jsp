<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax03.jsp</title>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
/* 
검색버튼을 누르면 searchData()함수를 호출
dbdata.jsp?no=10
		
해당 부서의 정보를 가져와 
div영역에 부서정보를 출력하세요

부서번호: 10
부서명: ACCOUNDING
부서위치: NEW YORK
*/
	function searchData(){
		var deptno = document.getElementById("no").value;
		var params = "no=" + deptno;
		sendRequest("dbdata.jsp", params, findData, "GET")
	}
	
	function findData(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var div = document.getElementById("div1");
			var data = eval("(" + xhr.responseText + ")");
			console.dir(data);
			
			div1.innerHTML="<div>" + 
			"부서번호: " + data.data.deptno + "</div>" +
			"부서이름: " + data.data.dname + "</div>" +
			"부서위치: " + data.data.loc + "</div>" +
			"</div>";
		}
	}
</script>
</head>
<body>
	<input type="text" name="no" id="no" />
	<input type="button" value="검색" onclick="searchData();"/>
	<div id = "div1"></div>
</body>
</html>