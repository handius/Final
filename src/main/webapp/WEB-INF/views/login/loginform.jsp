<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="loginResult" method="post">
		<table>
			<tr>
				<td>아이디</td><td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td><td><input type="text" name="password"></td>
			</tr>
			<tr>
				<td><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
	<button onclick="location='searchID'">아이디 찾기</button>
	<button onclick="location='searchPasswordform'">비밀번호 찾기</button>
</body>
</html>