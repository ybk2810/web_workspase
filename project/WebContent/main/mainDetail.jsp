<%@page import="DAO.ReviewDAO"%>
<%@page import="VO.ReviewVO"%>
<%@page import="VO.MaterialVO"%>
<%@page import="DAO.MaterialDAO"%>
<%@page import="VO.FoodVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.FoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainDetail</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<style type="text/css">
	#nav {
	   height: 80px;
	   text-align: center;
	}
	
	#logo {
	   clear: none;
	   margin-left: 550px;
	   margin-top: 10px;
	   /* margin: 10px auto; */
	   color: white;
	   font-size: 40px;
	}
	
	#search {
	   margin-top: 30px;
	   margin-right: 30px;
	}

	#container{
		width: 1000px;
		margin: 0px auto;
	}
	img{
		width: 660px;
		height: 520px;
		margin: 0px;
		float: left;
	}
	#info{
		border-top: 2px solid #333333;
		width: 340px;
		height: 520px;
		float: right;
		margin: 0px;
	}
	#detail{
		clear:both;
		width: 1000px;
		height: 200px;
		margin: 0px;
	}
	#recipeimg{
		width: 1000px;
		height: 4100px;
		margin: 0px;
	}
	#material{
		clear: none;
	}
	#materialDetail{
		width: 180px;
		height: 400px;
		margin: 10px;
		float: left;
	}
	#mImg{
		width: 180px;
		height: 180px;
	}
	#review{
		clear: both;
		margin: auto;
	}
</style>
</head>
<body>
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
               <a class="navbar-brand" href="#"><p id="logo">WebSiteName</p></a>
            </div>
         </ul>
         <div id="search">
            <input type="text" name="fname" id="fname" /> <input type="button"
               value="검색" />
         <input type="button" value="로그인" />
         <input type="button" value="회원가입" />
         </div>
      </div>
   </nav>

	<%
		String id = (String)session.getAttribute("id");
		String f = request.getParameter("fno");
		if(f!=null){
			int fno = Integer.parseInt(f);
			
			FoodDAO dao = new FoodDAO();
			
			FoodVO vo = dao.getByNum(fno);
			
			dao.close();
	%>
	
	<div id="container">
		<h1>레시피 쇼핑</h1>
		
		<img src="<%=vo.getFimage() %>" alt="<%=vo.getFname() %>" />
		
		<div id="info">
			<table>
				<tr id = "proName">
					<td colspan="2">
						<h2><%=vo.getFname() %></h2>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<p>
						<strong><%=vo.getKind() %> </strong>
						<span><%=vo.getPnum() %>인분 </span>
						<span><%=vo.getCtime() %>분 </span>
						</p>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="shopping">
			<h3>올가 레시피 쇼핑하기</h3>
		</div>
		<div id="material">
		<%
			MaterialDAO dao2 = new MaterialDAO();
			String m []=vo.getMfno().split(",");
			for(int i=0; i<m.length; i++){
				int mno = Integer.parseInt(m[i]);
				MaterialVO vo2 = dao2.getByNum(mno);
		%>	
			<div id="materialDetail">	
				<p><input type="checkbox" name="cart" value="<%=vo2.getMno() %>" /><p>
				<p><img src="<%=vo2.getImage() %>" alt="" id="mImg" /> </p>
				<p><%=vo2.getMname() %></p>
				<p><%=vo2.getPrice() %></p>	
				<a href="addCart.jsp?mno=<%= vo2.getMno() %>&&fno=<%= vo.getFno()%>"><input type="button" value="장바구니담기" id="addCart" /></a>
			</div>
		<%
			}
		%>
	<div>
		<a href="myBucket.jsp">
		<input type="button" value="장바구니가기" id="addCart" />
		</a>
		</div>
		<div id="detail">
			<h3>만들어보세요</h3>
			<img src="<%=vo.getRecipeimg() %>"  id="recipeimg"/>
		</div>
	</div>
	
	<% 
	
   	ReviewDAO dao1 = new ReviewDAO();
   %>
<br />
		<form action="reviewOk.jsp">
	  	 <table id="review">
	      <tr>
	         <td>글작성</td>
	         
	         <td><textarea name="contents" id="txt" cols="100" rows="3"></textarea></td>
	         <td><input type="hidden" name="fno" value="<%=vo.getFno() %>" />
	         <input type="hidden" name="id" value="<%=id %>" />
	         <input type="submit" value="글쓰기" /></td>
	      </tr>
	   </table>
	   </form>
<%
   
   ArrayList<ReviewVO> list = dao1.selectAll(fno);
   dao.close();
   
   for(ReviewVO vo3 : list){
   %>
   <table id="review1">
   <tr>
      <td><%= vo3.getRno() %></td>
      <td><%=vo3.getRwriter()%></td>
      <td><%= vo3.getRcontents() %></td>
      <td><%=vo3.getRegdate() %></td>
   </tr>
   <tr>
      <td><%=vo3.getStar() %></td>
   </tr>
   </table>
	
	<%
 		  }
		}
	%>
	
	
</body>
</html>