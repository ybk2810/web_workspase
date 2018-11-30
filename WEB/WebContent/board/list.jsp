<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
table{
	margin: auto;
	width: 800px;
	text-align: center;
}
#container{
width: 900px;
margin: 50px auto;
}
#no{
width:20%
}
#writer{
width:20%
}
#title{
width:40%
}
#hits{
width:10%
}
#regdate{
width:20%
}

</style>
</head>
<body>
<%
BoardDAO dao = new BoardDAO();
int totalCount = dao.getTotal();
//한페이지당 게시물 10개
int countPerpage = 10;
//총페이지수(나머지가 0이면 나눈값만큼 페이지생성:아니면 +1만큼 생성)
int totalPage =(totalCount%countPerpage==0)?totalCount/countPerpage:totalCount/countPerpage+1;

//현재페이지번호
int currentPageno = 1;
String cno = request.getParameter("currentPageno");
if(cno!=null){
	currentPageno = Integer.parseInt(cno);
	
}

//게시물시작번호
int startNo = (currentPageno*countPerpage)-9; 

//게시물끝번호
int endNo = currentPageno*countPerpage;

//출력 시작 페이지 번호
int startPageNo = 1;
//출력 끝 페이지 번호
int endPageNo = 10;

//현재페이지를 기준으로 밑으로 5개 위로 5개
if(currentPageno<6){
	startPageNo=1;
	endPageNo=10;
}else if(currentPageno>=6 && currentPageno+5<totalPage){
	startPageNo = currentPageno -5;
	endPageNo = currentPageno +5;
}else if(currentPageno==totalPage){
	startPageNo = currentPageno -10;
	endPageNo = totalPage;
}

out.println("총게시물건수:"+totalCount + "<br />");
out.println("한페이지당 게시물수:"+countPerpage + "<br />");
out.println("총게시물건수:"+totalPage + "<br />");
out.println("현재페이지번호:"+currentPageno + "<br />");
out.println("페이지시작:"+startNo+ "<br />");
out.println("페이지끝번호:"+endNo + "<br />");
out.println("출력시작페이지:"+startPageNo + "<br />");
out.println("페이지끝번호:"+endPageNo + "<br />");

%>
<div id="container">
<a href="writeForm.jsp">
<center><input type="button" value="글쓰기" /></center>
</a>
<table>
	<caption>
	게시판
	</caption>
		<tr>
			<th id="no">게시물번호</th>
			<th id="writer">작성자</th>
			<th id="title">제목</th>
			<th id="hits">조회수</th>
			<th id="regdate">작성일시</th>
		</tr>
		
<!-- 		글작성하고나면 -->
	<%
	
	ArrayList<BoardVO> list = dao.selectAll(startNo,endNo);
	dao.close();
	
	for(BoardVO vo : list){
	%>
	<tr>
		<td><%=vo.getBno() %></td>
		<td><%=vo.getWriter() %></td>
		<td><a href="detail.jsp?bno=<%= vo.getBno() %>"><%=vo.getTitle() %></a></td>
		<td><%=vo.getHits() %></td>
		<td><%=vo.getRegdate() %></td>
	</tr>
	<%
	}
	%>

	<tr>
		<td colspan="6">
		<%
		for(int i = startPageNo; i<=endPageNo;i++){
			out.println("<a href=list.jsp?currentPageno="+i+"> "+i+" </a>");
		}
		%>
		</td>
	</tr>
</table>
</div>



</body>
</html>