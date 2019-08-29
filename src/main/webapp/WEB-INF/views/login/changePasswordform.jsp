<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	href="https://fonts.googleapis.com/css?family=Barriecito&display=swap"
	rel="stylesheet">
<style type="text/css">
* {
	font-family: 'Comfortaa', '맑은 고딕', cursive;
}

#wrap {
	height: 100%;
	margin: 0 auto;
	position: relative;
	padding: 150px 0px 210px;
	width: 500px;
	text-align: center;
}

#btnResult {
	background-color: #ABD0CE;
	color: white;
}

p{
padding-bottom: 50px;
}
</style>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function checkPwd() {
		var pwd1 = $("#password").val();
		var pwd2 = $("#passwordChk").val();
		var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
		var id = "${id}";

		if (getCheck.test(pwd1)) {
			if (pwd1 == pwd2) {
				var form = document.createElement("form");
				form.setAttribute("charset", "UTF-8");
				form.setAttribute("method", "Post"); //Post 방식
				form.setAttribute("action", "/changePasswordResult"); //요청 보낼 주소

				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "user_password");
				hiddenField.setAttribute("value", pwd1);
				form.appendChild(hiddenField);

				hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "user_id");
				hiddenField.setAttribute("value", id);

				form.appendChild(hiddenField);

				document.body.appendChild(form);
				form.submit();
				alert('비밀번호가 변경되었습니다.');
			}
			$("#result").text("비밀번호가 상이합니다.");
		} else {
			$("#result").text("비밀번호는 4~12자리의 영문 및 숫자만 가능합니다.");
		}
	}
</script>
<body>
	<div id="wrap">
		<p>새로운 비밀번호를 입력해주세요.</p>
		<div class="form-horizontal">
			<div class="form-group">
				<label for="password" class="control-label col-sm-2">비밀번호</label>
				<div class="col-sm-10">
					<input type="password" id="password" class="form-control"
						required="required" placeholder="비밀번호를 입력해주세요.">
				</div>
			</div>
			<div class="form-group">
				<label for="passwordChk" class="control-label col-sm-2">비밀번호
					확인</label>
				<div class="col-sm-10">
					<input type="password" id="passwordChk" class="form-control"
						required="required" placeholder="비밀번호를 다시 입력해주세요.">
				</div>
			</div>
			<button id="btnResult" class="btn" onclick="checkPwd()">비밀번호 재설정</button>
			<div id="result"></div>
		</div>
	</div>
</body>
</html>