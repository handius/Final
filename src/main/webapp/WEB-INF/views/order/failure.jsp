<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#wrapper {
	width: 60%;
	margin: 0 auto;
	padding: 5%;
}

img {
	width: 50%;
	margin: 5% auto;
}

h3, p {
	text-align: center;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div class="progress">
			<div class="progress-bar progress-bar-striped bg-danger"
				role="progressbar" style="width: 100%" aria-valuenow="100"
				aria-valuemin="0" aria-valuemax="100">
				<span>0/3</span>
			</div>
		</div>
		<div class="card border-danger mb-3">
			<img alt="failure" src="image/cancel.png">
			<h3>결제승인에 실패했습니다.</h3>
			<p>
				이용에 불편을 드려 죄송합니다.<br> 결제내역을 확인하신 후 다시 시도해주시기 바랍니다.<br> <a
					href="spondetail.do?no=${requestScope.boardno }">결제 다시하기</a>
			</p>
		</div>
	</div>
</body>
</html>