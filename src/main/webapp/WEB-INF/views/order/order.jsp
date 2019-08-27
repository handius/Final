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
	<c:set var="memberDTO" value="${sessionScope.member}" />
	<c:set var="orderDTO" value="${sessionScope.orderDTO}" />
	<div id="wrapper">
		<div class="progress">
			<div class="progress-bar progress-bar-striped progress-bar-animated"
				role="progressbar" aria-valuenow="33.3" aria-valuemin="0"
				aria-valuemax="100" style="width: 33.3%">
				<span>1/3</span>
			</div>
		</div>
		<form method="post" action="../orderResult" id="payment">
			<div class="card border-primary mb-3">
				<div class="card-header">
					<h3>구매자 정보</h3>
				</div>
				<div class="card-body">
					<div class="form-group">
						<label for="name">이름</label><input type="text" name="name"
							id="name" required class="form-control" size="10"
							value="${memberDTO.user_name }">
					</div>
					<div class="form-group">
						<label for="call">연락처</label><input type="text" name="call"
							id="call" required class="form-control"
							value="${memberDTO.user_call }">
					</div>
					<div class="form-group">
						<label for="address">주소</label><input type="text" name="address"
							id="address" required class="form-control"
							value="${memberDTO.user_address }">
					</div>
				</div>
			</div>
			<div class="card border-primary mb-3">
				<div class="card-header">
					<h3>상품 정보</h3>
				</div>
				<div class="card-body">
					<table class="table table-hover">
						<tbody>
							<tr class="table-default">
								<td rowspan="3"><img alt="list_image"
									src="${list_image_loc }"></td>
								<td><a href="/productDetail/${orderDTO.list_no }"><c:out
											value="${orderDTO.list_title }"></c:out></a></td>
							</tr>
							<tr class="table-primary">
								<td><c:forEach var="item" items="${orderDTO.option_name }">
										${item }
									</c:forEach></td>
							</tr>
							<tr class="table-default">
								<td><c:forEach var="item" items="${orderDTO.order_amount }">
										${item }
									</c:forEach></td>
							</tr>
							<tr class="table-primary">
								<td>결제금액</td>
								<td><c:out value="${orderDTO.order_price }"></c:out>원</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div>
				<input type="checkbox" name="agreeement" id="agreement" required><label
					for="agreement">위 주문 내용을 확인 하였으며, 회원 본인은 결제에 동의합니다.</label>
			</div>
			<div class="submit">
				<input type="submit" value="주문하기"
					class="btn btn-primary btn-lg btn-block">
			</div>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
		$(document).ready(function() {
			$('#payment').on('submit', function(event) {
				event.preventDefault();
				var IMP = window.IMP; // 생략가능
				IMP.init('imp85472948'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
				IMP.request_pay({
					pg : 'html5_inicis', // version 1.1.0부터 지원.
					pay_method : 'card',
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : '${orderDTO.list_title}',
					amount : '${orderDTO.order_price}',
					buyer_email : '${memberDTO.user_email}',
					buyer_name : '${memberDTO.user_name}',
					buyer_tel : '${memberDTO.user_call}',
					buyer_addr : '${memberDTO.user_address}',
				//m_redirect_url : 'https://www.yourdomain.com/payments/complete'
				}, function(rsp) {
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						msg += '고유ID : ' + rsp.imp_uid;
						msg += '상점 거래ID : ' + rsp.merchant_uid;
						msg += '결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
						$('#payment').off('submit');
						$('#payment').trigger('submit');
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
					}
					alert(msg);
				});
			});
		});
	</script>
</body>
</html>