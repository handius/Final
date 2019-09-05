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

#btnSearch {
	background-color: #ABD0CE;
	color: white;
}

#wrap {
	height: 100%;
	position: relative;
	text-align: center;
	margin: 10em 20%;
}

.divContent {
	padding: 3em;
}

.divTable {
	padding-top: 30px;
}

p {
	padding-bottom: 3em;
}

table {
	padding: 50px 0px;
}

.btnTab {
	width: 130px;
}

.divForm {
	padding-right: 20px;
}

#searchIDResult {
	color: #CC0000;
}

#searchIDResult span{
	vertical-align: middle;
	font-size: 15px;
}

#btnSearch{
	font-size: 16px;
	font-weight: bold;
}
</style>
<script>
	function searchID() {
		var name = $('#name').val();
		var email = $('#email').val();

		var postData = {
			'user_name' : name,
			'user_email' : email
		};

		$.ajax({
			url : '/searchIDResult',
			type : 'post',
			data : postData,
			dataType : 'html',
			success : function(data) {
				$("#searchIDResult").html(
						"<span class='glyphicon glyphicon-remove-circle'></span> <span>"
								+ data +"</span>");
			},
			error : function(request, status, error) {
				console.log("실패");
			}
		});
	}
</script>
<body>
	<div id="wrap">
		<div class="divContent divButton">
			<button disabled="disabled" class="btn btnTab">아이디 찾기</button>
			<button onclick="location='searchPassword'" class="btn btnTab">비밀번호
				바꾸기</button>
		</div>
		<p>회원가입시 등록한 이름과 이메일 정보를 입력해주세요.</p>
		<div class="form-horizontal divForm">
			<div class="form-group">
				<label for="name" class="control-label col-sm-2">이름</label>
				<div class="col-sm-10">
					<input type="text" id="name" class="form-control"
						placeholder="이름을 입력해주세요.">
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="control-label col-sm-2">이메일</label>
				<div class="col-sm-10">
					<input type="text" id="email" class="form-control"
						placeholder="이메일을 입력해주세요.">
				</div>
			</div>
		</div>
		<div class="divContent">
			<input type="button" id="btnSearch" onclick="searchID();"
				value="아이디 찾기" class="btn btnTab">
		</div>
		<br>
		<div id="searchIDResult"></div>
	</div>
</body>
</html>