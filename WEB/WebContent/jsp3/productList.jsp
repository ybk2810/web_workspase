<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productList.jsp</title>
<style type="text/css">
/* 초기화  */
* {
   margin: 0px;
   padding: 0px;
}

#container {
   width: 1000px;
   margin: auto;
}

img {
   width: 150px;
   height: 150px;
}

p {
   text-align: center;
}

.wrap {
   width: 150px;
   float: left;
   border: 1px solid red;
   padding: 20px;
   margin: 20px;
}

.del {
   text-decoration: line-through;
}

.red {
   color: red;
}
</style>
</head>
<body>
   <div id="container">
      <%
         ProductDAO dao = new ProductDAO();

         ArrayList<ProductVO> list = dao.getAllData();

         //out.println(list);
         
         for (ProductVO vo : list) {
      %>
      <!-- out.println("<h2>"+vo.getPno());
         out.println(vo.getPname());
         out.println(vo.getPrice()+"</h2>"); -->
      <div class="wrap">
         <%=vo.getPno()%>
         <!-- 그림클릭하면 상세페이지 보도록 만들기 a태그로 그림파일 감싸기  -->
         <a href="productDetail.jsp?pno=<%=vo.getPno()%>">
         <img src="<%=vo.getImgfile()%>" alt="" />
         </a>
         
         <p><%=vo.getPname()%></p>
         <p class="del"><%=vo.getPrice()%></p>
         <p><%=vo.getDcratio()%>
            %할인
         </p>
         <p class="red">주문폭발</p>
         <p>
            판매가:
            <%=Math.round(vo.getPrice() * (1 - vo.getDcratio() * 0.01))%></p>
         <p>
            <input type="button" value="즉시구매" /> <input type="button"
               value="장바구니" />
         </p>
      </div>
      <%
         }
      %>
   </div>

</body>
</html>