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
<style type="text/css">
* {
	font-family: 'Comfortaa', '맑은 고딕', cursive;
}

#wrap {
	height: 100%;
	margin: 0 auto;
	position: relative;
	padding: 110px 0px 200px; width : 500px;
	text-align: center;
	width: 500px;
}

#btnNext {
	background-color: #ABD0CE;
	color: white;
	width : 100px;
}

.divContent {
	padding-bottom: 30px;
}

p {
	padding-bottom: 20px;
}

.btnTab {
	width: 130px;
}

.divForm{
padding-bottom: 30px;
}

#searchPwdResult{
	padding-top: 50px;
}
</style>
<script>
	function searchPassword() {
		var id = $('#id').val();
		var email = $('#email').val();

		var postData = {
			'user_id' : id,
			'user_email' : email
		};

		$.ajax({
			url : '/searchPasswordResult',
			type : 'post',
			data : postData,
			dataType : 'html',
			success : function(data) {
				if (data == 0) {
					$("#searchPwdResult").html("일치하는 정보가 없습니다.");
				} else {
					var form = document.createElement("form");
					form.setAttribute("charset", "UTF-8");
					form.setAttribute("method", "Post"); //Post 방식
					form.setAttribute("action", "/changePassword"); //요청 보낼 주소

					var hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					hiddenField.setAttribute("name", "id");
					hiddenField.setAttribute("value", id);
					form.appendChild(hiddenField);
					document.body.appendChild(form);
					form.submit();
				}
			}
		});
	}
</script>
<body>
	<div id="wrap">
		<div class="divContent">
			<button class="btn btnTab" onclick="location.href='searchID'">아이디
				찾기</button>
			<button class="btn btnTab" disabled="disabled">비밀번호 바꾸기</button>
		</div>
		<p>회원가입시 등록한 아이디와 이메일 정보를 입력해주세요.</p>
		<div class="form-horizontal divForm">
			<div class="form-group">
				<label for="id" class="control-label col-sm-2">아이디</label>
				<div class="col-sm-10">
					<input type="text" id="id" class="form-control" required="required"
						placeholder="아이디를 입력해주세요.">
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="control-label col-sm-2">이메일</label>
				<div class="col-sm-10">
					<input type="text" id="email" class="form-control"
						required="required" placeholder="이메일을 입력해주세요.">
				</div>
			</div>
		</div>
		<button class="btn" id="btnNext" onclick="searchPassword()">다음</button>
		<div id="searchPwdResult"></div>
	</div>
</body>
</html>