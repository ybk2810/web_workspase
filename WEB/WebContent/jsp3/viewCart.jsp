<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewCart.jsp</title>
<style type="text/css">
	#container{
		width: 1000px;
		margin: 50px auto;
	}
	img{
		width: 100px;
		height: 100px;
	}
	
	table,td{
		border: 1px solid red;
		width: 1000px;
		margin: auto;
		text-align: center;
		border-collapse: collapse;
	}
	
	#info{
		border-top: 2px solid #333333;
		background-color: gray;
	}
	
	#payment{
		background-color: red;
		color: white;
		width: 150px;
		height: 75px;
	}
	
	
</style>
</head>
<body>
	<h2>일반상품</h2>
	<table>
		<tr id="info">
			<td>상품번호</td>
			<td>image</td>
			<td>상품명</td>
			<td>수량</td>
			<td>상품가격</td>
		</tr>
<%
int sum = 0;
	Object obj = session.getAttribute("cart");
	if(obj!=null){
		ArrayList<Integer> list = (ArrayList<Integer>)obj;
		
/* 		out.println("list: " + list); */

		ProductDAO dao = new ProductDAO();
		
		
		for(int it: list){
			ProductVO vo = dao.getByNo(it);

%>
			<tr>
				<th><%= vo.getPno()%></th>
				<th><img src="<%=vo.getImgfile() %>" alt="<%=vo.getPname() %>" /></th>
				<th><%=vo.getPname() %></th>
				<th><input type="text" name="" id=""  size="3" value="1"/></th>
				<th><%=vo.getPrice() %></th>
			</tr>


<%
		}
		
		%>
		<tr id="info2">
			<td colspan="5">
			상품구매금액
			 <%= sum %>
			 + 배송비
			 <% 
			 if(sum>=100000) {
			 	int dc=0;
			 }else {
				int dc=3000;
			 }

			 %>
			 = 합계 : 
			 <%= sum %>
			 원
			</td>
		</tr>
		<tr>
			<td colspan="5">
				<%-- <a href="addCart.jsp?pno=<%=vo.getPno()%>"> --%>
				<input type="button" id="payment" value="선택상품 주문" />
				<!-- </a> -->
			</td>
		</tr>
		
		<%
	}
%>





	</table>
</body>
</html>