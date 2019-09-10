<%@page import="com.bitcamp.DTO.order.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.buyList {
	width: 100%;
	margin: 5% 0;
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

.orderDTO td table tr td img {
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
	<div class="container">
		<h1>나의구매내역</h1>
		<hr>
		<table class="buyList">
			<thead>
				<tr>
					<th>주문일자</th>
					<th>상품정보</th>
					<th>결제금액</th>
					<th>상태</th>
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