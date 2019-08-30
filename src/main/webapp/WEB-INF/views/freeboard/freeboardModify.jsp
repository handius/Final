<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<style>
* {
	font-family: 'Comfortaa', '맑은 고딕', cursive;
}

#wrap {
	margin: 0 auto;
	width: 800px;
	padding-top: 50px;
	padding-bottom: 50px;
}

#btnSubmit {
	background-color: #ABD0CE;
	color: white;
	float: right;
}

</style>
<body>
	<div id="wrap">
		<form action="boardModifyResult?no=${board.freeboard_no}"
			method="post" class="form-horizontal">
			<div class="form-group">
				<label for="category" class="col-sm-2 control-label">카테고리</label>
				<div class="col-sm-10">
					<select name="category" id="category" required="required"
						class="form-control">
						<option disabled="disabled" selected="selected" value="">카테고리를
							선택하세요</option>
						<option value="정보">정보</option>
						<option value="교환">교환</option>
						<option value="잡담">잡담</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input type="text" id="title" name="title" required="required"
						value="${board.freeboard_title }" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-label">글쓴이</label>
				<div class="col-sm-10">
					<input type="text" id="writer" name="writer"
						value="${board.user_nick}" readonly="readonly"
						class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">내용</label>
				<div class="col-sm-10">
					<textarea rows="30" cols="50" name="content" id="content"
						class="form-control" required="required">${board.freeboard_content}</textarea>
				</div>
			</div>
			<input type="button" class="btn" id="btnList" value="목록으로"
				onclick="location.href='../freeboard'">
			<button type="submit" class="btn" id="btnSubmit">작성완료</button>
		</form>
	</div>
</body>
</html>