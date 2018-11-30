<%@page import="vo.DeptVO"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
String n = request.getParameter("no");
if(n!=null){
	int no = Integer.parseInt(n);
	DeptDAO dao = new DeptDAO();
	DeptVO vo = dao.selectOne(no);
	dao.close();
	int deptno = vo.getDeptno();
	String dname = vo.getDname();
	String loc = vo.getLoc();
	
	
	/* 화면에 이 결과를 JSON출력 */
	out.println("{ data: { deptno: " + deptno + ", dname: '" + dname + "', loc: '" + loc + "'}}");

}
%>