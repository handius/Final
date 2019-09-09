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

.container {
	background-color: #F0E5DE;
	margin: 5%;
	padding: 3% 5% !important;
	border-radius: 5%;
}

.container * {
	margin: 5px;
}

.container h1 {
	color: white;
	font-size: 3vw;
	font-weight: bold;
	text-shadow: 0 0 2px #7C7877;
}

.container hr {
	width: 45%;
	margin: 1%;
	border: 1px solid #D9D4CF;
}

.form-group {
	width: 55%;
}

.form-group select {
	width: 30%;
}

.row {
	display: flex;
	justify-content: center;
}

.button {
	width: 10%;
	background-color: #ABD0CE;
	color: white;
	border: 3px solid #ABD0CE;
	font-size: 15px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="container">
		<h1>1:1문의하기</h1>
		<hr> 
		<form method="post" action="customerQAResult">
			<div class="form-group">
				<label for="question_type">문의유형</label> <select name="question_type"
					id="question_type" class="form-control">
					<option value="문의하기">문의하기</option>
					<option value="신고하기">신고하기</option>
					<option value="작가신청">작가신청</option>
				</select>
			</div>
			<div class="form-group">
				<label for="question_title">제목</label><input type="text"
					name="question_title" id="question_title" class="form-control">
			</div>
			<div class="form-group">
				<label for="question_content">내용</label>
				<textarea name="question_content" id="question_content" rows="5"
					cols="30" class="form-control"></textarea>
			</div>
			<div class="row">
				<input type="submit" value="문의하기" class="button">
			</div>
		</form>
	</div>
	<script>
		jQuery('form').submit(function() {
			alert('문의가 완료되었습니다.');
		});
	</script>
</body>
</html>