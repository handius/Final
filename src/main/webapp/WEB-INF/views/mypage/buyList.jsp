<%@page import="com.bitcamp.DTO.order.OrderDTO"%>
<%@page import="java.util.List"%>
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
	background-image: url("/resources/image/mypage/buy.jpg");
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

.buyList {
	font-size: 13px;
	border: 1px solid #ddd;
}

.buyList thead {
	background-color: #7C7877;
}

.buyList tbody {
	background-color: white;
}

.orderDTO {
	border-top: 1px solid #D9D4CF;
	border-bottom: 1px solid #D9D4CF;
}

.orderDTO td table {
	width: 100%;
}

.orderDTO td table * {
	padding: 1%;
}

.image {
	width: 30%;
}

.image img {
	width: 50%;
}

.option {
	width: 50px;
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
	justify-content: flex-end;
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
		<h1>나의구매내역</h1>
		<hr>
		<table class="table buyList">
			<thead>
				<tr>
					<th>주문일자</th>
					<th>상품정보</th>
					<th>주문제작정보</th>
					<th>결제금액</th>
					<th>상태</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${buyList }" varStatus="status1">
					<tr class="orderDTO">
						<td>${list.order_date }</td>
						<td><table>
								<tr>
									<td rowspan="2" class="image"><img alt="image_loc"
										src="${buyListImage_loc[status1.index] }"></td>
									<td colspan="2"><a href="/productDetail/${list.list_no }">${list.list_title }</a></td>
								<tr>
									<td class="option">옵션:</td>
									<td><c:forEach var="item" items="${list.option_name }"
											varStatus="status2">
							${item }/${list.order_amount[status2.index] }개(+${list.order_amount[status2.index]*list.option_price[status2.index] }원)<br>
										</c:forEach></td>
								<tr>
							</table></td>
						<td><c:if test="${list.ordermade_no==null }">완제품</c:if> <c:if
								test="${list.ordermade_no!=null }">
								<table>
									<c:forEach var="item"
										items="${orderOrderList2[status1.index] }" varStatus="i">
										<c:if test="${item.order_option eq 'picture' }">
											<tr>
												<td>주문옵션${i.index+1}</td>
												<td>${item.order_name }</td>
											</tr>
											<tr>
												<td colspan="2"><img src="${item.order_value }"
													alt="주문사진"></td>
											</tr>

										</c:if>
										<c:if test="${item.order_option eq 'color' }">
											<tr>
												<td>주문옵션${i.index+1}</td>
												<td>${item.order_name }</td>
											</tr>
											<tr>
												<td colspan="2"><span
													style="background-color: ${item.order_value}">
														색상:${item.order_value }</span></td>
											</tr>
										</c:if>
										<c:if test="${item.order_option eq 'text' }">
											<tr>
												<td>주문옵션${i.index+1}</td>
												<td>${item.order_name }</td>
											</tr>
											<tr>
												<td colspan="2">${item.order_value }</td>
											</tr>
										</c:if>

									</c:forEach>
								</table>
							</c:if></td>
						<td>${list.order_price }</td>
						<td>${list.order_status }</td>
						<td><c:if test="${list.order_status == '배송중' }">
								<input type="button" class="btn btn-default btn-block cor"
									name="cor" value="수취완료">
								<span style="display: none;">${list.order_no }</span>
							</c:if> <c:if test="${list.order_status == '배송완료' }">
								<input type="button" class="btn btn-default btn-block rw"
									name="rw" value="리뷰쓰기" data-toggle="modal"
									data-target="#myModal">
								<span style="display: none;">${list.order_no }</span>
							</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="divPage">
			<form class="formPage" action="/buyList" method="post">
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
					<button type="button" class="close" data-dismiss="modal">X</button>
				</div>
				<div class="modal-body" id="insertBuyReview"></div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<script>
		$("input[name=cor]").click(function() {
			var d = $(this).next().text();
			if (confirm("상품을 받으셨나요?\n상품을 받으신 분만 수취확인을 해주세요.")) {
				alert("수취확인이 완료되었습니다.");
				location.href = "cor/" + d;
			} else {
				alert("수취확인을 취소하였습니다.");
			}
			return false;
		});
		$("input[name=rw]").click(function() {
			var d = $(this).next().text();
			$.ajax({
				url : "/rw",
				type : "GET",
				data : "order_no=" + d,
				dataType : "html",
				success : function(data) {
					$('#insertBuyReview').empty();
					$('#insertBuyReview').append(data);
				},
				error : function(data) {
					alert("error");
				}
			});
		});
	</script>
</body>
</html>