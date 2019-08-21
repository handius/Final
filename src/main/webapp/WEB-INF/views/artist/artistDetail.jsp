<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <style>
        a:visited,
        a:active,
        a:link {
            color: black;
        }
        
        .artistLeft {
            float: left;
        }
        
        .artistRight {
            float: right;
        }
        
        .artistDetailLine {
            font-size: 20px;
            font-weight: bold;
            border-bottom: 1px solid silver;
            margin-top: 40px;
            margin-bottom: 20px;
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
        
        /*작가 정보 시작*/
        
        #artistAsideArtistInfoBox {
            height: 300px;
            padding: 0;
            text-align: center;
            background-color: #a2a2a214;
        }
        
        #artistAsideArtistInfoArtistName {
            height: 50px;
            font-size: 25px;
            padding: 12.5px 0 12.5px 0;
        }
        
        #artistAsideArtistInfoScore {
            height: 50px;
            font-size: 30px;
        }
        
        #artistAsideArtistInfoStarScore {
            color: #FFA500;
        }
        
        #artistAsideArtistInfoNumScore {
            font-size: 25px;
            padding-left: 10px;
        }
        
        #artistAsideArtistInfoVisitCount {
            height: 90px;
            font-size: 15px;
            padding: 20px;
            border-top: 1px solid silver;
        }
        
        #artistAsideArtistInfoButton {
            padding: 0 20px;
        }
        
        /*댓글 시작*/
        
        #artistAsideRepBox {
            height: 700px;
            border-top: 1px solid silver;
            background-color: #a2a2a214;
            padding: 0;
        }
        
        #artistAsideRepTitle {
            line-height: 60px;
            font-size: 20px;
            text-align: center;
        }
        
        #artistAsideRepContentBox {
            height: 600px;
            padding: 0 20px;
        }
        
        #artistAsideRepContent {
            list-style: none;
            padding: 0;
        }
        
        .artistAsideRepContentUser {
            text-align: left;
            padding-right: 20%;
            margin-bottom: 10px;
        }
        
        .artistAsideRepContentArtist {
            text-align: right;
            padding-left: 20%;
            margin-bottom: 10px;
        }
        
        .artistAsideRepUserName {
            height: 15px;
            font-size: 12px;
            padding: 0 10px;
        }
        
        .artistAsideRepUserContent {
            min-height: 30px;
            border-radius: 10px;
            background-color: white;
            font-size: 14px;
            padding: 8px 10px;
            display: inline-block;
        }
        
        #artistAsideRepInputBox {
            height: 40px;
            padding: 0 10px 5px 10px;
        }
        
        #artistAsideRepInput {
            width: 78%;
            height: 35px;
            display: inline-block;
        }
        
        #artistAsideRepButton {
            width: 20%;
            height: 35px;
            margin-top: -1px;
        }
        
        /*작가 페이지 메인 시작*/
        #artistDetailBox {
            padding: 30px;
        }
        
        #artistDetailTitleBox {
            height: 200px;
            font-size: 20px;
        }
        
        #artistDetailProductCollectionBox {
            margin-top: 30px;
            overflow: hidden;
        }
        
        #artistDetailProductCollection {
            margin: 0;
        }

        #artistDetailProductCollectionBox img{
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        
        .artistDetailProductCollectionImgBox {
            padding: 0 !important;
        }
        
        #artistDetailProductCollectionButton, #artistDetailBuyReviewCollectionButton {
            width: 50%;
            margin: auto;
            margin-top: 20px;
        }
        
        #artistDetailBuyReviewCollectionBox {
            margin-top: 30px;
        }
        
        #artistDetailBuyReviewCollection {
            margin: 0;
            padding: 0;
        }
        
        .artistDetailBuyReview {
            height: 200PX;
            margin: 0;
            padding: 0 0 10px 0;
            border: 1px solid silver;
            background-color: #a2a2a214;
            margin-bottom: 10px;
        }
        
        .artistDetailBuyReviewImgBox {
            height: 200px;
            padding: 0 !important;
        }
        
        .artistDetailBuyReviewImgBox img {
            width: 100%;
            height: 200px;
        }
        
        .artistDetailBuyReviewProductTitle {
            line-height: 40px;
            font-size: 20px;
            font-weight: bold;
            text-align: center;
        }
        
        .artistDetailBuyReviewProductOption {
            line-height: 30px;
        }
        
        .artistDetailBuyReviewContent {
            height: 90px;
        }
        
        .artistDetailBuyReviewStarScore {
            line-height: 30px;
            font-size: 30px;
            text-align: right;
            color: #ffd600;
            border-right: 1px solid silver;
        }
        
        .artistDetailBuyReviewUserName {
            line-height: 30px;
            font-size: 20px;
        }
        
        @media (max-width: 1091px) {
            #artistDetailBox {
                padding: 30px 0;
                margin-bottom: 60px;
            }
            
            .artistDetailBuyReview {
            height: 100%;
        }
            
            .artistDetailBuyReviewImgBox {
            height: 100%;
            }
            
            .artistDetailBuyReviewImgBox img {
            height: 100%;
            }
        }
    </style>
    <script>
    
    $(document).ready(starScoreCel);
    $(document).ready(artistDetailBuyReviewList);
    $(document).ready(artistDetailProductList);
    
    $(document).ready(function(){
    	$('#artistDetailBuyReviewCollectionButton').on('click', artistDetailBuyReviewList);
    	$('#artistDetailProductCollectionButton').on('click', artistDetailProductList);
    });
    
    function starScoreCel() {
    	let starScoreNum = Number($('#artistAsideArtistInfoNumScore').text());
    	let result = "";
    	let count = Math.round(starScoreNum);
    	
    	if(starScoreNum == 0) {
    		result = "별점이 없습니다."
    	}
    	else {
    		for(let i=1; i<=count; i++) {
    			if( i == count && count > starScoreNum) {
    				result += "☆";
    			}
    			else {
    				result += "★";
    			}
    		}
    	}
    	
    	$('#artistAsideArtistInfoStarScore').append(result);
    }
    
    function artistDetailProductList() {
    	let artistNo = Number($('#artist_no').val());
    	let currentProduct = Number($('#currentProduct').val());
    	
    	$.ajax({
    		url: "/ajaxArtistBoardDetailProductList"
    		,contentType: "application/json; charset=utf-8"
    		,data: JSON.stringify({artist_no : artistNo, currentProductInput : currentProduct})
    		,type: "POST"
    		,dataType: "json"
    		,success: function(data) {
    			console.log('성공');
    			let result = "";
    			if(data.length == 0) {
    				if(currentProduct == 1) {
    					result += '<div class="col-md-3 col-sm-4 col-xs-6 artistDetailProductCollectionImgBox">';
    					result += '이미지가 없습니다.';
    					result += '</div>';
    				}
    				$('#artistDetailProductCollectionButton').hide();
    			}
    			else {
    				for(let i=0; i<data.length; i++) {
    					result += '<div class="col-md-3 col-sm-4 col-xs-6 artistDetailProductCollectionImgBox">';
    					result += '<a href="../productDetail/'+data[i].list_no+'"><img src="'+data[i].list_image_loc+'" alt="리스트 이미지"></a>';
    					result += '</div>';
    				}
    			}
    			
    			$('#artistDetailProductCollection').append(result);
    			$('#currentProduct').val(currentProduct+1);
    		}
    		,error: function(data) {
    			console.log('실패');
    		}
    	});
    }
    
    function artistDetailBuyReviewList() {
    	let artistNo = Number($('#artist_no').val());
    	let currentBuyReview = Number($('#currentBuyReview').val());
    	
    	$.ajax({
    		url: "/ajaxArtistDetailBuyReviewList"
    		,contentType: "application/json; charset=utf-8"
    		,data: JSON.stringify({artist_no : artistNo, currentBuyReviewInput : currentBuyReview})
    		,type: "POST"
    		,dataType: "json"
    		,success: function(data) {
    			console.log('성공');
    			let result = "";
    			if(data.length == 0) {
    				if(currentBuyReview == 1) {
    					result += '<div class="artistDetailBuyReview">';
        				result += '<div class="col-md-3 artistDetailBuyReviewImgBox"></div>';
        				result += '<div class="col-md-9 artistDetailBuyReviewProductTitle"></div>';
        				result += '<div class="col-md-9 artistDetailBuyReviewProductOption"></div>';
        				result += '<div class="col-md-9 artistDetailBuyReviewContent">구매후기가 없습니다.</div>';
        				result += '<div class="col-md-4 col-sm-6 col-xs-6 artistDetailBuyReviewStarScore"></div>';
        				result += '<div class="col-md-5 artistDetailBuyReviewUserName"></div>';
        				result += '</div>';
    				}
    				$('#artistDetailBuyReviewCollectionButton').hide();
    			}
    			else {
    				for(let i=0; i<data.length; i++) {
    					result += '<div class="artistDetailBuyReview">';
        				result += '<div class="col-md-3 artistDetailBuyReviewImgBox">';
        				if(data[i].buy_review_image_loc != null) {
							result += '<img src="'+data[i].buy_review_image_loc+'" alt="구매후기 이미지">';
						}
        				result += '</div>';
        				result += '<div class="col-md-9 artistDetailBuyReviewProductTitle"><a href="../productDetail/'+data[i].list_no+'">'+data[i].list_title+'</a></div>';
        				result += '<div class="col-md-9 artistDetailBuyReviewProductOption">'+data[i].order_add_option+'</div>';
        				result += '<div class="col-md-9 artistDetailBuyReviewContent">'+data[i].buy_review_content+'</div>';
        				result += '<div class="col-md-4 col-sm-6 col-xs-6 artistDetailBuyReviewStarScore">';
        				for(let j=1; j<=data[i].buy_review_score; j++) {
							result += '★';
						}
        				result += '</div>';
        				result += '<div class="col-md-5 artistDetailBuyReviewUserName">'+data[i].user_name+'</div>';
        				result += '</div>';
    				}
    			}
    			
    			$('#artistDetailBuyReviewCollection').append(result);
    			$('#currentBuyReview').val(currentBuyReview+1);
    		}
    		,error: function(data) {
    			console.log('실패');
    		}
    	});
    }
    </script>
</head>
<body>
<!-- 기본 활용 정보 -->
<input type="hidden" value="${artistBoardDetail.artist_no }" id="artist_no" readonly="readonly">
<input type="hidden" value="1" id="currentBuyReview" readonly="readonly">
<input type="hidden" value="1" id="currentProduct" readonly="readonly">
    <div class="container">
        <div class="row">
           <div class="col-md-9" id="artistDetailImgBox">
                <img src="${artistBoardDetail.artist_main_img }" alt="메인이미지">
           </div>
           <div class="col-md-3" id="artistAsideArtistInfoBox">
               <div id="artistAsideArtistInfoArtistName">
                   	<c:out value="${artistInfo.user_name }"></c:out>
               </div>
               <div id="artistAsideArtistInfoScore">
                    <span id="artistAsideArtistInfoStarScore"></span><span id="artistAsideArtistInfoNumScore">${artistBoardDetail.artist_score }</span>
               </div>
               <div id="artistAsideArtistInfoVisitCount">
                    <span class="artistLeft">총 방문자 수 : </span><span class="artistRight"><c:out value="${artistBoardDetail.artist_count }"></c:out></span>
               </div>
               <div id="artistAsideArtistInfoButton">
                    <button class="btn btn-warning btn-lg btn-block">공유하기</button>
                    <button class="btn btn-info btn-lg btn-block">후원하기</button>
               </div>
           </div>
        </div>
        <div class="row">
            <div class="col-md-9" id="artistDetailBox">
                <div id="artistDetailTitleBox">
                	작가 페이지 설명부분 
                </div>
                <div class="artistDetailLine">
                     	판매중인 작품
                </div>
                <div id="artistDetailProductCollectionBox">
                   <div class="row" id="artistDetailProductCollection"></div>
                   <button class="btn btn-default btn-lg btn-block" id="artistDetailProductCollectionButton">더보기</button>
                </div>
                <div class="artistDetailLine">
                     	구매후기
                </div>
                <div id="artistDetailBuyReviewCollectionBox">
                    <div id="artistDetailBuyReviewCollection"></div>
                    <button class="btn btn-default btn-lg btn-block" id="artistDetailBuyReviewCollectionButton">더보기</button>
                </div>
            </div>
            <div class="col-md-3" id="artistAsideRepBox">
                <div id="artistAsideRepTitle">작가에게 하고 싶은 말</div>
                <div id="artistAsideRepContentBox">
                     <ul id="artistAsideRepContent">
                         <li class="artistAsideRepContentUser">
                             <div class="artistAsideRepUserName">홍길동</div>
                             <div class="artistAsideRepUserContent">안녕하세요요요요요요요요요요요요요요요요요요요요요요요요</div>
                         </li>
                         <li class="artistAsideRepContentUser">
                             <div class="artistAsideRepUserName">홍길동</div>
                             <div class="artistAsideRepUserContent">안녕하세요!</div>
                         </li>
                         <li class="artistAsideRepContentUser">
                             <div class="artistAsideRepUserName">홍길동</div>
                             <div class="artistAsideRepUserContent">안녕하세요!</div>
                         </li>
                         <li class="artistAsideRepContentArtist">
                             <div class="artistAsideRepUserName">작가</div>
                             <div class="artistAsideRepUserContent">현재시각은 3시 56분 입니다. 벌써 시간이 이렇게...</div>
                         </li>
                         <li class="artistAsideRepContentUser">
                             <div class="artistAsideRepUserName">홍길동</div>
                             <div class="artistAsideRepUserContent">안녕하세요!</div>
                         </li>
                     </ul>
                </div>
                <div id="artistAsideRepInputBox">
                    <input type="text" class="form-control" id="artistAsideRepInput">
                    <button class="btn btn-default" id="artistAsideRepButton">전송</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>