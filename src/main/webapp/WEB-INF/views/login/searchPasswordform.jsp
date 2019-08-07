<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button onclick="location='searchIDform'">아이디 찾기</button>
	<button disabled="disabled">비밀번호 찾기</button>
	<form action="searchPasswordResult" method="post">
		<table>
			<tr>
				<td>아이디</td><td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>이메일</td><td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td><input type="submit" value="비밀번호 찾기"></td>
			</tr>
		</table>
	</form>
</body>
</html>