<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	display: flex;
	flex-direction: column;
	justify-content: space-around;
	background-color: #D9D4CF;
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
	border: 1px solid white;
}

.container form {
	margin: 5% 0;
}

#password {
	width: 50%;
}

.btn {
	width: 100px;
	margin: 0;
}
</style>
</head>
<body>
	<div class="container">
		<h1>비밀번호확인</h1>
		<small class="text-muted">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시
			확인합니다.</small>
		<hr>
		<form method="post" action="pWCheckResult" class="form-inline">
			<input type="password" name="password" id="password"
				class="form-control"> <input type="submit" value="확인"
				class="btn btn-default">
		</form>
	</div>
	<script>
		var msg = '${msg}';
		if (msg != "" && msg != null) {
			alert(msg);
		}
	</script>
</body>
</html>