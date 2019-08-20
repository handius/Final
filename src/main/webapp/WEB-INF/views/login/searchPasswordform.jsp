<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.4.1.min.js"></script>
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
	<button onclick="location.href='searchID'">아이디 찾기</button>
	<button disabled="disabled">비밀번호 바꾸기</button>
	<br> 회원가입시 등록한 아이디와 이메일 정보를 입력해주세요.
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" id="id" required="required"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" id="email" required="required"></td>
		</tr>
		<tr>
			<td><button onclick="searchPassword()">다음</button></td>
		</tr>
	</table>
	<div id="searchPwdResult"></div>
</body>
</html>