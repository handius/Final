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
				$("#searchIDResult").html(data);
			},
			error : function(request, status, error) {
				console.log("실패");
			}
		});
	}
</script>
<body>
	<button disabled="disabled">아이디 찾기</button>
	<button onclick="location='searchPassword'">비밀번호 바꾸기</button>
	<br> 회원가입시 등록한 이름과 이메일 정보를 입력해주세요.
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" id="name"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" id="email"></td>
		</tr>
		<tr>
			<td><button id="btnSearch" onclick="searchID()">아이디 찾기</button></td>
		</tr>
	</table>
	<div id="searchIDResult"></div>
</body>
</html>