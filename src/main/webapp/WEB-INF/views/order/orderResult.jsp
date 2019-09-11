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
<style>
.container {
	width: 60% !important;
	margin: 0 auto;
	padding: 5%;
}

.pd {
	padding: 0 !important;
}

.progress-bar {
	background-color: #ABD0CE !important;
	margin: 0;
}

.jumbotron {
	display: flex;
	flex-direction: column;
}

img {
	width: 50%;
	margin: 5% auto;
}

h3, p {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 progress progress-striped active pd">
				<div class="progress-bar" role="progressbar" aria-valuenow="100"
					aria-valuemin="0" aria-valuemax="100" style="width: 100%">100%</div>
			</div>
			<div class="jumbotron">
				<img alt="success" src="/resources/image/high-five.png">
				<h3>주문이 완료되었습니다!</h3>
				<p>
					Handius를 이용해 주셔서 감사합니다.<br>주문 내역은 마이 페이지 > 나의 구매 내역에서 확인하실 수
					있습니다.<br> <a href="/productDetail/${orderDTO.list_no }">이전
						페이지로</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>