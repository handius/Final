<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
* {
	font-family: 'Comfortaa', '맑은 고딕', cursive;
}

.container {
	background-color: #F0E5DE;
	margin: 5%;
	padding: 5%;
	border-radius: 25% 10%;
}

.row {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	align-items: stretch;
}

.left {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.left img {
	width: 75%;
}

.line {
	width: 5px;
	height: 100%;
	background-color: #D9D4CF;
	margin-left: auto;
	margin-right: auto;
}

.right {
	display: flex;
	flex-direction: row;
	justify-content: center;
	padding: 5%;
}

ul {
	display: flex;
	flex-direction: column;
	justify-content: space-around;
	margin: 5%;
	list-style: none;
}

a {
	color: black !important;
	font-size: 15px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-1 left">
				<sec:authorize access="!hasRole('ROLE_SELLER')">
					<img alt="buyer" src="/resources/image/wink.png">
					<h3>구매자</h3>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_SELLER')">
					<img alt="seller" src="/resources/image/cool.png">
					<h3>판매자</h3>
				</sec:authorize>
				<sec:authentication property="principal.member.user_id"
					var="user_id" />
				<h3>${user_id }님</h3>
			</div>
			<div class="col-md-2 visible-md visible-lg">
				<div class="line"></div>
			</div>
			<div class="col-md-4 right">
				<ul>
					<li><a href="pWCheck">회원 정보 수정</a></li>
					<li><a href="buyList">나의 구매 내역</a></li>
					<li><a href="cQAList">나의 고객 문의</a></li>
					<li><a href="buyerPQAList">나의 상품 문의</a></li>
					<li><a href="buyerReviewList">나의 상품 후기</a></li>
				</ul>
				<sec:authorize access="hasRole('ROLE_SELLER')">
					<ul>
						<li><a href="registerList">나의 등록 내역</a></li>
						<li><a href="sellList">나의 판매 내역</a></li>
						<li><a href="sellerPQAList">상품 문의 관리</a></li>
						<li><a href="sellerReviewList">상품 후기 관리</a></li>
					</ul>
				</sec:authorize>
			</div>
		</div>
	</div>
</body>
</html>