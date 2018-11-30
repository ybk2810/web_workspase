<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
	
	$(function(){
	      $("#btn").on("click", function(){
	         
	         var params = "name=" +$("#txt1").val();
	      
	         sendRequest("dbsearch.jsp",params, showImg,"GET");
	      })
	
	})
	function showImg(){
	   if(xhr.readyState==4 && xhr.status == 200){
	      var data = xhr.responseText;
	      data = data.trim();
	      $("img").attr("src", data);
	   }
	
	}
</script>
</head>
<body>
	<h2>사진검색</h2>
	<input type="text" name="txt1" id="txt1" />
	<input type="button" value="btn" id ="btn"  />
	<div id = "div1">
		<img src="" alt="" />
	</div>
</body>
</html>