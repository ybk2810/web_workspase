<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
	<form action="board.do">
		<table>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" id=""/>
					<input type="hidden" name="cmd" value="insert"/>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="writer" id=""/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<textarea name="contents" id="" cols="30" rows="10"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="글쓰기"/></td>
			</tr>

		</table>
	</form>
</body>
</html>