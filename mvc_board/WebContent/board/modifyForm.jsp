<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
	<form action="board.do">
		<table>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" value="${vo.title}" />
					<input type="hidden" name="cmd" value="modifyOk" />
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="writer" value="${vo.writer}" />
					<input type="hidden" name="no" value=${vo.bno} />
				</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${vo.hits}</td>
				<th>작성일</th>
				<td>${vo.regdate}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<textarea name="contents" id="" cols="30" rows="10">${vo.contents}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="button" value="목록" onclick="javascript:history.back();"/>
					<input type="submit" value="수정" />
					<input type="button" value="삭제"/>
				</td>
			</tr>

		</table>
	</form>
</body>
</html>