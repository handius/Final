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
		<form method="post" action="payment">
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
			<div class="submit">
				<input type="submit" value="후원하기"
					class="btn btn-primary btn-lg btn-block">
			</div>
		</form>
	</div>
</body>
</html>