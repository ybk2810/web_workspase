<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String p = request.getParameter("mno");
		String fno = request.getParameter("fno");
		
		ArrayList<Integer> list = null;
		int no = Integer.parseInt(p);
		int f = Integer.parseInt(fno);
		Object obj = session.getAttribute("cart");
		if(obj==null){
			list = new ArrayList<Integer>();
			/* list = new ArrayList<ProductVO>(); */
		}else {
			list = (ArrayList<Integer>)obj;
			
		}
		
		//그냥 list에 상품번호를 추가했지만
		//기존에 존재하는 지 여부를 판단해서
		//존재하면 수량만 변경
		//옆으면 list에 추가
		list.add(no);
		
		//테스트용
		//session에 담긴 거 확인하기
		//session은 확인할수없으니까
		for(Integer it : list){
			out.println(it);
		}		
		session.setAttribute("cart", list);
		
		
		/* viewCart.jsp로 이동 redirect 방식 */
 		//response.sendRedirect("myBucket.jsp");
 		response.sendRedirect("mainDetail.jsp?fno="+f);
		
		//표형식
		//상품번호 이미지 제품명 수량 가격
		//상품번호 이미지 제품명 수량 가격
		//상품번호 이미지 제품명 수량 가격
		// 합계                     총각격
		
	%>

</body>
</html>