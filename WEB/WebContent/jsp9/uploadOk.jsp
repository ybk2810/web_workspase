<%@page import="vo.ImageVO"%>
<%@page import="dao.ImageDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글처리
	request.setCharacterEncoding("UTF-8");

	// 파일의 저장 경로 OS 경로
	// /web/upload <--
	
	String saveDir = application.getRealPath("/upload");
	
	out.println(saveDir);
	
	// 파일 용량
	int maxFileSize = 1024*1024*100; // 100mb
	
	// cos.jar ==>MultipartRequest
	// file:///C:/Dropbox/Install/cos-26Dec2008/doc/index.html
	// com.oreilly.servlet 
	// Class MultipartRequest
	// 요청객체, 파일경로, 최대사이즈, 인코딩, 이름지정정책
	MultipartRequest mr = 
		new MultipartRequest(request, saveDir, maxFileSize, "UTF-8", 
		new DefaultFileRenamePolicy());
	
	// 파라미터 값 가져오기
	String name = mr.getParameter("txt");
	File f = mr.getFile("dataFile");
	
	out.println("name: " + name);
	out.println("File: " + f.getName());
	
	// db에 저장
	
	ImageDAO dao = new ImageDAO();
	
	ImageVO vo = new ImageVO();
	
	vo.setName(name);
	vo.setFilePath("../upload/"+f.getName());
	
	dao.insertData(vo);
	
	dao.close();
	
	response.sendRedirect("list.jsp");
	
%>

