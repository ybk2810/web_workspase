<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	   
	<%-- <% 
		//JSTL : 간단한 프로그램 로직구사
		// for문, if문 태그 지원
		// 날짜, 시간, 숫자형식
		// 데이터베이스의 입출력
		// xml문서의 처리
		// 문자열을 처리하는 함수 호출
	%> --%>
	
	<c:set var="num1" value="100" scope="request" />
	<c:set var="num2" value="200" scope="request" />
	
	<jsp:forward page="jstl02.jsp"></jsp:forward>
	<!-- 
	request.setAttribute("num1", "100");
	과 같은 코드
	-->
</body>
</html>