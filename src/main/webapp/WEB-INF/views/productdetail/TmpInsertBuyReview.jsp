<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    
    <script>z
    	$(document).ready(function() {
			$('#imgUploadButton').on('click', imgUpload);
			$('.starButton').on('click', startScore);
		});
    	
    	function imgUpload() {
    		let formData = new FormData();
    		let imgFile = $('#imgUpload');
    		imgFile = imgFile[0].files;
    		formData.append("uploadFile", imgFile[0]);
    		$.ajax({
    			url:'/ajaxBuyReviewImgUpload'
    			,data: formData
    			,dataType: 'json'
    			,processData: false
    			,contentType: false
    			,type: 'POST'
    			,success: function(data) {
					console.log('성공');
					if(data.fileName != null) {
						let imgPath = "/resources/image/buyReviewImg/" + data.fileName;
						$('#imgUploadTag').prop('src',imgPath);
						$('#BuyReviewImg').val(imgPath);
					}
					else {
						alert('이미지를 먼저 등록해주세요');
					}
				}
    			,error:function(data){
					console.log('실패');
				}
    		});
    	}
    	
    	function startScore() {
    		let idName = $(this).attr('id');
    		let idNum = Number(idName.replace(/[^0-9]/g, ''));
    		for(let i=1; i <= 5; i++) {
    			if(i <= idNum) {
    				$('#star'+i).text('★');
    				$('#star'+i).css('color','#FFA500');
    			}
    			else {
    				$('#star'+i).text('☆');
    				$('#star'+i).css('color','black');
    			}
    		}
    		$('#startScoreInput').val(idNum);
    	}
    	
    	
    </script>
    <style>
    	.starButton {
    		background-color: white;
    		border: 0px;
    		font-size:50px;
    		width: 70px;
    		height: 70px;
    	}
    	
    </style>
<body>
	<h1>별점!</h1>
	<div class="starBox">
		<button id="star1" class="starButton">☆</button>
		<button id="star2" class="starButton">☆</button>
		<button id="star3" class="starButton">☆</button>
		<button id="star4" class="starButton">☆</button>
		<button id="star5" class="starButton">☆</button>
	</div>
<h1>구매후기 등록페이지</h1>
<div class="container" >
	<div class="row">
		<div> 
			<form method="post" action="/buyReviewResult">
			<ul>
				<li>
					<input type="text" value="옵션내용입니다." name="BuyReviewOption" readonly="readonly">
				</li>
				<li>
					<input type="number" value="1" id="startScoreInput" name="BuyReviewScore" required="required" readonly="readonly">
				</li>
				<li>
					<input type="text" value="구매후기" name="BuyReviewContent" required="required">
				</li>
				<li>
					<input type="text" value="" name="BuyReviewImg" id="BuyReviewImg">
				</li>
				<li>
					<input type="file" id="imgUpload">
				</li>
				<li>
					<input type="button" class="btn" id="imgUploadButton" value="업로드">
				</li>
				<li>
					<img src="" alt="이미지를 등록해주세요" id="imgUploadTag">
				</li>
				<li>
					<input type="submit" value="전송">
				</li>
			</ul>
			</form>
		</div>
	</div>
</div>
</body>
</html>