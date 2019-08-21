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
			}
			$("#result").text("비밀번호가 상이합니다.");
		} else {
			$("#result").text("비밀번호는 4~12자리의 영문 및 숫자만 가능합니다.");
		}
	}
</script>
<body>
	<table>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" id="password" required="required"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" id="passwordChk" required="required"></td>
		</tr>
	</table>
	<button onclick="checkPwd()">비밀번호 재설정</button>
	<div id="result"></div>
</body>
</html>