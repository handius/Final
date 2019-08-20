<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				alert("탈퇴에 실패하였습니다.");
			}
		});
	});
</script>
</head>
<body>
	<form method="post" action="userInfoResult">
		<ul>
			<li><label for="user_id">아이디</label><input type="text"
				name="user_id" id="user_id" value="${memberDTO.getUser_id() }"
				readonly></li>
			<li><label for="user_password">비밀번호</label><input type="text"
				name="user_password" id="user_password"
				value="${memberDTO.getUser_password() }"></li>
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