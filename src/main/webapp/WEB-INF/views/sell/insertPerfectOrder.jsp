<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
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
		Tagform+='<label class="col-md-2 col-xs-3 control-label">태그 설정</label>';
		Tagform+='<div class="col-md-3 col-xs-6 hashValue">';
		Tagform+='<input type="text" class="form-control inputstyle" name="list_hash" placeholder="태그를 입력해주세요." required="required" autocomplete="off">';
		Tagform+='</div>';
		Tagform+='<div class="col-md-1 col-xs-2">';
		Tagform+='<input type="button" class="btn searchTag" style="background-color: #7c7877; color:white;" value="검색")>';
		Tagform+='</div>';
		Tagform+='<div class="col-md-1 col-xs-1">';
		Tagform+='<button type="button" class="removeOpt"><span class="glyphicon glyphicon-minus-sign"></span></button>';
		Tagform+='</div>';
		Tagform+='<div class="col-md-5 col-xs-12 tagdiv"></div>';
		Tagform+='</div>';
	
		$('#tagForm').append(Tagform);
	}
	function optionAppend(){
		var optionform = "";
		
		optionform += '<div class="form-group">';
		optionform += '<label class="col-md-2 col-xs-3 control-label">옵션명</label>';
		optionform += '<div class="col-md-4 col-xs-8">';
		optionform += '<input type="text" class="form-control inputstyle" name="option_name" placeholder="옵션명을 입력해주세요." required="required" autocomplete="off">';
		optionform += '</div>';
		optionform += '<label class="col-md-1 col-xs-3 control-label">재고</label>';
		optionform += '<div class="col-md-1 col-xs-8">';
		optionform += '<input type="number" class="form-control inputstyle" name="option_stock" value="0" required="required" autocomplete="off">';
		optionform += '</div>';
		optionform += '<label class="col-md-1 col-xs-3 control-label">가격</label>';
		optionform += '<div class="col-md-1 col-xs-8">';
		optionform += '<input type="number" step="1000" class="form-control inputstyle" name="option_price" value="0" required="required" autocomplete="off">';
		optionform += '</div>';
		optionform += '<div class="col-md-1 col-xs-1">';
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
	hr{
		border-top: 3px double #D9D4CF !important;;
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
		background-color: #D9D4CF;
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
		color: #7C7877;
		font-family: 'Comfortaa', cursive;
		
	}
	.control-label{
		background-color: #ABD0CE;
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
		border-bottom: 2px solid #ABD0CE !important;
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
	
	@media (max-width: 991px) {
		.container {
			width: 90% !important;
			margin: auto !important;
		}
		
		.control-label {
			height: 60px;
			line-height: 50px;
			font-size: 35px;
			margin-top: 10px !important;
		}
		
		.form-control {
			height: 60px !important;
			font-size: 35px !important;
			margin-top: 10px;
		}
		
		input[type=file] {
			width: 165px !important;
			height: 60px;
			font-size: 35px;
			margin-top: 10px;
		}
		
		label[for=uploadFile] {
			font-size: 25px;
			margin-top: 10px;
		}
		
		.imgboard {
			width: 100% !important;
		}
		
		.mainImage {
			height: 500px !important;
		}
		
		.smimgbox {
			width: 30.5%;
		}
		
		.subImage {
			height: 200px !important;
		}
		
		.searchTag {
			width: 100px;
			height: 60px;
			font-size: 30px !important;
			margin-top: 10px;
		}
		
		.removeOpt {
			font-size: 30px;
		}
		
		.plusbtn {
			position: static !important;
			font-size: 30px;
		}
		
		.tagdiv {
			text-align: center;
			margin-top: 10px;
		}
		
		textarea {
			width: 100%;
			font-size: 30px !important;
		}
		
		.agreement {
			font-size: 30px !important;
			margin-bottom: 50px;
		}
		
		input[type=checkbox] {
			width: 30px;
			height: 30px;
		}
		
		#submit, #reset {
			width: 200px;
			height: 60px;
			font-size: 30px;
		}
	}
</style>
</head>
<body>
	<div class="jumbotron">
	  		<div class="container">
	  			
		  	</div>
		</div>
	<div id="intro" class="container">
		<p> </p>
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
						<label class="col-md-2 col-xs-3 control-label" for="list_title">게시글 제목</label>
						<div class="col-md-10 col-xs-9">
							<input type="text" class="form-control inputstyle" name="list_title" id="list_title" placeholder="내용을 입력해주세요." required="required" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 col-xs-3 control-label" for="list_product">상품 이름</label>
						<div class="col-md-10 col-xs-9">
							<input type="text" class="form-control inputstyle" name="list_product" id="list_product" placeholder="내용을 입력해주세요." required="required" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 col-xs-3 control-label" for="list_base_price">상품 가격</label>
						<div class="col-md-10 col-xs-9">
							<input type="number" class="form-control inputstyle" name="list_base_price" id="list_base_price" placeholder="내용을 입력해주세요." required="required" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 col-xs-3 control-label" for="list_category">카테고리</label>
						<div class="col-md-10 col-xs-9">
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
						<label class="col-md-2 col-xs-3 control-label" for="list_image_loc">상품 이미지</label>
						<div class="col-md-10 col-xs-9">
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
						<label class="col-md-2 col-xs-3 control-label">옵션명</label>
						<div class="col-md-4 col-xs-8">
							<input type="text" class="form-control inputstyle" name="option_name" value="기본(Default)" required="required" autocomplete="off">
						</div>
						<label class="col-md-1 col-xs-3 control-label">재고</label>
						<div class="col-md-1 col-xs-8">
							<input type="number" class="form-control inputstyle" name="option_stock" value="10" required="required" autocomplete="off">
						</div>
						<label class="col-md-1 col-xs-3 control-label">가격</label>
						<div class="col-md-1 col-xs-8">
							<input type="number" step="1000" class="form-control inputstyle" name="option_price" value="0" required="required" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 col-xs-3 control-label">옵션명</label>
						<div class="col-md-4 col-xs-8">
							<input type="text" class="form-control inputstyle" name="option_name" placeholder="옵션명을 입력해주세요." required="required" autocomplete="off">
						</div>
						<label class="col-md-1 col-xs-3 control-label">재고</label>
						<div class="col-md-1 col-xs-8">
							<input type="number" class="form-control inputstyle" name="option_stock" value="0" required="required" autocomplete="off">
						</div>
						<label class="col-md-1 col-xs-3 control-label">가격</label>
						<div class="col-md-1 col-xs-8">
							<input type="number" step="1000" class="form-control inputstyle" name="option_price" value="0" required="required" autocomplete="off">
							
						</div>
						<div class="col-md-1 col-xs-1">
							<button type="button" class="removeOpt"><span class="glyphicon glyphicon-minus-sign"></span></button>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 col-xs-3 control-label">옵션명</label>
						<div class="col-md-4 col-xs-8">
							<input type="text" class="form-control inputstyle" name="option_name" placeholder="옵션명을 입력해주세요." required="required" autocomplete="off">
						</div>
						<label class="col-md-1 col-xs-3 control-label">재고</label>
						<div class="col-md-1 col-xs-8">
							<input type="number" class="form-control inputstyle" name="option_stock" value="0" required="required" autocomplete="off">
						</div>
						<label class="col-md-1 col-xs-3 control-label">가격</label>
						<div class="col-md-1 col-xs-8">
							<input type="number" step="1000" class="form-control inputstyle" name="option_price" value="0" required="required" autocomplete="off">
							
						</div>
						<div class="col-md-1 col-xs-1">
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
						<label class="col-md-2 col-xs-3 control-label">태그 설정</label>
						<div class="col-md-3 col-xs-6 hashValue">
							<input type="text" class="form-control inputstyle" name="list_hash" placeholder="태그를 입력해주세요." required="required" autocomplete="off">
						</div>
						<div class="col-md-1 col-xs-2">
							<input type="button" class="btn searchTag" style="background-color: #7c7877; color:white;" value="검색">
						</div>
						<div class="col-md-6 col-xs-12 tagdiv"></div>
					</div>
					<div class="row" style="margin-left: 0px; margin-top: 20px;">
						<label class="col-md-2 col-xs-3 control-label">태그 설정</label>
						<div class="col-md-3 col-xs-6 hashValue">
							<input type="text" class="form-control inputstyle" name="list_hash" placeholder="태그를 입력해주세요." required="required" autocomplete="off">
						</div>
						<div class="col-md-1 col-xs-2">
							<input type="button" class="btn searchTag" style="background-color: #7c7877; color:white;" value="검색">
						</div>
						<div class="col-md-1 col-xs-1">
							<button type="button" class="removeOpt"><span class="glyphicon glyphicon-minus-sign"></span></button>
						</div>
						<div class="col-md-5 col-xs-12 tagdiv"></div>
					</div>
					<div class="row" style="margin-left: 0px; margin-top: 20px;">
						<label class="col-md-2 col-xs-3 control-label">태그 설정</label>
						<div class="col-md-3 col-xs-6 hashValue">
							<input type="text" class="form-control inputstyle" name="list_hash" placeholder="태그를 입력해주세요." required="required" autocomplete="off">
						</div>
						<div class="col-md-1 col-xs-2">
							<input type="button" class="btn searchTag" style="background-color: #7c7877; color:white;" value="검색">
						</div>
						<div class="col-md-1 col-xs-1">
							<button type="button" class="removeOpt"><span class="glyphicon glyphicon-minus-sign"></span></button>
						</div>
						<div class="col-md-5 col-xs-12 tagdiv"></div>
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
					<textarea rows="10" cols="50" readonly="readonly" style="overflow:scroll;"> 		개인정보  수집 이용  동의서

개인정보의 수집 이용 목적
1 공동주택관리법 제 조  및  동법시행령  제 조  등에  따라  공동주택  동별
대표자  선출 공고 및  입주자대표회의로서  활동  등에  필요한  개인정보를  수집
및 이용 결격사유 조회 등 하기 위한 동의사항입니다(  ) .
수집하려는 개인정보의 항목
2 공동주택관리법 제 조 및 동법시행령 제 조 등에 따른 동별 대표자 선출 
결격사유조회 등 및 공고를 위한 개인정보로서 성명 주소 주민등록번호 등록 
기준지 연락처 최종학력 직장 직위 사회경력 관리비 납부사항 등의 개인정보
와 상기법령에 따른 결격사유 조회결과 등의 사항에 대하여 개인정보를 수집 및 
이용하고자 합니다.
개인정보의 보유 및 이용기간
3 공동주택법령에 따른 동별 대표자 선출 및 입주자대표회의 구성원으로서 활동
기간 동안 해당 정보를 보유 및 활용하며 원칙적으로 개인정보 수집 및 이용목,  
적이 달성된 후 임기만료 및 사퇴 등 에는 해당 정보를 지체 없이 파기합니다
동의를 거부할 권리가 있다는 사실 및 동의거부에 따른 불이익이 있는 
경우 그 불이익의 내용, 개인정보의 수집 및 이용에 거부할 수 있으나 상기 개인정보 동의거부시 주택
법령에 따른 동별 대표자 선출을 위한 결격사유 조회 등이 불가능하여 선거 진
행 및 선출이 불가능 합니다.

개인정보보호법 제 3조 개인정보의  수집이용 및  공동주택관리법 제 조에
의거하여 본인의 개인정보를 위와 같이 수집 이용하도록 하는데 동의합니다.</textarea>
		 			<input type="checkbox" id="ac1" value="check" required="required"><label for="ac1" class="agreement">(필수) 위 사항을 충분히 인지하였고 이에 동의합니다.</label>
				</div>
				<div class="col-md-4">
					<textarea rows="10" cols="50" readonly="readonly" style="overflow:scroll;"> 개인정보의 수집 이용 목적
1 공동주택관리법 제 조  및  동법시행령  제 조  등에  따라  공동주택  동별
대표자  선출 공고 및  입주자대표회의로서  활동  등에  필요한  개인정보를  수집
및 이용 결격사유 조회 등 하기 위한 동의사항입니다(  ) .
수집하려는 개인정보의 항목
2 공동주택관리법 제 조 및 동법시행령 제 조 등에 따른 동별 대표자 선출 
결격사유조회 등 및 공고를 위한 개인정보로서 성명 주소 주민등록번호 등록 
기준지 연락처 최종학력 직장 직위 사회경력 관리비 납부사항 등의 개인정보
와 상기법령에 따른 결격사유 조회결과 등의 사항에 대하여 개인정보를 수집 및 
이용하고자 합니다.
개인정보의 보유 및 이용기간
3 공동주택법령에 따른 동별 대표자 선출 및 입주자대표회의 구성원으로서 활동
기간 동안 해당 정보를 보유 및 활용하며 원칙적으로 개인정보 수집 및 이용목,  
적이 달성된 후 임기만료 및 사퇴 등 에는 해당 정보를 지체 없이 파기합니다
동의를 거부할 권리가 있다는 사실 및 동의거부에 따른 불이익이 있는 
경우 그 불이익의 내용, 개인정보의 수집 및 이용에 거부할 수 있으나 상기 개인정보 동의거부시 주택
법령에 따른 동별 대표자 선출을 위한 결격사유 조회 등이 불가능하여 선거 진
행 및 선출이 불가능 합니다.

개인정보보호법 제 3조 개인정보의  수집이용 및  공동주택관리법 제 조에
의거하여 본인의 개인정보를 위와 같이 수집 이용하도록 하는데 동의합니다.</textarea>
					<input type="checkbox" id="ac2" value="check" required="required"><label for="ac2" class="agreement">(필수) 위 사항을 충분히 인지하였고 이에 동의합니다.</label>
				</div>
				<div class="col-md-4">
					<textarea rows="10" cols="50" readonly="readonly" style="overflow:scroll;"> 개인정보의 수집 이용 목적
1 공동주택관리법 제 조  및  동법시행령  제 조  등에  따라  공동주택  동별
대표자  선출 공고 및  입주자대표회의로서  활동  등에  필요한  개인정보를  수집
및 이용 결격사유 조회 등 하기 위한 동의사항입니다(  ) .
수집하려는 개인정보의 항목
2 공동주택관리법 제 조 및 동법시행령 제 조 등에 따른 동별 대표자 선출 
결격사유조회 등 및 공고를 위한 개인정보로서 성명 주소 주민등록번호 등록 
기준지 연락처 최종학력 직장 직위 사회경력 관리비 납부사항 등의 개인정보
와 상기법령에 따른 결격사유 조회결과 등의 사항에 대하여 개인정보를 수집 및 
이용하고자 합니다.
개인정보의 보유 및 이용기간
3 공동주택법령에 따른 동별 대표자 선출 및 입주자대표회의 구성원으로서 활동
기간 동안 해당 정보를 보유 및 활용하며 원칙적으로 개인정보 수집 및 이용목,  
적이 달성된 후 임기만료 및 사퇴 등 에는 해당 정보를 지체 없이 파기합니다
동의를 거부할 권리가 있다는 사실 및 동의거부에 따른 불이익이 있는 
경우 그 불이익의 내용, 개인정보의 수집 및 이용에 거부할 수 있으나 상기 개인정보 동의거부시 주택
법령에 따른 동별 대표자 선출을 위한 결격사유 조회 등이 불가능하여 선거 진
행 및 선출이 불가능 합니다.

개인정보보호법 제 3조 개인정보의  수집이용 및  공동주택관리법 제 조에
의거하여 본인의 개인정보를 위와 같이 수집 이용하도록 하는데 동의합니다.</textarea>
					<input type="checkbox" id="ac3" value="check"><label for="ac3" class="agreement">(선택) 위 사항을 충분히 인지하였고 이에 동의합니다.</label>
				</div>
				</div>
				
			</div>
			<div class="form-group">
				<input type="reset" class="btn" style="background-color:#a6c7c6; color:white;" id="reset" value="취소"> 
				<input type="submit" class="btn" style="background-color:#1ed676; color:white;" id="submit" value="제출"> 
			</div>
			
		</form>
			
	</div>
</body>
</html>