<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button disabled="disabled">아이디 찾기</button>
	<button onclick="location='searchPasswordform'">비밀번호 찾기</button>
	<form action="searchIDResult" method="post">
		<table>
			<tr>
				<td>이름</td><td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>이메일</td><td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td><input type="submit" value="아이디 찾기"></td>
			</tr>
		</table>
	</form>
</body>
</html>