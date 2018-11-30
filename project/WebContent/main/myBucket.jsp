<%@page import="VO.MaterialVO"%>
<%@page import="DAO.MaterialDAO"%>
<%@page import="java.util.ArrayList"%>
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
	margin-top: 100px;
}
table, td {
	width: 1000px;
	margin: auto;
	text-align : center;
	border-collapse: collapse;
}
#bucket{
	height: 50px;
	border-top: 3px solid green;
	border-bottom: 3px solid green;
}
#contents{
	height: 40px;
}
#cart1{
	width : 100px;
}
#cart2{
	width : 400px;
	border-left: 1px solid lightgray;
}
#cart3{
	width: 300px;
	border-left: 1px solid lightgray;
}
#cart4{
	width : 50px;
	border-left: 1px solid lightgray;
}
#cart5{
	width : 50px;
	border-left: 1px solid lightgray;
}
#cart6{
	width : 100px;
	border-left: 1px solid lightgray;
}

#btm1{
	text-align: right;
}
#btm2{
	text-align: right;
}
#discountImg{
	text-align: center;
	margin-top: 100px;
}

#bucketImg{
	width : 150px;
	height : 150px;
}

</style>
</head>
<body>
	<div id="container">
		<table>
			<tr>
				<td colspan="6" style="height: 50px;"><h1>Shopping List</h1></td>
			</tr>
			<tr id="bucket">
				<td id="cart1">상품번호</td>
				<td id="cart2">이미지</td>
				<td id="cart3">상품명</td>
				<td id="cart4">규격</td>
				<td id="cart5">수량</td>
				<td id="cart6">가격</td>
			</tr>
			<%
				Object obj = session.getAttribute("cart");
				int sum = 0;
				if (obj != null) {
					ArrayList<Integer> list = (ArrayList<Integer>) obj;

					/* out.println("list : " + list); */
					//리스트에서 하나씩 꺼내오기
					MaterialDAO dao = new MaterialDAO();
					for (int it : list) {
						MaterialVO vo = dao.getByNum(it);
						sum =+ vo.getPrice();

						//표만들기
			%>
			<tr id="contents">
				<td ><%= vo.getMno() %></td>
				<td id="contents1"><img src="<%= vo.getImage() %>" alt="" id="bucketImg"/></td>
				<td id="contents2"><%= vo.getMname() %></td>			
				<td id="contents3"><%= vo.getScale() %></td>			
				<td id="contents4"><%= vo.getAmount() %></td>			
				<td id="contents5"><%= vo.getPrice() %></td>
			</tr>
				
		</table>
		<%
				}
				}
			%>		
	
		<table id="btm">
			<tr>
				<td id="btm1">합계 :</td>
				<td><%= sum %></td>
			</tr>
			
			<tr>
				<td id="btm2"><input type="button" value="주문 결제하기" class="pay"/></td>
			</tr>
		</table>
		
		<div id ="discountImg">
			<img src="../Foodie/discount.jpg" alt="discount" />
		</div>
	</div>
</body>
</html>