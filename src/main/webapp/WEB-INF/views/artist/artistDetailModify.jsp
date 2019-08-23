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
    <script>
    document.ready(function(){
    	
    });
    
    function artistDetailImgModify() {
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
					$('#artistBoardDetailImgPath').text(imgPath);
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
    </script>
</head>
<body>
<!-- 기본 활용 정보 -->
<input type="hidden" value="${artistBoardDetail.artist_no }" id="artist_no" readonly="readonly">
<input type="hidden" value="${artistBoardDetail.artist_board_title }" id="artist_board_title" readonly="readonly">
	<div class="container">
		<div id="artistDetailImgBox">
			<img src="${artistBoardDetail.artist_main_img }" alt="메인이미지" id="artistDetailTitleImg">
		</div>
		<form method="post" action="/artistDetail/artistDetailModifyResult">
			<input type="text" value="${artistBoardDetail.artist_main_img }" name="artist_main_img" id="artistBoardDetailImgPath"readonly="readonly">
			<input type="file" id="artistDetailImgModify" onchange="artistDetailImgModify()">
			<div id="artistDetailTitleBox">
        		<textarea rows="30" cols="10" name="artist_board_title" id="artistDetailTitleModify"></textarea> 
        	</div>
        	<button type="submit" class="btn btn-default">수정완료</button>
		</form>
	</div>
</body>
</html>