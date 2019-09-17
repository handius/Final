<%@page import="com.bitcamp.DTO.productdetail.BuyReviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	background-image: url("/resources/image/mypage/list4.jpg");
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
	background-color: white;
	margin: 1% 3%;
	padding: 3% 1% !important;
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
	margin: 3% 1% 6% 1%;
	border: 1px solid #7C7877;
}

.buyerReviewList {
	width: 90% !important;
	margin: 5%;
	border: 1px solid #ddd;
}

.buyerReviewList thead {
	background-color: #7C7877;
}

.buyerReviewList tbody {
	background-color: white;
}

.buyReviewDTO {
	border-top: 1px solid #D9D4CF;
	border-bottom: 1px solid #D9D4CF;
}

.btn {
	margin: 0;
}

.formPage {
	display: flex;
	justify-content: center;
}

.modal-header {
	display: flex;
	justify-content: space-between;
	border-bottom: 1px solid #D9D4CF !important;
}

.modal-content {
	background-color: #f4f4f4 !important;
}

.modal-footer {
	border-top: 1px solid #D9D4CF !important;
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
		<h1>나의상품후기</h1>
		<hr>
		<table class="table buyerReviewList">
			<thead>
				<tr>
					<th style="display: none;">번호</th>
					<th>상품명</th>
					<th>내용</th>
					<th>작성일</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${buyerReviewList }" varStatus="status">
					<tr class="buyReviewDTO">
						<td style="display: none;">${list.buy_review_no }</td>
						<td><a href="productDetail/${list.list_no }">${list_title_list[status.index] }</a></td>
						<td>${list.buy_review_content }</td>
						<td>${list.buy_review_date }</td>
						<td><button class="btn btn-default btn-block update_btn"
								value="${list.buy_review_no }" data-toggle="modal"
								data-target="#myModal">수정</button></td>
						<td><button class="btn btn-default btn-block delete_btn"
								value="${list.buy_review_no }">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="divPage">
			<form class="formPage" action="/buyerReviewList" method="post">
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
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">수정하기</h4>
					<button type="button" class="close" data-dismiss="modal">X</button>
				</div>
				<div class="modal-body" id="updateBuy_review_content"></div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<script>
		// '수정' 버튼
		$('.update_btn').click(function() {
			$.ajax({
				url : "/updateBuy_review_content/" + $(this).val(),
				type : "GET",
				dataType : "html",
				success : function(data) {
					$('#updateBuy_review_content').empty();
					$('#updateBuy_review_content').append(data);
				},
				error : function(data) {
					alert("error");
				}
			});
		});

		// '삭제' 버튼
		$('.delete_btn').click(function() {
			if (confirm('정말로 삭제하시겠습니까?')) {
				alert("삭제가 완료되었습니다.");
				location.href = "/updateBuy_review_status/" + $(this).val();
			} else {
				alert("삭제를 취소하였습니다.");
			}
			return false;
		});
	</script>
</body>
</html>