<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
	.simHash{
		margin:0px 10px !important;
		padding:5px 10px !important;
		border: 1px solid silver !important;
		border-radius: 20px !important;
		background-color: #f5f5f5;
		color:silver;
	}
</style>
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
<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
<script>
	
	function TagAppend(){
		var Tagform = "";
		Tagform+='<div class="row" style="margin-left: 0px; margin-top: 20px;">';
		Tagform+='<label class="col-md-2 control-label">태그 설정</label>';
		Tagform+='<div class="col-md-3 hashValue">';
		Tagform+='<input type="text" class="form-control inputstyle" name="list_hash" placeholder="태그를 입력해주세요." required="required" autocomplete="off">';
		Tagform+='</div>';
		Tagform+='<div class="col-md-1">';
		Tagform+='<input type="button" class="btn searchTag btn-info" value="검색")>';
		Tagform+='</div>';
		Tagform+='<div class="col-md-1">';
		Tagform+='<button type="button" class="removeOpt"><span class="glyphicon glyphicon-minus-sign"></span></button>';
		Tagform+='</div>';
		Tagform+='<div class="col-md-5 tagdiv"></div>';
		Tagform+='</div>';
	
		$('#tagForm').append(Tagform);
	}
	function optionAppend(){
		var optionform = "";
		
		optionform += '<div class="form-group">';
		optionform += '<label class="col-md-2 control-label">옵션명</label>';
		optionform += '<div class="col-md-4">';
		optionform += '<input type="text" class="form-control inputstyle" name="option_name" placeholder="옵션명을 입력해주세요." required="required" autocomplete="off">';
		optionform += '</div>';
		optionform += '<label class="col-md-1 control-label">재고</label>';
		optionform += '<div class="col-md-1">';
		optionform += '<input type="number" class="form-control inputstyle" name="option_stock" value="0" required="required" autocomplete="off">';
		optionform += '</div>';
		optionform += '<label class="col-md-1 control-label">가격</label>';
		optionform += '<div class="col-md-1">';
		optionform += '<input type="number" step="1000" class="form-control inputstyle" name="option_price" value="0" required="required" autocomplete="off">';
		optionform += '</div>';
		optionform += '<div class="col-md-1">';
		optionform += '<button type="button" class="removeOpt"><span class="glyphicon glyphicon-minus-sign"></span></button>';
		optionform += '</div>';
		optionform += '</div>';
		
		$('#optionForm').append(optionform);
	}
	$(document).on('click', '.removeOpt', function(){
		$(this).parent().parent().remove();
	});
	$(document).on('click', '.simHash', function(){
		$(this).parent().parent().children('.hashValue').children('input').val($(this).val().substring(1));
	});

	$(document).on('click', '.searchTag', function(){
		var searchData = $(this).parent().parent().children('.hashValue').children('input').val();
		var tagdiv = $(this).parent().parent().children('.tagdiv');
		console.log($(this).parent());
		console.log($(this).parent().parent());
		console.log($(this).parent().parent().children('.hashValue'));
		console.log($(this).parent().parent().children('.hashValue').children('input'));
		console.log(searchData);
		
		$.ajax({
			url:"/ajaxHashSearcher?searchData="+searchData
			, type:"GET"
			, dataType:"json"
			, success:function(data){
				var result = "";
				$.each(data, function(index, value){
					result += '<input type="button" class="btn simHash" value=#'+value+'>';
				});
				
				tagdiv.html(result);
				
			}
		});
		
	});
	$(function(){		

		$("#uploadFile").on("change", function(e){
			
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);
			for(var i=0; i<files.length; i++){
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url:'/sell/uploadAjaxAction',
				processData:false,
				contentType:false,
				data:formData,
				type:'POST',
				dataType:'json',
				
				success:function(result){
					console.log(result);
					var loc = "";
					if(result.length > 0){
						var firstImagePath = "/resources/image/dimage/" + result[0].uuid + "-" + result[0].fileName;
						$(".mainImage").prop('src', firstImagePath);
						loc+='<input type="hidden" name="list_image_loc" value="'+firstImagePath+'">';
					}
					if(result.length > 1){
						var secondImagePath = "/resources/image/dimage/" + result[1].uuid + "-" + result[1].fileName;
						$(".subImage:eq(0)").prop('src', secondImagePath);
						loc+='<input type="hidden" name="list_image_loc" value="'+secondImagePath+'">';
					}
					if(result.length > 2){
						var thirdImagePath = "/resources/image/dimage/" + result[2].uuid + "-" + result[2].fileName;
						$(".subImage:eq(1)").prop('src', thirdImagePath);
						loc+='<input type="hidden" name="list_image_loc" value="'+thirdImagePath+'">';
					}
					if(result.length > 3){
						var fourthImagePath = "/resources/image/dimage/" + result[3].uuid + "-" + result[3].fileName;
						$(".subImage:eq(2)").prop('src', fourthImagePath);
						loc+='<input type="hidden" name="list_image_loc" value="'+fourthImagePath+'">';
					}
					if(result.length > 4){
						alert("너무 많은 이미지를 업로드 하셨습니다. (4장까지 업로드)");
					}
					$('.imagehiddenloc').html(loc);
					
					
				}
			});
		});
	});

	
</script>
<style>
	body{
		margin: 0px;
		padding: 0px;
		background-color: white !important;
	}
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
	.jumbotron{
		background-image: url("/resources/image/perfectimage.jpeg");
		background-size: cover;
		height: 400px;
	}
	#intro{
		margin-top: 55px;
		margin-bottom:55px;
		background-color: rgba(179,202,197, 0.4);
		border-radius: 20px;
		padding: 20px;
		font-size: 1.2em;
		font-weight:600;
	}
	.ctitle{
		text-align: center;
	}
	.ctitle h2{
		font-size: 2.8em;
		font-weight: bold;
		margin-bottom: 65px;
		color: #676057;
		font-family: 'Comfortaa', cursive;
		text-decoration: underline;
	}
	.control-label{
		background-color: #e8e2cd;
		border-radius: 5px;
		text-align: center !important;
		padding: 5px;
	}
	.form-group{
		margin-top: 30px !important;
	}
	.imgboard{
		border: 1.5px solid silver; 
		margin-bottom:20px;
	}
	.inputstyle{
		border:none !important;
		border-bottom: 2px solid silver !important;
		box-shadow: none !important;
		border-radius: 0px !important;
		background-color: transparent !important;
	}
	#uploadFile{
		display: inline-block;
		width:80px;
		margin-right: 10px;
	}
	#optplusbtn{
		position: absolute;
		bottom: 10px;
		right: 20px;
	}
	.optparent{
		position: relative;
	}
	#imgbox{
		padding:0px;
	}
	.smimgbox{
		padding: 0px;
		display: inline-block;
		margin-right:21px;
	}
	.tagbox{
		position: relative;
	}
	#tagbtn{
		position: absolute;
		right: 15px;
		bottom: 10px;
	}
	.removeOpt{
		background-color: transparent !important;
		border: none;
		padding: 8px 0 0 0;
		font-size: 1.4em;
	}
	.imagecenter{
		text-align: center;
	}
	#tagForm{
		position: relative;
		left:15px;
	}
	#optionForm{
		position: relative;
		left:15px;
	}
	.plusbtn{
		background-color: transparent !important;
		border: none;
		padding: 8px 0 0 0;
		font-size: 1.4em;
		color:green;
	}
</style>
</head>
<body>
	<div class="jumbotron">
	  		<div class="container">
	  			
		  	</div>
		</div>
	<div id="intro" class="container">
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
	<form class="form-horizontal" name="form" role="form" method="post" action="/sell/insertPerfectOrderForm">
		<div class="row">
			<div class="col-md-7">
				<div class="ctitle">
					<h2>Basic Information</h2>
				</div>
				<div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="list_title">게시글 제목</label>
						<div class="col-md-10">
							<input type="text" class="form-control inputstyle" name="list_title" id="list_title" placeholder="내용을 입력해주세요." required="required" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="list_product">상품 이름</label>
						<div class="col-md-10">
							<input type="text" class="form-control inputstyle" name="list_product" id="list_product" placeholder="내용을 입력해주세요." required="required" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="list_base_price">상품 가격</label>
						<div class="col-md-10">
							<input type="number" class="form-control inputstyle" name="list_base_price" id="list_base_price" placeholder="내용을 입력해주세요." required="required" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label" for="list_category">카테고리</label>
						<div class="col-md-10">
							<select class="form-control inputstyle" name="list_category" id="list_category">
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
							<input type="file" name="uploadFile" id="uploadFile" multiple accept=".jpg,.jpeg,.bmp">
							<label for="uploadFile">*업로드 할 파일을 선택해주세요. (최대 4개까지)</label>
						</div>
					</div>
					<div class="form-group imagehiddenloc">
						
					</div>
				</div>
			</div>
			<div class="col-md-4 col-md-offset-1" id="imgbox">
					<div class="row imagecenter">
						<div id="uploadedImage">
							<img class="imgboard mainImage" src="/resources/image/alter.jpg" alt="업로드 된 이미지가 없습니다.">
						</div>
					</div>
					<div class="row imagecenter">
						<div class="smimgbox" id="uploadedImage2">
							<img class="imgboard subImage" src="/resources/image/alter.jpg" alt="업로드 된 이미지가 없습니다.">
						</div>
						<div class="smimgbox" id="uploadedImage3">
							<img class="imgboard subImage" src="/resources/image/alter.jpg" alt="업로드 된 이미지가 없습니다.">
						</div>
						<div class="smimgbox" id="uploadedImage4">
							<img class="imgboard subImage" src="/resources/image/alter.jpg" alt="업로드 된 이미지가 없습니다.">
						</div>
					<div id="hiddenImageLoc">
						
					</div>
				</div>
			</div>
			</div>
			<hr>
			<div class="row">
				<div class="ctitle">
					<h2>About Products</h2>
				</div>
				<div class="col-md-12">
					<textarea id="summernote" name="list_content" required="required"></textarea>
				</div>
				<script>
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
				</script>
			</div>
			<hr>
			<div class="row optparent">
				<div class="ctitle">
					<h2>Add Option</h2>
				</div>
				<div id="optionForm">
					<div class="form-group">
						<label class="col-md-2 control-label">옵션명</label>
						<div class="col-md-4">
							<input type="text" class="form-control inputstyle" name="option_name" value="기본(Default)" required="required" autocomplete="off">
						</div>
						<label class="col-md-1 control-label">재고</label>
						<div class="col-md-1">
							<input type="number" class="form-control inputstyle" name="option_stock" value="10" required="required" autocomplete="off">
						</div>
						<label class="col-md-1 control-label">가격</label>
						<div class="col-md-1">
							<input type="number" step="1000" class="form-control inputstyle" name="option_price" value="0" required="required" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">옵션명</label>
						<div class="col-md-4">
							<input type="text" class="form-control inputstyle" name="option_name" placeholder="옵션명을 입력해주세요." required="required" autocomplete="off">
						</div>
						<label class="col-md-1 control-label">재고</label>
						<div class="col-md-1">
							<input type="number" class="form-control inputstyle" name="option_stock" value="0" required="required" autocomplete="off">
						</div>
						<label class="col-md-1 control-label">가격</label>
						<div class="col-md-1">
							<input type="number" step="1000" class="form-control inputstyle" name="option_price" value="0" required="required" autocomplete="off">
							
						</div>
						<div class="col-md-1">
							<button type="button" class="removeOpt"><span class="glyphicon glyphicon-minus-sign"></span></button>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">옵션명</label>
						<div class="col-md-4">
							<input type="text" class="form-control inputstyle" name="option_name" placeholder="옵션명을 입력해주세요." required="required" autocomplete="off">
						</div>
						<label class="col-md-1 control-label">재고</label>
						<div class="col-md-1">
							<input type="number" class="form-control inputstyle" name="option_stock" value="0" required="required" autocomplete="off">
						</div>
						<label class="col-md-1 control-label">가격</label>
						<div class="col-md-1">
							<input type="number" step="1000" class="form-control inputstyle" name="option_price" value="0" required="required" autocomplete="off">
							
						</div>
						<div class="col-md-1">
							<button type="button" class="removeOpt"><span class="glyphicon glyphicon-minus-sign"></span></button>
						</div>
					</div>
				</div>
				<button type="button" class="plusbtn" id="optplusbtn" onclick="optionAppend()"><span class="glyphicon glyphicon-plus"></span></button>
			</div>
			
			<hr>
			<div class="row tagbox">
				<div class="ctitle">
					<h2>Select HashTag</h2>
				</div>
				<div class="form-group" id="tagForm">
					<div class="row" style="margin-left: 0px;">
						<label class="col-md-2 control-label">태그 설정</label>
						<div class="col-md-3 hashValue">
							<input type="text" class="form-control inputstyle" name="list_hash" placeholder="태그를 입력해주세요." required="required" autocomplete="off">
						</div>
						<div class="col-md-1">
							<input type="button" class="btn searchTag btn-info" value="검색">
						</div>
						<div class="col-md-6 tagdiv"></div>
					</div>
					<div class="row" style="margin-left: 0px; margin-top: 20px;">
						<label class="col-md-2 control-label">태그 설정</label>
						<div class="col-md-3 hashValue">
							<input type="text" class="form-control inputstyle" name="list_hash" placeholder="태그를 입력해주세요." required="required" autocomplete="off">
						</div>
						<div class="col-md-1">
							<input type="button" class="btn searchTag btn-info" value="검색">
						</div>
						<div class="col-md-1">
							<button type="button" class="removeOpt"><span class="glyphicon glyphicon-minus-sign"></span></button>
						</div>
						<div class="col-md-5 tagdiv"></div>
					</div>
					<div class="row" style="margin-left: 0px; margin-top: 20px;">
						<label class="col-md-2 control-label">태그 설정</label>
						<div class="col-md-3 hashValue">
							<input type="text" class="form-control inputstyle" name="list_hash" placeholder="태그를 입력해주세요." required="required" autocomplete="off">
						</div>
						<div class="col-md-1">
							<input type="button" class="btn searchTag btn-info" value="검색">
						</div>
						<div class="col-md-1">
							<button type="button" class="removeOpt"><span class="glyphicon glyphicon-minus-sign"></span></button>
						</div>
						<div class="col-md-5 tagdiv"></div>
					</div>
				</div>
				<button type="button" class="plusbtn" id="tagbtn" onclick="TagAppend()"><span class="glyphicon glyphicon-plus"></span></button>
			</div>
			<hr>
			<div class="row">
				<div class="ctitle">
					<h2>Agreement</h2>
				</div>
				<div class="row">
					<div class="col-md-4">
					<textarea rows="10" cols="50" readonly="readonly" style="overflow:scroll;"> 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀
		이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보
		이는 것은 거친뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다
		사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황
		하여도 보이는 것은 거친뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의
		 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때
		 까지 방황하여도 보이는 것은 거친</textarea>
		 			<input type="checkbox" id="ac1" value="check" required="required"><label for="ac1">(필수) 위 사항을 충분히 인지하였고 이에 동의합니다.</label>
				</div>
				<div class="col-md-4">
					<textarea rows="10" cols="50" readonly="readonly" style="overflow:scroll;"> 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀
		이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보
		이는 것은 거친뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다
		사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황
		하여도 보이는 것은 거친뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의
		 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때
		 까지 방황하여도 보이는 것은 거친</textarea>
					<input type="checkbox" id="ac2" value="check" required="required"><label for="ac2">(필수) 위 사항을 충분히 인지하였고 이에 동의합니다.</label>
				</div>
				<div class="col-md-4">
					<textarea rows="10" cols="50" readonly="readonly" style="overflow:scroll;"> 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀
		이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보
		이는 것은 거친뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다
		사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황
		하여도 보이는 것은 거친뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의
		 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때
		 까지 방황하여도 보이는 것은 거친</textarea>
					<input type="checkbox" id="ac3" value="check"><label for="ac3">(선택) 위 사항을 충분히 인지하였고 이에 동의합니다.</label>
				</div>
				</div>
				
			</div>
			<div class="form-group">
				<input type="reset" class="btn btn-default" id="reset" value="취소"> 
				<input type="submit" class="btn btn-primary" id="submit" value="제출"> 
			</div>
			
		</form>
			
	</div>
</body>
</html>