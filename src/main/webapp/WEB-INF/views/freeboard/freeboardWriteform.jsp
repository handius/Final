<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<style>
* {
	font-family: 'Comfortaa', '맑은 고딕', cursive;
}

#wrap {
	margin: 0 auto;
	width: 1000px;
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
	<c:set var="memberNo">
		<sec:authentication property="principal.member.member_no" />
	</c:set>
	<div id="wrap">
		<form action="freeboardWriteResult" method="post"
			class="form-horizontal">
			<input type="hidden" name="member_no" value="${memberNo}">
			<div class="form-group">
				<label for="category" class="col-sm-2 control-label">카테고리</label>
				<div class="col-sm-10">
					<select class="form-control" id="category" name="category"
						required="required">
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
					<input type="text" class="form-control" id="title" name="title"
						required="required" placeholder="제목을 입력해주세요.">
				</div>
			</div>
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-label">닉네임</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="writer" id="writer"
						value="<sec:authentication property="principal.member.user_nick" />"
						readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="summernote" class="col-sm-2 control-label">내용</label>
				<div class="col-sm-10">
					<textarea rows="30" cols="50"
						class="form-control get_content_class" id="summernote"
						name="summernote" required="required"></textarea>
				</div>
			</div>
			<div class="btnResult">
				<input type="button" class="btn" id="btnList" value="목록으로"
					onclick="location.href='../freeboard'">
				<button type="submit" class="btn" id="btnSubmit">작성완료</button>
			</div>
		</form>
	</div>
	<script>
		// 섬머노트
		$('#summernote').summernote({
			lang : 'ko-KR',
			height : 500,
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
					}
				}
			}
		});

		function sendFile(file, el) {
			var form_data = new FormData();
			form_data.append('file', file);
			$.ajax({
				data : form_data,
				type : "POST",
				url : '/나중에할랭..',
				cache : false,
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(img_name) {
					$(el).summernote('editor.insertImage', img_name);
				}
			});
		}
	</script>
</body>
</html>