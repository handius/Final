<%@page import="com.bitcamp.DTO.productdetail.BuyReviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

body {
	background-color: #D9D4CF !important;
}

.jumbotron {
	width: 100%;
	height: 400px;
	background-image: url("/resources/image/mypage/list8.jpg");
	background-size: cover;
	background-position: 0 45%;
	padding: 0;
	margin-bottom: 0 !important;
}

.container {
	background-color: white;
	margin: 5%;
	padding: 3% 5% !important;
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

.sellerReviewList {
	width: 90% !important;
	margin: 5%;
}

.sellerReviewList thead {
	background-color: #7C7877;
}

.sellerReviewList tbody {
	background-color: white;
}

.buyReviewDTO {
	border-top: 1px solid #D9D4CF;
	border-bottom: 1px solid #D9D4CF;
}

.formPage {
	display: flex;
	justify-content: center;
}
</style>
</head>
<body>
	<div class="jumbotron"></div>
	<div class="container">
		<h1>상품후기관리</h1>
		<hr>
		<table class="table sellerReviewList">
			<thead>
				<tr>
					<th style="display: none;">번호</th>
					<th>상품명</th>
					<th>내용</th>
					<th>작성일</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${sellerReviewList }"
					varStatus="status">
					<tr class="buyReviewDTO">
						<td style="display: none;">${list.buy_review_no }</td>
						<td><a href="productDetail/${list.list_no }">${list_title_list[status.index] }</a></td>
						<td>${list.buy_review_content }</td>
						<td>${list.buy_review_date }</td>
						<td>${list.user_name }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="divPage">
			<form class="formPage" action="/sellerReviewList" method="post">
				<c:if test="${paging.startblock > 1 }">
					<a href="#">◀</a>
				</c:if>
				<c:forEach var="i" begin="${paging.startblock }"
					end="${paging.endblock }">
					<c:if test="${i == currpage }">
						<c:out value="${i }"></c:out>
					</c:if>
					<c:if test="${i != currpage }">
						<input type="submit" class="btn btn-default" name="curr"
							value="${i }">
					</c:if>
				</c:forEach>
				<c:if test="${paging.endblock < paging.totalpage }">
					<a href="#">▶</a>
				</c:if>
			</form>
		</div>
	</div>
</body>
</html>