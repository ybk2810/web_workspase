<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="../css/maincss.css" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<nav class="navbar navbar-inverse" id="nav">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">---<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#"><strong>홈</strong></a></li>
						<li role="presentation" class="divider"></li>
						<li><a href="#"><strong>요리테마</strong></a></li>
						<li><a href="#">일반식</a></li>
						<li><a href="#">특별식</a></li>
						<li><a href="#">보양식</a></li>
						<li><a href="#">제철식</a></li>
						<li><a href="#">간식</a></li>
						<li role="presentation" class="divider"></li>
						<li><a href="#"><strong>마이페이지</strong></a></li>
						<li role="presentation" class="divider"></li>
						<li><a href="#"><strong>공지사항</strong></a></li>
					</ul></li>
				<div class="navbar-header">
					<a class="navbar-brand" href="main2.jsp"><p id="logo">WebSiteName</p></a>
				</div>
			</ul>
			<div id="search">
				<input type="text" name="fname" id="fname" /> 
				<input type="button" value="검색" id="foodsearch" />
			<input type="button" value="로그인" />
			<input type="button" value="회원가입" />
			</div>
		</div>
	</nav>