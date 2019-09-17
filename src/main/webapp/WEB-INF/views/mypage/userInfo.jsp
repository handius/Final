<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
<link
	href="https://fonts.googleapis.com/css?family=Poor+Story&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Comfortaa', '맑은 고딕', cursive;
}

.jumbotron {
	width: 100%;
	height: 400px;
	background-image: url("/resources/image/mypage/pencil.jpg");
	background-size: cover;
	background-position: 0 45%;
	padding: 0;
	margin-bottom: 0 !important;
}

.nav {
	height: 50px;
	border-bottom: 1px solid silver;
	background-color: #D9D4CF;
}

.items {
	display: flex;
}

.item {
	flex-grow: 1;
	line-height: 50px;
	text-align: center;
	font-size: 19px;
	font-weight: bold;
}

.item a {
	color: rgba(93, 93, 93);
	font-family: 'Comfortaa', 'Poor Story', cursive;
	text-decoration: none;
}

.container {
	background-color: white;
	margin: 1% 3%;
	padding: 3% 1% !important;
	border: 5px solid #ddd;
}

.container * {
	margin: 5px;
}

.container h1 {
	color: #7C7877;
	font-size: 3vw;
	font-weight: bold;
}

.container hr {
	width: 45%;
	margin: 3% 1% 6% 1%;
	border: 1px solid #7C7877;
}

.container form {
	margin: 5% 0;
}

.row {
	display: flex;
	justify-content: center;
	margin: 5%;
}

.form-group {
	width: 55%;
}

.btn {
	width: 100px;
}
</style>
</head>
<script>
	function withdrawconfirm() {
		if (confirm("정말로 탈퇴하시겠습니까?")) {
			alert("탈퇴가 완료되었습니다.");
			return true;
		} else {
			alert("탈퇴를 취소하였습니다.");
			return false;
		}
	}
	function checks() {
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
		var getName = RegExp(/^[가-힣]+$/);
		var fmt = RegExp(/^\d{6}[1234]\d{6}$/);

		/* //비밀번호 공백 확인
		if ($("#password").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#password").focus();
			return false;
		} */

		//아이디 비밀번호 같음 확인
		if ($("#user_id").val() == $("#password").val()) {
			alert("아이디와 비밀번호가 같습니다");
			$("#password").val("");
			$("#password").focus();
			return false;
		}

		//비밀번호 유효성검사
		if ($('#password').val() != "") {
			if (!getCheck.test($("#password").val())) {
				alert("비밀번호 형식에 맞게 입력해주세요");
				$("#password").val("");
				$("#password").focus();
				return false;
			}
		}

		/* //비밀번호 확인란 공백 확인
		if ($("#password_check").val() == "") {
			alert("비밀번호 확인란을 입력해주세요");
			$("#password_check").focus();
			return false;
		} */

		//비밀번호 서로확인
		if ($("#password").val() != $("#password_check").val()) {
			alert("비밀번호가 상이합니다");
			$("#password").val("");
			$("#password_check").val("");
			$("#password").focus();
			return false;
		}

		//이메일 공백 확인
		if ($("#user_email").val() == "") {
			alert("이메일을 입력해주세요");
			$("#user_email").focus();
			return false;
		}

		//이메일 유효성 검사
		if (!getMail.test($("#user_email").val())) {
			alert("이메일 형식에 맞게 입력해주세요")
			$("#user_email").val("");
			$("#user_email").focus();
			return false;
		}

		//이름 공백 검사
		if ($("#user_name").val() == "") {
			alert("이름을 입력해주세요");
			$("#user_name").focus();
			return false;
		}

		//이름 유효성 검사
		if (!getName.test($("#user_name").val())) {
			alert("이름 형식에 맞게 입력해주세요")
			$("#user_name").val("");
			$("#user_name").focus();
			return false;
		}

		return true;
	}
</script>
<body>
	<div class="jumbotron"></div>
	<div class="visible-md visible-lg nav">
		<div class="items">
			<div class="item"></div>
			<div class="item">
				<a href="/pWCheck">회원 정보 수정</a>
			</div>
			<div class="item">
				<a href="/buyList">나의 구매 내역</a>
			</div>
			<div class="item">
				<a href="/cQAList">나의 고객 문의</a>
			</div>
			<div class="item">
				<a href="/buyerPQAList">나의 상품 문의</a>
			</div>
			<div class="item">
				<a href="/buyerReviewList">나의 상품 후기</a>
			</div>
			<sec:authorize access="hasRole('ROLE_SELLER')">
				<div class="item">|</div>
				<div class="item">
					<a href="/registerList">나의 등록 내역</a>
				</div>
				<div class="item">
					<a href="/sellList">나의 판매 내역</a>
				</div>
				<div class="item">
					<a href="/sellerPQAList">상품 문의 관리</a>
				</div>
				<div class="item">
					<a href="/sellerReviewList">상품 후기 관리</a>
				</div>
			</sec:authorize>
			<div class="item"></div>
		</div>
	</div>
	<div class="container">
		<h1>회원정보수정</h1>
		<hr>
		<form method="post" action="userInfoResult" onsubmit="return checks()">
			<div class="form-group">
				<label for="user_id">아이디</label><input type="text" name="user_id"
					id="user_id" value="${memberDTO.getUser_id() }" readonly
					class="form-control">
			</div>
			<div class="form-group">
				<label for="password">새 비밀번호</label><input type="password"
					name="password" id="password" class="form-control"><label
					for="password_check">새 비밀번호 확인 </label><input type="password"
					name="password_check" id="password_check" class="form-control">
			</div>
			<div class="form-group">
				<label for="user_name">이름</label><input type="text" name="user_name"
					id="user_name" value="${memberDTO.getUser_name() }"
					class="form-control">
			</div>
			<div class="form-group">
				<label for="user_nick">닉네임</label><input type="text"
					name="user_nick" id="user_nick"
					value="${memberDTO.getUser_nick() }" class="form-control">
			</div>
			<div class="form-group">
				<label for="user_email">이메일</label><input type="text"
					name="user_email" id="user_email"
					value="${memberDTO.getUser_email() }" class="form-control">
			</div>
			<div class="form-group">
				<label for="user_address">주소</label><input type="text"
					name="user_address" id="user_address"
					value="${memberDTO.getUser_address() }" class="form-control">
			</div>
			<div class="form-group">
				<label for="user_call">전화번호</label><input type="text"
					name="user_call" id="user_call"
					value="${memberDTO.getUser_call() }" class="form-control">
			</div>
			<div>
				<a href="customerQA">작가신청</a> <a href="withdraw"
					onclick="return withdrawconfirm()">탈퇴하기</a>
			</div>
			<div class="row">
				<input type="submit" value="수정하기" class="btn btn-default">
			</div>
		</form>
	</div>
</body>
</html>