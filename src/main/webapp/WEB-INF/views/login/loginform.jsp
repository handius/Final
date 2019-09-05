<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Handius 로그인</title>
</head>
<!-- 네이버 아이디로 로그인 -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
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
<style>
* {
	font-family: 'Comfortaa', '맑은 고딕', cursive;
}

.mainlogo {
	margin-bottom: 50px;
	padding: 0px 100px;
}

.mainlogo>a {
	font-family: 'Barriecito', cursive;
	font-size: 4em;
	color: #333333;
	display: inline-block;
}

#wrap {
	display: block;
	width: 400px;
	margin: 0 auto;
	position: relative;
	padding: 100px 0px;
}

#btnLogin {
	width: 100%;
	background-color: #ABD0CE;
	color: #ffffff;
}

#nav {
	width: 100%;
	padding: 0px 40px;
	color: #7C7877;
}

#nav a {
	padding: 0px 10px;
	color: #7C7877;
}

#errormsg {
	padding-bottom: 10px;
	color: #CC0000;
	text-align: center;
}
</style>
<body onload="document.form.id.focus()">
	<div id="wrap">
		<div class="mainlogo">
			<a href="/">Handius</a>
		</div>
		<div id="form">
			<form name="form" action="login" method="post">
				<div class="form-group">
					<input type="text" class="form-control input-lg" id="id"
						name="username" placeholder="아이디를 입력해주세요.">
				</div>
				<div class="form-group">
					<input type="password" class="form-control input-lg"
						name="password" placeholder="비밀번호를 입력해주세요.">
				</div>
				<div id="errormsg">
					<c:if test="${not empty ERRORMSG}">
						<p>
							<span class="glyphicon glyphicon-ban-circle"></span> ${ERRORMSG}
						</p>
					</c:if>
				</div>
				<input id="btnLogin" class="btn btn-lg" name="submit" type="submit"
					value="로그인"> <input name="${_csrf.parameterName}"
					type="hidden" value="${_csrf.token}">
			</form>
			<div id="naver_id_login"></div>
		</div>
		<div id="nav">
			<a href="join">회원 가입</a> | <a href="searchID">아이디 찾기</a> | <a
				href="searchPassword">비밀번호 찾기</a>
		</div>
	</div>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("QqZ9G6FEqL4e_sdVLtPw",
				"YOUR_CALLBACK_URL");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 2, 40);
		naver_id_login.setDomain("http://localhost:8080");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>
</body>
</html>