<%@page import="VO.FoodVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.FoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
	$(function(){
		$("#foodsearch").on("click", function(){
			//console.log($("#fname").val());
			var params = "fname="+$("#fname").val();
			sendRequest("foodSearch.jsp", params, getFood, "GET");
		});
	})
	
	function getFood(){
		//비동기화 통신이 완료되고 정상페이지라면
		if(xhr.readyState==4 && xhr.status == 200){
			var data = xhr.responseText;
			console.log(data);
			//공백제거
			data = data.trim();
			
			var div = document.getElementById("cook");
			div.innerHTML=data; 
		}
	}
</script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav"></div>
			<div class="col-sm-8 text-left">
				<h1>Welcome</h1>
				<hr />
				<img src="../image/do2.jpg" alt="" id="img" />
				<hr />
				<h3>Thema</h3>
				<div class="btn-group btn-group-justified">
					<a href="#" class="btn ">일반식</a> 
					<a href="#"	class="btn ">특별식</a> 
					<a href="#"	class="btn ">보양식</a>
					<a href="#"	class="btn ">제철식</a>
					<a href="#"	class="btn ">간식</a>
				</div>
				<hr />
				<h3>cook</h3>
				<div id="cook">
				<%
					FoodDAO dao = new FoodDAO();
					ArrayList<FoodVO> list = dao.getAllData();
					
					for(FoodVO vo : list){
				%>
				<div class="wrap" id="wrap" >
					<%=vo.getFno() %>
					<img src="<%=vo.getFimage() %>" alt="" id="ww" />
					<p><%=vo.getFname() %></p>
					<p><%=vo.getKind() %></p>
					<p><%=vo.getPnum() %>인분</p>
					<p>조리시간 : <%=vo.getCtime() %>분</p>
				</div>
				<%
					}
				%>
				</div>
			</div>
			<div class="col-sm-2 sidenav"></div>
		</div>
	</div>