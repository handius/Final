<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
    <style>
    
        .row {
            margin: 0 !important;
        }
        
        .col-xs-1, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9, .col-xs-10, .col-xs-11, .col-xs-12 {
            padding: 0 !important;
        }
        
        #artistDetailImgBox {
            height: 300px;
            background-color: azure;
            overflow: hidden;
            padding: 0;
        }
        
        #artistDetailImgBox img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        #artistDetailTitleBox {
            height: 400px;
            font-size: 20px;
            margin-top: 20px;
        }
        
        #ImgUploadButtonBox {
            background-color: #7C7877;
            height: 50px;
            color: white;
            font-size: 30px;
            text-align: center;
            padding-top: 7px !important;
        }

        #artistBoardDetailImgPath {
            width: 100%;
            height: 50px;
            line-height: 50px;
            border: 3px solid #7C7877;
            font-size: 20px;
            overflow: hidden;
            text-overflow: ellipsis;
            padding: 0 10px;
            
        }
        
        #artistDetailImgModify {
            display: none;
        }
        
        #submitButton {
            width: 49.5%;
            height: 50px;
            display: inline-block;
            color: white;
            font-size: 20px;
            border: 0;
            background-color: #7C7877;
            margin-bottom: 20px;
        }
        
        #resetButton {
            width: 49.5%;
            height: 50px;
            display: inline-block;
            color: #7C7877;
            font-size: 20px;
            border: 3px solid #7C7877;
            background-color: white;
            margin-bottom: 20px;
        }
        
        /*섬머노트 기능제한*/
        div.note-insert {
            display: none;
        }
        
        @media (max-width: 767px) {
        	.container {
        		width:100%;
        	}
        }
        
    </style>
    <script>
    
    function artistDetailImgModifyChange() {
    	let formData = new FormData();
    	let imgFile = $('#artistDetailImgModify');
    	imgFile = imgFile[0].files;
    	formData.append("uploadFile", imgFile[0]);
    	$.ajax({
			url:'/ajaxArtistDetailModifyImgUpload'
			,data: formData
			,dataType: 'json'
			,processData: false
			,contentType: false
			,type: 'POST'
			,success: function(data) {
				console.log('성공');
				console.log(data);
				if(data.fileName != null) {
					let imgPath = "/resources/image/artistTitleImg/" + data.fileName;
					$('#artistDetailTitleImg').prop('src',imgPath);
					$('#artistBoardDetailImgPath').val(imgPath);
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
    
    function resetButtonClick() {
    	window.history.back();
    }
    </script>
</head>
<body>
	<div class="container">
		<div id="artistDetailImgBox">
			<img src="${artistBoardDetail.artist_main_img }" alt="메인이미지" id="artistDetailTitleImg">
		</div>
		<form method="post" action="/artistDetail/artistDetailModifyResult">
			<input type="hidden" value="${artistBoardDetail.artist_no }" name="artist_no" id="artist_no" readonly="readonly" required="required">
           <div class="row">
               <div class="col-xs-2" id="ImgUploadButtonBox">
                    <label for="artistDetailImgModify">
                        <span class="glyphicon glyphicon-picture" id="ImgUploadButton">업로드</span>
                    </label>
                    <input type="file" class="" id="artistDetailImgModify" onchange=" artistDetailImgModifyChange() ">
               </div>
               <div class="col-xs-10">
                   <input type="text" value="${artistBoardDetail.artist_main_img }" name="artist_main_img" id="artistBoardDetailImgPath"readonly="readonly">
               </div>
           </div>
			<div id="artistDetailTitleBox">
        		<textarea name="artist_board_title" id="summernote" maxlength="99" required="required">${artistBoardDetail.artist_board_title }</textarea> 
        	</div>
        	<button type="submit" id="submitButton">수정완료</button>
        	<input type="reset" id="resetButton" onclick="resetButtonClick()" value="수정취소">
		</form>
	</div>
	<script>
    $('#summernote').summernote({
  	    lang:'ko-KR',
        height: 300,
        minHeight: 100,             
        maxHeight: 300,
    });
	</script>
</body>
</html>