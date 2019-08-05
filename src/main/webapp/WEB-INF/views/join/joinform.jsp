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
		$("#id").blur(function() {
			var id = $("#id").val();
			
			$.ajax({
				url:'${pageContext.request.contextPath}/user/idCheck?userId='+id,
				type:'get',
				success:function(data){
					console.log(data);
					if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(idJ.test(user_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#reg_submit").attr("disabled", false);
				
						} else if(user_id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error: function() {
						console.log("실패");
				}
			});
			
		});
	});
</script>
<body>
	<h1>Handius 회원 가입</h1>
	<form name="joinform" action="joinResult" method="post">
		<table>
			<tr>
				<td>아이디 *</td>
				<td><input type="text" id="id" name="id" required="required"
					placeholder="아이디"><br>
					<div id="id_check"></div></td>
			</tr>
			<tr>
				<td>비밀번호 *</td>
				<td><input type="text" id="password1" name="password1"
					required="required" placeholder="비밀번호"><br>
					<div id="password_check1"></div></td>
			</tr>
			<tr>
				<td>비밀번호 확인 *</td>
				<td><input type="text" id="password2" name="password2"
					required="required" placeholder="비밀번호 확인"><br>
					<div id="password_check2"></div></td>
			</tr>
			<tr>
				<td>이름 *</td>
				<td><input type="text" id="name" name="name"
					required="required" placeholder="이름"><br>
					<div id="name_check"></div></td>
			</tr>
			<tr>
				<td>이메일 *</td>
				<td><input type="text" id="email" name="email"
					required="required" placeholder="이메일"><br>
					<div id="email_check"></div></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address1" placeholder="주소"><br>
					<input type="text" name="address2"></td>
			</tr>
		</table>
		이메일을 통한 인증이 완료되어야<br> 서비스를 이용하실 수 있습니다. <br> <input type="submit" id="reg_submit"
			value="가입하기">
	</form>
</body>
</html>