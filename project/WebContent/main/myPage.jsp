<%@page import="VO.FmemberVO"%>
<%@page import="DAO.FmemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/maincss.css" />
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
.container{
	width: 1200px;
}
#userInfoTitle{
	margin-right: 200px;
}
.infoTitle{
	font-size: 17px;
	font-weight: bold;
	
}
tr{
	margin-top: 50px;
}

.userInfo{
	width: 1000px;
	margin-left: 120px;
}
.deliverInfo{
	width: 1000px;
	margin-left: 120px;
}
#like{
	width: 1000px;
	margin-left: 120px;
}
#recipe{
	width : 400px;
	height: 300px;
	border: 1px solid orange;
	float: left;
	margin-left: 120px;
}
#bucket{
	width : 400px;
	height: 300px;
	border: 1px solid orange;
	margin: auto;
	
}
#reviewInfo{
	width : 800px;
	height : 300px;
	border : 1px solid orange;
	margin : auto;
	clear: both;
}
</style>
</head>
<body>
<%
	String pid = (String)session.getAttribute("id");
	FmemberDAO dao = new FmemberDAO();
	FmemberVO vo = dao.selectOne(pid);
	boolean isOk = dao.isExist(pid);
	dao.close();
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
                  <li><a href="#">일반식</a></li>
                  <li><a href="#">특별식</a></li>
                  <li><a href="#">보양식</a></li>
                  <li><a href="#">제철식</a></li>
                  <li><a href="#">간식</a></li>
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
               value="검색" />
        		<%
					if(isOk){
				%>
					<a href="myPage.jsp"><input type="button" value="마이페이지" id="mypage" /></a>
					<a href="logout.jsp"><input type="button" value="로그아웃" id="logout" /></a>
				<%
					}else{
				%>
					<input type="button" value="로그인" id="login" />
					<input type="button" value="회원가입" id="reg" />
				<%
					}
				%>
         </div>
      </div>
   </nav>
   
<div class="container">
	<table class="userInfo">
		<tr>
			<td rowspan="5" id="userInfoTitle"><h1>회원정보</h1></td>
		</tr>
		<tr>
			<td class="infoTitle">이름 : </td>
			<td><%=vo.getName() %></td>
		</tr>
		<tr>
			<td class="infoTitle">닉네임 :</td>
			<td><%=vo.getNname() %></td>
		</tr>
		<tr>
			<td class="infoTitle">연락처 :</td>
			<td><%=vo.getPnum1() %>-<%=vo.getPnum2() %>-<%=vo.getPnum2() %></td>
		</tr>
		<tr>
			<td class="infoTitle">주소</td>
			<td>
			도  <%=vo.getAddr1() %><br />
			시/군/구 <%=vo.getAddr2() %><br />
			상세주소  <%=vo.getAddr3() %>
			</td>
		</tr>
	</table>
	<hr />
	<table class="deliverInfo">
		<tr>
		<td rowspan="4"><h1>배송지정보</h1></td>
		</tr>
		<tr>
			<td>
			도  <%=vo.getAddr1() %><br />
			시/군/구 <%=vo.getAddr2() %><br />
			상세주소 <%=vo.getAddr3() %>
			</td>
		</tr>
	</table>
	
	<hr />
	
	<table id="recipe">
			<tr>
			<th colspan="2">
			<h4>찜한 레시피</h4>
			</th>
			</tr>
			<tr>
			<td colspan="2">내가 찜한 레시피 0 건</td>
			</tr>
			<tr>
			<td colspan="2"><a href="myRecipe.jsp">보러가기→</a></td>
			</tr>
	</table>
			
	<table id="bucket">	
		<tr>
			<th colspan="2">
			<h4>장바구니</h4>
			</th>
			</tr>
			<tr>
			<td colspan="2">담긴 물건 0 건</td>
			</tr>
			<tr>
			<td colspan="2"><a href="myBucket.jsp">보러가기→</a></td>
			</tr>
	
	</table>
	
	<hr />
	
	<table id="reviewInfo">
		<tr>
			<th colspan="4">나의 활동</th>
		</tr>
		<tr>
			<th colspan="2">작성한 리뷰</th>
			<th colspan="2">1:1 문의</th>
		</tr>
		<tr>
			<td colspan="2">남긴 리뷰 0건</td>
			<td>문의 0건</td>
			<td>답변완료  0건</td>
		</tr>
	</table>
</div>

</body>
</html>