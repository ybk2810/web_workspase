<%@page import="DAO.FmemberDAO"%>
<%@page import="VO.FoodVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.FoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thema</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
	$(function() {
		$("#foodsearch").on("click", function() {
			//console.log($("#fname").val());
			var params = "fname=" + $("#fname").val();
			sendRequest("foodSearch.jsp", params, getFood, "GET");
		});
		$("#login")
				.on(
						"click",
						function() {
							// window.open(URL,"팝업 구분값(팝업 1개일 경우 상관없음)","팝업 창 옵션")
							window
									.open(
											"login.jsp",
											"로그인",
											"width=600, height=400, top = 200, left = 500, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
						});
		$("#reg")
				.on(
						"click",
						function() {
							window
									.open(
											"regForm.jsp",
											"회원가입",
											"width=600, height=400, top = 200, left = 500, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
						});
		$(".btn").on("click", function() {
			console.log($(".btn").text);
		});
	})

	function getFood() {
		//비동기화 통신이 완료되고 정상페이지라면
		if (xhr.readyState == 4 && xhr.status == 200) {
			var data = xhr.responseText;
			console.log(data);
			//공백제거
			data = data.trim();

			var div = document.getElementById("cook");
			div.innerHTML = data;
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
<link rel="stylesheet" href="../css/maincss.css" />
</head>
<body>
	<%
		FmemberDAO memberdao = new FmemberDAO();
		String id = (String) session.getAttribute("id");
		boolean isOk = memberdao.isExist(id);
	%>
	<nav class="navbar navbar-inverse" id="nav">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">---<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="main.jsp"><strong>홈</strong></a></li>
						<li role="presentation" class="divider"></li>
						<li><a href="#"><strong>요리테마</strong></a></li>
						<li><a href="thema.jsp?kind=일반식">일반식</a></li>
						<li><a href="thema.jsp?kind=특별식">특별식</a></li>
						<li><a href="thema.jsp?kind=보양식">보양식</a></li>
						<li><a href="thema.jsp?kind=제철식">제철식</a></li>
						<li><a href="thema.jsp?kind=간식">간식</a></li>
						<li role="presentation" class="divider"></li>
						<li><a href="myPage.jsp"><strong>마이페이지</strong></a></li>
						<li role="presentation" class="divider"></li>
						<li><a href="#"><strong>공지사항</strong></a></li>
					</ul></li>
				<div class="navbar-header">
					<a class="navbar-brand" href="main.jsp"><p id="logo">WebSiteName</p></a>
				</div>
			</ul>
			<div id="search">
				<input type="text" name="fname" id="fname" /> <input type="button"
					value="검색" id="foodsearch" />
				<%
					if (isOk) {
				%>
				<a href="myPage.jsp"><input type="button" value="마이페이지"
					id="mypage" /></a> <a href="logout.jsp"><input type="button"
					value="로그아웃" id="logout" /></a>
				<%
					} else {
				%>
				<input type="button" value="로그인" id="login" /> <input type="button"
					value="회원가입" id="reg" />
				<%
					}
				%>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav"></div>
			<div class="col-sm-8 text-left">
				<h2>Thema</h2>
				<div class="btn-group btn-group-justified">
					<a href="thema.jsp?kind=일반식" class="btn">일반식</a> 
					<a href="thema.jsp?kind=특별식"	class="btn">특별식</a> 
					<a href="thema.jsp?kind=보양식"	class="btn">보양식</a>
					<a href="thema.jsp?kind=제철식"	class="btn">제철식</a>
					<a href="thema.jsp?kind=간식"	class="btn">간식</a>
				</div>
				<hr />
				<h2>cook</h2>
				<div id="cook">
					<%
						String kind = request.getParameter("kind");

						FoodDAO dao = new FoodDAO();
						ArrayList<Integer> list = dao.getByKind(kind);

						for (Integer x : list) {
							FoodVO vo = dao.getByNum(x);
					%>
					<div class="wrap" id="wrap">
						<%=vo.getFno()%>
						<a href="mainDetail.jsp?fno=<%=vo.getFno()%>"> <img
							src="<%=vo.getFimage()%>" alt="" id="ww" />
						</a>
						<p><%=vo.getFname()%></p>
						<p><%=vo.getKind()%></p>
						<p><%=vo.getPnum()%>인분
						</p>
						<p>
							조리시간 :
							<%=vo.getCtime()%>분
						</p>
					</div>
					<%
						}
						dao.close();
					%>
				</div>
			</div>
			<div class="col-sm-2 sidenav"></div>
		</div>
	</div>
</body>
</html>