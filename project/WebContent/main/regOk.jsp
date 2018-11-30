<%@page import="VO.FmemberVO"%>
<%@page import="DAO.FmemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regOk.jsp</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String Nname = request.getParameter("Nname");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		String pnum1 = request.getParameter("pnum1");
		String pnum2 = request.getParameter("pnum2");
		String pnum3 = request.getParameter("pnum3");
		
		FmemberDAO dao = new FmemberDAO();
		FmemberVO vo = new FmemberVO();
		
		vo.setId(id);
		vo.setPw(pw);
		vo.setName(name);
		vo.setNname(Nname);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setAddr3(addr3);
		vo.setPnum1(pnum1);
		vo.setPnum2(pnum2);
		vo.setPnum3(pnum3);
		
		
		//vo에 저장
		dao.addMember(vo);
		dao.close();
		
		//main으로 가기
	%>
	<script type="text/javascript">
		alert("회원가입을 환영합니다");
		alert("로그인 해주세요");
		location.href="main.jsp";
		window.close();
	</script>


</body>
</html>