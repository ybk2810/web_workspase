<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container{
		width: 900px;
		margin: 50px auto;
	}
	
	img{
		width: 320px;
		margin: 80px;
		float: left;
	}
	
	#info{
		border-top: 2px solid #333333;
		width: 300px;
		height: 500px;
		float: right;
		margin: 30px;
	}
	
	table{
		width: 300px;
		height: 480px;
	}
	
	td{
		padding: 20px;
		border-top: 1px solid gray;
	}
	
	#proName{
		font-weight: bold;
		font-size: 20px;
	}
	
	#price{
		width: 40%
	}
	
	#detail{
		clear: both;
		width: 700px;
		text-align: center;
	}
	
	
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#addCart").on("click", function(){
			document.cookie = "username=hong";
			console.log("skldjflksj");
		})
	})
</script>

</head>
<body>
	<%
		String p = request.getParameter("pno");
		if(p!=null){
			int pno = Integer.parseInt(p);
			
			ProductDAO dao = new ProductDAO();
			ProductVO vo = dao.getByNo(pno);
			
			/* out.println(vo.getPname());
			out.println(vo.getPrice()); */

	
	%>
	
	<div id="container">
		<div id="pic">
			<img src="<%=vo.getImgfile() %>" alt="<%=vo.getPname() %>" />
		</div>
		
		<div id="info">
			<table>
				<tr id = "proName">
					<td colspan="2">
						<%=vo.getPno() %>.<%=vo.getPname() %>
					</td>
				</tr>
				<tr>
					<td id="price">price</td>
					<td><%=vo.getPrice() %></td>
				</tr>
				<tr>
					<td>할인율</td>
					<td><%=vo.getDcratio() %></td>
				</tr>
				<tr>
					<td>수량</td>
					<td><%=vo.getQty() %></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" id="addCart" value="즉시구매(쿠키)" />
						<a href="addCart.jsp?pno=<%=vo.getPno()%>">
						<input type="button" id="addCart" value="장바구니(세션)" />
						</a>
					</td>
				</tr>
			</table>
		</div>
		<div id="detail">
			상품상세설명:
			<%=vo.getProdesc() %>
		</div>
	</div>
	
	<%
		}
	%>
</body>
</html>