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

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<script>
	function optionAppend(){
		var optionform = "";
		
		optionform += '<div class="form-group">';
		optionform += '<label class="col-md-2 control-label">옵션명</label>';
		optionform += '<div class="col-md-4">';
		optionform += '<input type="text" class="form-control" name="option_name" placeholder="옵션명을 입력해주세요.">';
		optionform += '</div>';
		optionform += '<label class="col-md-1 control-label">재고</label>';
		optionform += '<div class="col-md-1">';
		optionform += '<input type="number" class="form-control" name="option_stock" value="0">';
		optionform += '</div>';
		optionform += '<label class="col-md-1 control-label">가격</label>';
		optionform += '<div class="col-md-2">';
		optionform += '<input type="number" step="1000" class="form-control" name="option_price" value="0">';
		optionform += '</div>';
		optionform += '</div>';
		
		$('#optionForm').append(optionform);
	}
	$(function(){
		$('#summernote').summernote({
			toolbar:[
				['style', ['bold', 'italic', 'underline', 'clear']],
			    ['font', ['strikethrough', 'superscript', 'subscript']],
			    ['fontsize', ['fontsize']],
			    ['color', ['color']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']]
			],
			height: 400
		});

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
				dataType:'json',
				success:function(result){
					console.log(result);
					var time = new Date().getTime();
					var firstImagePath = "/controller/resources/image/" + result[0].uuid + "-" + result[0].fileName;
					console.log(firstImagePath);
					$(".mainImage").prop('src', firstImagePath);
					var secondImagePath = "/controller/resources/image/" + result[1].uuid + "-" + result[1].fileName;
					$(".subImage:eq(0)").prop('src', secondImagePath);
					var thirdImagePath = "/controller/resources/image/" + result[2].uuid + "-" + result[2].fileName;
					$(".subImage:eq(1)").prop('src', thirdImagePath);
					var fourthImagePath = "/controller/resources/image/" + result[3].uuid + "-" + result[3].fileName;
					$(".subImage:eq(2)").prop('src', fourthImagePath);
				}
			});
		});
	});

	
</script>
<style>
	.mainImage{
		display:inline-block;
		height:350px !important;
		width:350px !important;
	}
	.subImage{
		display:inline-block;
		height:100px !important;
		width:100px !important;
	}
	#introduce{
		height:443px;
		text-align: center;
		font-weight: bolder;
		font-size: 20px;
		background-color: brown;
	}
</style>
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
		<form class="form-horizontal" role="form" method="post">
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
						<label class="col-md-2 control-label" for="list_base_price">상품 가격</label>
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
						<div class="col-md-2 uploadResult">
							<ul></ul>
						</div>
					</div>
					<div class="form-group imagehiddenloc">
						
					</div>
				</div>
				<div class="col-md-4">
					<div class="row">
						<div id="uploadedImage">
							<img class="mainImage" src="" alt="업로드 된 이미지가 없습니다.">
						</div>
					</div>
					<div class="row">
						<div class="col-md-4" id="uploadedImage2">
							<img class="subImage" src="" alt="업로드 된 이미지가 없습니다.">
						</div>
						<div class="col-md-4" id="uploadedImage3">
							<img class="subImage" src="" alt="업로드 된 이미지가 없습니다.">
						</div>
						<div class="col-md-4" id="uploadedImage4">
							<img class="subImage" src="" alt="업로드 된 이미지가 없습니다.">
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="row">
				<h2>상품 소개</h2>
				<div id="introduce" class="col-md-3">상품 소개</div>
				<div class="col-md-9">
					<textarea id="summernote" name="list_content"></textarea>
				</div>
			</div>
			<hr>
			<div class="row">
				<h2>옵션 추가</h2>
				<div id="optionForm">
					<div class="form-group">
						<label class="col-md-2 control-label">옵션명</label>
						<div class="col-md-4">
							<input type="text" class="form-control" name="option_name" value="기본(Default)">
						</div>
						<label class="col-md-1 control-label">재고</label>
						<div class="col-md-1">
							<input type="number" class="form-control" name="option_stock" value="10">
						</div>
						<label class="col-md-1 control-label">가격</label>
						<div class="col-md-2">
							<input type="number" step="1000" class="form-control" name="option_price" value="0">
						</div>
					</div>
				</div>
			</div>
			<input type="button" class="btn" value="+" onclick="optionAppend()">
			
		</form>
	</div>
</body>
</html>