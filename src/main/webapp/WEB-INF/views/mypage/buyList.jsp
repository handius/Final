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
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>주문일자</th>
				<th>상품정보</th>
				<th>결제금액</th>
				<th>상태</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${buyList }">
				<tr>
					<td>${list.order_date }</td>
					<td><a href="/productDetail/${list.list_no }">${list.list_title }</a><br>
						<table>
							<tr>
								<td>옵션:</td>
								<td><c:forEach var="item" items="${list.option_name }"
										varStatus="status">
							${item }/${list.order_amount[status.index] }개(+${list.order_amount[status.index]*list.option_price[status.index] }원)<br>
									</c:forEach></td>
							<tr>
						</table></td>
					<td>${list.order_price }</td>
					<td>${list.order_status }</td>
					<td><c:if test="${list.order_status == '배송중' }">
							<input type="button" class="btn btn-default cor" name="cor"
								value="수취완료">
							<span style="display: none;">${list.order_no }</span>
						</c:if> <c:if test="${list.order_status == '배송완료' }">
							<input type="button" class="btn btn-default rw" name="rw"
								value="리뷰쓰기" data-toggle="modal" data-target="#myModal">
							<span style="display: none;">${list.order_no }</span>
						</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header"></div>
				<div class="modal-body" id="insertBuyReview"></div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
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
		});
		$(document).ready(function() {
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
		});
	</script>
</body>
</html>