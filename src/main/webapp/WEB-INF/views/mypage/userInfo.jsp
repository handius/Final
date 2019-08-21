<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#customerQA").click(function() {
			location.href = "customerQA";
		});
	});
	$(document).ready(function() {
		$("#withdraw").click(function() {
			if (confirm("정말로 탈퇴하시겠습니까?")) {
				alert("탈퇴가 완료되었습니다.");
				location.href = "withdraw";
			} else {
				alert("탈퇴를 취소하였습니다.");
			}
		});
	});
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

		/* //비밀번호 유효성검사
		if (!getCheck.test($("#password").val())) {
			alert("비밀번호 형식에 맞게 입력해주세요");
			$("#password").val("");
			$("#password").focus();
			return false;
		} */

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
	<form method="post" action="userInfoResult" onsubmit="return checks()">
		<ul>
			<li><label for="user_id">아이디</label><input type="text"
				name="user_id" id="user_id" value="${memberDTO.getUser_id() }"
				readonly></li>
			<li><label for="password">새 비밀번호</label><input type="password"
				name="password" id="password"> <label for="password_check">새
					비밀번호 확인 </label><input type="password" name="password_check"
				id="password_check"></li>
			<li><label for="user_name">이름</label><input type="text"
				name="user_name" id="user_name" value="${memberDTO.getUser_name() }"></li>
			<li><label for="user_nick">닉네임</label><input type="text"
				name="user_nick" id="user_nick" value="${memberDTO.getUser_nick() }"></li>
			<li><label for="user_email">이메일</label><input type="text"
				name="user_email" id="user_email"
				value="${memberDTO.getUser_email() }"></li>
			<li><label for="user_address">주소</label><input type="text"
				name="user_address" id="user_address"
				value="${memberDTO.getUser_address() }"></li>
			<li><label for="user_call">전화번호</label><input type="text"
				name="user_call" id="user_call" value="${memberDTO.getUser_call() }"></li>
			<li><input type="button" value="작가 신청하기" id="customerQA"><input
				type="button" value="탈퇴하기" id="withdraw"></li>
			<li><input type="submit" value="수정"></li>
		</ul>
	</form>
</body>
</html>