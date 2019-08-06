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
	/* $(document).ready(function() {
		$("input").blur(function() {
			var id = $("#id").val();
			
			$.ajax({
				url:'${pageContext.request.contextPath}/user/idCheck?userId='+id,
				type:'get',
				success:function(data){
					
				}, error: function() {
						console.log("실패");
				}
			});
			
		});
	}); */

	function id_checks() {
		console.log("dddd");
		var id = $("#id").val();
		$.ajax({
			url : '${pageContext.request.contextPath}/user/idCheck?userId='
					+ id,
			type : 'get',
			success : function(data) {
				console.log(data);
				if (data == 0) {
					console.log(id.length + ".....");
					for (var i = 0; i < id.length; i++) {
						var ch = id.charAt(i);
						console.log(ch);
						if (!(ch >= '0' && ch <= '9')
								&& !(ch >= 'a' && ch <= 'z')
								&& !(ch >= 'A' && ch <= 'Z')) {
							$("#id_check_result").text(
									"아이디는 영문 대소문자, 숫자만 입력가능합니다.");
						}
					}
					if (id.length<4 || id.length>12) {
						$("#id_check_result").text("아이디를 4~12자까지 입력해주세요.");
					}else{
						$("#id_check_result").text("사용가능한 아이디입니다.");
					}
						
				} else {
					$("#id_check_result").text("중복된 아이디입니다.");
				}
			},
			error : function() {
				console.log("실패");
			}
		});
	}

	function checks() {
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
		var getName = RegExp(/^[가-힣]+$/);
		var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정

		/* //아이디 공백 확인
		if ($("#id").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return false;
		}

		//아이디 유효성검사
		if (!getCheck.test($("#id").val())) {
			alert("아이디는 4~12자리의 영문 및 숫자만 사용하실 수 있습니다.");
			$("#id").val("");
			$("#id").focus();
			return false;
		} */

		//비밀번호 공백 확인
		if ($("#password").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#password").focus();
			return false;
		}

		//아이디 비밀번호 같음 확인
		if ($("#id").val() == $("#password").val()) {
			alert("아이디와 비밀번호가 같습니다");
			$("#password").val("");
			$("#password").focus();
			return false;
		}

		//비밀번호 유효성검사
		if (!getCheck.test($("#password").val())) {
			alert("형식에 맞게 입력해주세요");
			$("#password").val("");
			$("#password").focus();
			return false;
		}

		//비밀번호 확인란 공백 확인
		if ($("#password_check").val() == "") {
			alert("비밀번호 확인란을 입력해주세요");
			$("#password_check").focus();
			return false;
		}

		//비밀번호 서로확인
		if ($("#password").val() != $("#password_check").val()) {
			alert("비밀번호가 상이합니다");
			$("#password").val("");
			$("#password_check").val("");
			$("#password").focus();
			return false;
		}

		//이메일 공백 확인
		if ($("#email").val() == "") {
			alert("이메일을 입력해주세요");
			$("#mail").focus();
			return false;
		}

		//이메일 유효성 검사
		if (!getMail.test($("#email").val())) {
			alert("이메일 형식에 맞게 입력해주세요")
			$("#email").val("");
			$("#email").focus();
			return false;
		}

		//이름 공백 검사
		if ($("#name").val() == "") {
			alert("이름을 입력해주세요");
			$("#name").focus();
			return false;
		}

		//이름 유효성 검사
		if (!getName.test($("#name").val())) {
			alert("이름 형식에 맞게 입력해주세요")
			$("#name").val("");
			$("#name").focus();
			return false;
		}

		return true;
	}
</script>
<body>
	<h1>Handius 회원 가입</h1>
	<form name="joinform" action="joinResult" method="post"
		onsubmit="return checks()">
		<table>
			<tr class="tr1">
				<td>아이디 *</td>
				<td><input type="text" id="id" name="id" required="required"
					placeholder="아이디"><input type="button" id="id_check"
					value="중복체크" onclick="id_checks();"></input>
					<div id="id_check_result"></div>
			</tr>
			<tr>
				<td>비밀번호 *</td>
				<td><input type="password" id="password" name="password"
					required="required" placeholder="비밀번호"><br>
			</tr>
			<tr>
				<td>비밀번호 확인 *</td>
				<td><input type="password" id="password_check"
					name="password_check" required="required" placeholder="비밀번호 확인"><br>
			</tr>
			<tr>
				<td>이름 *</td>
				<td><input type="text" id="name" name="name"
					required="required" placeholder="이름"><br>
			</tr>
			<tr>
				<td>이메일 *</td>
				<td><input type="text" id="email" name="email"
					required="required" placeholder="이메일"><br>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address1" placeholder="주소"><br>
					<input type="text" name="address2"></td>
			</tr>
		</table>
		이메일을 통한 인증이 완료되어야<br> 서비스를 이용하실 수 있습니다. <br> <input
			type="submit" id="reg_submit" value="가입하기">
	</form>
</body>
</html>