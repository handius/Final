<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="memberdto" value="${sessionScope.member }"></c:set>
	<c:set var="spondto" value="${requestScope.spondto }"></c:set>
	<div id="wrapper">
		<div class="progress">
			<div class="progress-bar progress-bar-striped progress-bar-animated"
				role="progressbar" aria-valuenow="33.3" aria-valuemin="0"
				aria-valuemax="100" style="width: 33.3%">
				<span>1/3</span>
			</div>
		</div>
		<form method="post" action="../orderresult" id="payment">
			<div class="card border-primary mb-3">
				<div class="card-header">
					<h3>후원 정보</h3>
				</div>
				<div class="card-body">
					<div class="form-group">
						<label for="amount">후원 금액</label><input type="number"
							name="amount" id="amount" min="${spondto.minmoney }"
							class="form-control"
							placeholder="최소 금액은 ${spondto.minmoney }만원입니다.">
					</div>
				</div>
			</div>
			<div class="card border-primary mb-3">
				<div class="card-header">
					<h3>구매자 정보</h3>
				</div>
				<div class="card-body">
					<div class="form-group">
						<label for="name">이름</label><input type="text" name="name"
							id="name" required class="form-control" size="10"
							placeholder="이름을 입력해주세요.">
					</div>
					<div class="form-group">
						<label for="tel">연락처</label><input type="text" name="tel" id="tel"
							required class="form-control" placeholder="${memberdto.tel }">
					</div>
					<div class="form-group">
						<label for="addr">주소</label><input type="text" name="addr"
							id="addr" required class="form-control"
							placeholder="${memberdto.addr }">
					</div>
					<div class="form-group">
						<input type="hidden" name="boardno" value=${spondto.boardno }
							class="form-control">
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
								<td rowspan="3"></td>
								<td><c:out value="${listDTO.list_title }"></c:out></td>
							</tr>
							<tr class="table-primary">
								<td><c:out value="${listDTO.nowmoney }"></c:out></td>
							</tr>
							<tr class="table-default">
								<td><c:out value="${listDTO.destmoney }"></c:out></td>
							</tr>
							<tr class="table-primary">
								<td>결제금액</td>
								<td><c:out value="${listDTO.finaldate }"></c:out></td>
							</tr>
						</tbody>
					</table>
				</div>
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
		$(document)
				.ready(
						function() {
							$("#payment")
									.submit(
											function(event) {
												event.preventDefault();
												var IMP = window.IMP; // 생략가능
												IMP.init('imp85472948'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
												IMP
														.request_pay(
																{
																	pg : 'html5_inicis', // version 1.1.0부터 지원.
																	pay_method : 'card',
																	merchant_uid : 'merchant_'
																			+ new Date()
																					.getTime(),
																	name : '주문명:결제테스트',
																	amount : 14000,
																	buyer_email : 'iamport@siot.do',
																	buyer_name : '구매자이름',
																	buyer_tel : '010-1234-5678',
																	buyer_addr : '서울특별시 강남구 삼성동',
																	buyer_postcode : '123-456',
																	m_redirect_url : 'https://www.yourdomain.com/payments/complete'
																},
																function(rsp) {
																	if (rsp.success) {
																		var msg = '결제가 완료되었습니다.';
																		msg += '고유ID : '
																				+ rsp.imp_uid;
																		msg += '상점 거래ID : '
																				+ rsp.merchant_uid;
																		msg += '결제 금액 : '
																				+ rsp.paid_amount;
																		msg += '카드 승인번호 : '
																				+ rsp.apply_num;
																	} else {
																		var msg = '결제에 실패하였습니다.';
																		msg += '에러내용 : '
																				+ rsp.error_msg;
																	}
																	alert(msg);
																});
											});
						});
	</script>
</body>
</html>