<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script>
	$(function(){
		$("#uploadBtn").on("click", function(e){
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			console.log(files);
			
			for(var i=0; i<files.length; i++){
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url:'/controller/uploadAjaxAction',
				processData:false,
				contentType:false,
				data:formData,
				type:'POST',
				success:function(result){
					console.log(result);
					alert("Uploaded");
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="container">
		<p>뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀
		이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보
		이는 것은 거친뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다
		사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황
		하여도 보이는 것은 거친뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의
		 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때
		 까지 방황하여도 보이는 것은 거친</p>
	</div>
	<hr>
	<div class="container">
		<h2>기본 정보</h2>
		<form class="form-horizontal" role="form">
			<div class="row">
				<div class="col-md-8">
					<div class="form-group">
						<label class="col-md-2 control-label" for="list_title">게시글 제목</label>
						<div class="col-md-10">
							<input type="text" class="form-control" name="list_title" id="list_title" placeholder="내용을 입력해주세요.">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="list_product">상품 이름</label>
						<div class="col-md-10">
							<input type="text" class="form-control" name="list_product" id="list_product" placeholder="내용을 입력해주세요.">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="list_base_price">게시글 제목</label>
						<div class="col-md-10">
							<input type="text" class="form-control" name="list_base_price" id="list_base_price" placeholder="내용을 입력해주세요.">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="list_category">카테고리</label>
						<div class="col-md-10">
							<select class="form-control">
								<option value="book">책</option>
			          			<option value="cup">머그컵</option>
			         	 		<option value="table">가구</option>
			         	 		<option value="accessary">악세사리</option>
			         	 		<option value="handmade">공예</option>
			         	 		<option value="anything">기타</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="list_image_loc">상품 이미지</label>
						<div class="col-md-10">
							<input type="file" name="uploadFile" multiple>
							<input type="button" id="uploadBtn" value="등록">
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="row">
						<div id="uploadedImage"></div>
					</div>
					<div class="row">
						<div class="col-md-4" id="uploadedImage2"></div>
						<div class="col-md-4" id="uploadedImage3"></div>
						<div class="col-md-4" id="uploadedImage4"></div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>