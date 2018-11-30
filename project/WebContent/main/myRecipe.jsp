<%@page import="java.util.ArrayList"%>
<%@page import="VO.FoodVO"%>
<%@page import="DAO.FoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
#container{
	width: 1200px;
	height: 800px;
	margin: auto;
	padding: auto;
}
#head{
	width : 800px;
	margin: auto;
	margin-top: 100px;
	text-align: center;
}
#recommend{
	width: 800px;
	margin: auto;
	text-align: center;
	border: 1px solid black;
}
#recipe1{
	width : 200px;
	border: 1px solid black;
}
#recipe2{
	width : 300px;
	border: 1px solid black;
}
#recipe3{
	width: 200px;
	border: 1px solid black;
}
#recipe4{
	width : 100px;
	border: 1px solid black;
}
#suhobabo{
	width: 200px;
	height: 150px;
	
}
</style>
</head>
<body>
<% 
// 	String no = request.getParameter("no");
// 	int fno = Integer.parseInt(no);
	FoodDAO dao = new FoodDAO();
	ArrayList<Integer> list = dao.getByRandom();
%>
<div id="container">
	<table id = "head">
		<tr>
			<td colspan="4" style="height: 50px;"><h1>MY RECIPE</h1></td>
		</tr>
		<tr>
			<td colspan="4" style="height: 50px;"><hr /></td>
		</tr>
		<tr>
			<td style="height: 50px;">
				<input type="radio" name="전체선택" id="selectAll"/>전체선택
				|<a href="#">삭제</a>
			</td>
			<td style="height: 50px;">
				<select name="selectTheme" id="" onchange="changeList">
				<option value="theme">테마선택</option>
				<option value="normal">일반식</option>
				<option value="special">특별식</option>
				<option value="healthy">보양식</option>
				<option value="season">제철식</option>
				<option value="light">간식</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="height: 50px;"><hr /></td>
		</tr>
		<tr>
			<td id="recipe1">음식번호</td>
			<td id="recipe2">이름</td>
			<td id="recipe3">사진</td>
			<td id="recipe4">테마</td>
		</tr>
		<tr>
			<td>음식번호</td>
			<td>이름</td>
			<td>사진</td>
			<td>테마</td>
		</tr>
		<tr>
			<td colspan="4" style="height: 50px;"><hr /></td>
		</tr>
	</table>
	<table id="recommend">
		
		<tr>
			<td colspan="4">
			<strong>다른 레시피도 요리해보셈ㅋ</strong>
			</td>
		</tr>
		<tr>
		<%
			for(Integer x : list){
				FoodVO vo = dao.getByNum(x);
		%>
			<td>
				<div><img src="<%= vo.getFimage() %>" alt="fimg" id="suhobabo" /></div>
				<div><%= vo.getFname() %></div>
				<div><%= vo.getCtime() %></div>
			</td>
		<%
			}
		%>
		</tr>
	</table>
</div>
</body>
</html>