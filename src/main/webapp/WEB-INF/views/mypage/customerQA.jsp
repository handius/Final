<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Comfortaa', '맑은 고딕', cursive;
}
</style>
</head>
<body>
	<form method="post" action="customerQAResult">
		<ul>
			<li><select name="question_type">
					<option value="문의하기">문의하기</option>
					<option value="신고하기">신고하기</option>
					<option value="작가신청">작가신청</option>
			</select></li>
			<li><label for="question_title">제목</label> <input type="text"
				name="question_title" id="question_title"></li>
			<li><label for="question_content">내용</label> <textarea
					name="question_content" id="question_content" rows="5" cols="30"></textarea></li>
			<li><input type="submit" value="문의하기"></li>
		</ul>
	</form>
</body>
</html>