<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<h2>검색어 분석</h2>
		<p>현재 검색어 : </p><span class="value">핸드 메이드</span>
		<form class="form-horizontal" role="form" method="post">
			<div class="form-group">
				<input type="text" name="search" class="form-control" id="search" placeholder="검색어 등록">
				<input type="button" class="btn btn-default" value="등록">
			</div>
		</form>
	</div>
	<hr>
	
	
</body>
</html>