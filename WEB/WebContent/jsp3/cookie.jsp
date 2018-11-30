<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키(8)</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript">
   window.onload=function(){      
      // 쿠키 생성 : 세션이 종료될때 까지 존재
      $.cookie('id' , 'hong');
        
   
   
   $.cookie('keyword','hot',{expires:7});
   
   console.log("keyword : "+$.cookie('keyword'));
   
   console.log("point : "+$.cookie('point'));
   
   
   //모든 쿠키 가져오기
   console.log($.cookie());
   
   console.log("keyword 쿠키 삭제 : "+ $.removeCookie('keyword'));
   }
   
</script>
</head>
<body>
   
</body>
</html>