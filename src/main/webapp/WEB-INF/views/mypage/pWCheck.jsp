<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
<link
	href="https://fonts.googleapis.com/css?family=Poor+Story&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Comfortaa', '맑은 고딕', cursive;
}

.jumbotron {
	width: 100%;
	height: 400px;
	background-image: url("/resources/image/mypage/key.jpg");
	background-size: cover;
	background-position: 0 45%;
	padding: 0;
	margin-bottom: 0 !important;
}

.nav {
	height: 50px;
	border-bottom: 1px solid silver;
	background-color: #D9D4CF;
}

.items {
	display: flex;
}

.item {
	flex-grow: 1;
	line-height: 50px;
	text-align: center;
	font-size: 19px;
	font-weight: bold;
}

.item a {
	color: rgba(93, 93, 93);
	font-family: 'Comfortaa', 'Poor Story', cursive;
	text-decoration: none;
}

.container {
	display: flex;
	flex-direction: column;
	justify-content: space-around;
	background-color: white;
	margin: 5% 3%;
	padding: 3% 5% !important;
	border: 5px solid #ddd;
}

.container * {
	margin: 5px;
}

.container h1 {
	color: #7C7877;
	font-size: 3vw;
	font-weight: bold;
}

.container hr {
	width: 45%;
	margin: 3% 1%;
	border: 1px solid #7C7877;
}

.container form {
	margin: 5% 0;
}

#password {
	width: 50%;
}

.btn {
	width: 100px;
	margin: 0;
}
</style>
</head>
<body>
	<div class="jumbotron"></div>
	<div class="visible-md visible-lg nav">
		<div class="items">
			<div class="item"></div>
			<div class="item">
				<a href="/pWCheck">회원 정보 수정</a>
			</div>
			<div class="item">
				<a href="/buyList">나의 구매 내역</a>
			</div>
			<div class="item">
				<a href="/cQAList">나의 고객 문의</a>
			</div>
			<div class="item">
				<a href="/buyerPQAList">나의 상품 문의</a>
			</div>
			<div class="item">
				<a href="/buyerReviewList">나의 상품 후기</a>
			</div>
			<sec:authorize access="hasRole('ROLE_SELLER')">
				<div class="item">|</div>
				<div class="item">
					<a href="/registerList">나의 등록 내역</a>
				</div>
				<div class="item">
					<a href="/sellList">나의 판매 내역</a>
				</div>
				<div class="item">
					<a href="/sellerPQAList">상품 문의 관리</a>
				</div>
				<div class="item">
					<a href="/sellerReviewList">상품 후기 관리</a>
				</div>
			</sec:authorize>
			<div class="item"></div>
		</div>
	</div>
	<div class="container">
		<h1>비밀번호확인</h1>
		<small class="text-muted">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시
			확인합니다.</small>
		<hr>
		<form method="post" action="pWCheckResult" class="form-inline">
			<input type="password" name="password" id="password"
				class="form-control"> <input type="submit" value="확인"
				class="btn btn-default">
		</form>
	</div>
	<script>
		var msg = '${msg}';
		if (msg != "" && msg != null) {
			alert(msg);
		}
	</script>
</body>
</html>