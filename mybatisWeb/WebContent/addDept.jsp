<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="addDeptOk.jsp">
		<table>
			<tr>
				<th>부서명</th>
				<th>부서위치</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="dname" />
				</td>
				<td>
					<input type="text" name="loc" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="추가" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>