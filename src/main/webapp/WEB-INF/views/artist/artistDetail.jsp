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
    
    <!-- 클립 보드 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js"></script>
    <style>
        a:visited,
        a:active,
        a:link {
            color: black;
        }
        
        .container {
        	width: 100%;
        }
        
        .artistDetailLine {
            font-size: 20px;
            font-weight: bold;
            border-bottom: 4px solid #7C7877;
            padding-left: 10px;
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
            text-align: left;
            font-size: 15px;
            padding: 5px;
            margin: 0 20px;
        }
        
        #artistAsideArtistInfoButton {
            padding: 0 20px;
        }
        
        #artistDetailUrlCoppy, #artistDetailDonation {
        	width: 100%;
        	height: 45px;
        	border: 0;   	
        	font-size: 20px;
        	margin-bottom: 10px;
        }
        
        #artistDetailUrlCoppy {
        	color: white;
        	background-color: #ABD0CE;
        }
        
		#artistDetailDonation {
			color: white;
        	background-color: #7C7877;
		}
        
        /*댓글 시작*/
        
        #artistAsideRepBox {
            height: 700px;
            background-color: #a2a2a214;
            padding: 0;
        }
        
        #artistAsideRepTitle {
            height: 50px;
            border-bottom: 2px solid #7C7877;
            font-size: 20px;
            text-align: center;
            padding-top: 20px;
            margin: 0 20px 10px 20px;
        }
        
        #artistAsideRepContentBox {
            height: 600px;
            padding: 0 20px;
            overflow: auto;
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
        
        #artistAsideRepInputInnerRow {
        	padding: 0 5px;
        }
        
        .artistAsideRepInputInnerBox {
        	padding: 0 !important;
        }
        
        #artistAsideRepInput {
        	width: 100%;
        	height: 35px;
        	line-height: 35px;
        	border: 1px solid #7C7877;
        	padding-left: 10px;
        }
        
        #artistAsideRepButton {
            width: 100%;
            height: 35px;
            border: 0;
            color: white;
            background-color: #7C7877;
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
        
        #artistDetailModifyPage {
        	width: 80%;
        	display: none;
        	margin-top: 20px;
        }
        
        /* 모달창 */
        #myModalLabel {
            text-align: center;
            font-size: 25px;
        }
        
        #donationList {
            list-style: none;
            padding: 0 20px;
        }
        
        #donationList li {
            margin-top: 15px;
            margin-bottom: 15px;
        }
        
        #donationList li label {
            font-size: 20px;
            padding-left: 10px;
        }
        
        #donationList li input {
            margin-left: 10px;
        }
        
        .donationIcon {
            font-size: 20px;
        }
        
        .donationPrice {
            float: right;
            font-size: 20px;
        }
        
        .modal-dialog {
            max-width: 400px;
        }
        
        .donationButton {
            width: 49%;
            height: 45px;
            display: inline-block;
            border: 0;
            color: white;
            font-size: 20px;
            background-color: #7C7877;
        }
        
        .donationButton:last-child {
        	border: 2px solid #7C7877;
        	color: #7C7877;
			background-color: white;
		}
        
        @media (max-width: 1091px) {
        	.container {
        		width: 100% !important;
        		margin: 0 !important;
        	}
        	
            #artistDetailBox {
                padding: 30px 0;
                margin-bottom: 60px;
            }
            
            .artistDetailBuyReview {
            	min-height:200px;
            	height: 100%;
        	}
            
            .artistDetailBuyReviewImgBox {
            	min-height: 200px;
            	height: 100%;
            }
            
            .artistDetailBuyReviewImgBox img {
            	min-height: 200px;
            	height: 100%;
            }
        }
        
    </style>
    <script>
    
    $(document).ready(starScoreCel);
    $(document).ready(artistDetailBuyReviewList);
    $(document).ready(artistDetailProductList);
    $(document).ready(artistDetailRepList);
    $(document).ready(function(){
    	let currentHeight = $("#artistAsideRepContentBox")[0].scrollHeight;
    	$('#artistAsideRepContentBox').animate({scrollTop : currentHeight}, 400);
    });
    
    $(document).ready(function(){
    	let master = $("#master").val();
    	
    	// 해당 작가페이지의 주인이라면 수정버튼을 보여주고 이름을 숨김
    	if(master == 'true') {
    		$('#artistDetailModifyPage').show();
    		$('#artistAsideArtistInfoArtistName').hide();
    	}
    });
    
    $(document).ready(function(){
    	$('#artistDetailBuyReviewCollectionButton').on('click', artistDetailBuyReviewList);
    	$('#artistDetailProductCollectionButton').on('click', artistDetailProductList);
    	$('#artistAsideRepButton').on('click', artistDetailRepInsert);
    	$('#artistDetailUrlCoppy').on('click', artistDetailUrlCoppy);
    	$('#artistDetailModifyPage').on('click', artistDetailModifyPage);
    });
    
    function starScoreCel() {
    	let starScoreNum = Number($('#artistAsideArtistInfoNumScore').text());
    	let result = "";
    	let count = Math.round(starScoreNum);
    	
    	if(starScoreNum == 0) {
    		result = "-"
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
    			let artistProductList = data.artistProductList;
    			let max_sql = data.max_sql;
    			let end_sql = data.end_sql;
    			if(data.length == 0) {
    				if(currentProduct == 1) {
    					result += '<div class="col-md-3 col-sm-4 col-xs-6 artistDetailProductCollectionImgBox">';
    					result += '이미지가 없습니다.';
    					result += '</div>';
    				}
    				$('#artistDetailProductCollectionButton').hide();
    			}
    			else {
    				for(let i=0; i<artistProductList.length; i++) {
    					result += '<div class="col-md-3 col-sm-4 col-xs-6 artistDetailProductCollectionImgBox">';
    					result += '<a href="../productDetail/'+artistProductList[i].list_no+'"><img src="'+artistProductList[i].list_image_loc+'" alt="리스트 이미지"></a>';
    					result += '</div>';
    				}
    				if(end_sql >= max_sql) {
    					$('#artistDetailProductCollectionButton').hide();
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
    	let artistNo = $('#artist_no').val();
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
    			let list = data.list;
    			let max_sql = data.max_sql;
    			let end_sql = data.end_sql;
    			if(list.length == 0) {
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
    				for(let i=0; i<list.length; i++) {
    					result += '<div class="artistDetailBuyReview">';
        				result += '<div class="col-md-3 artistDetailBuyReviewImgBox">';
        				if(list[i].buy_review_image_loc != null) {
							result += '<img src="'+list[i].buy_review_image_loc+'" alt="구매후기 이미지">';
						}
        				result += '</div>';
        				result += '<div class="col-md-9 artistDetailBuyReviewProductTitle"><a href="../productDetail/'+list[i].list_no+'">'+list[i].list_title+'</a></div>';
        				result += '<div class="col-md-9 artistDetailBuyReviewProductOption">'+list[i].order_add_option+'</div>';
        				result += '<div class="col-md-9 artistDetailBuyReviewContent">'+list[i].buy_review_content+'</div>';
        				result += '<div class="col-md-4 col-sm-6 col-xs-6 artistDetailBuyReviewStarScore">';
        				for(let j=1; j<=list[i].buy_review_score; j++) {
							result += '★';
						}
        				result += '</div>';
        				result += '<div class="col-md-5 artistDetailBuyReviewUserName">'+list[i].user_name+'</div>';
        				result += '</div>';
    				}
    				if(end_sql >= max_sql) {
    					$('#artistDetailBuyReviewCollectionButton').hide();
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
    
    function artistDetailRepInsert() {
    	let artistNo = $('#artist_no').val();
    	let artistRepContent = $('#artistAsideRepInput').val();
    	
    	if(artistRepContent != null && artistRepContent != "") {
    		$.ajax({
    			url: "/ajaxArtistDetailRepInsert"
        		,contentType: "application/json; charset=utf-8"
        		,data: JSON.stringify({artist_no : artistNo, artist_rep_content : artistRepContent})
        		,type: "POST"
        		,dataType: "text"
        		,success: function(data) {
        			console.log('성공');
        			alert(data);
        			$('#artistAsideRepInput').val("");
        			$('#currentRep').val(1);
        			$('#artistAsideRepContent').empty();
        			artistDetailRepList();
        			if(data == '로그인부터 해주시기바랍니다.') {
        				console.log('hi');
        				location.href = 'http://localhost:8080/login';
        			}
        		}
        		,error: function(data) {
        			console.log('실패')
        		}
    		});
    	}
    }
    
    function artistDetailRepList() {
    	let artistNo = $('#artist_no').val();
    	let currentRep = Number($('#currentRep').val());
    	let artistName = $('#artistAsideArtistInfoArtistName').text().trim();
    	
    	$.ajax({
    		url: "/ajaxArtistBoardDetailRepList"
        	,contentType: "application/json; charset=utf-8"
        	,data: JSON.stringify({artist_no : artistNo, currentRepInput : currentRep})
        	,type: "POST"
        	,dataType: "json"
        	,success: function(data) {
        		console.log('성공');
        		let result = "";
        		let replist = data.replist;
        		let end_sql = data.end_sql;
        		let max_sql = data.max_sql;
        		if(replist.length != 0) {
        			for(let i=replist.length-1; i>=0; i--) {
        				if(replist[i].user_name == artistName) {
        					result += '<li class="artistAsideRepContentArtist">';
                			result += '<div class="artistAsideRepUserName">'+replist[i].user_name+'</div>';
                			result += '<div class="artistAsideRepUserContent">'+replist[i].artist_rep_content+'</div>';
                			result += '</li>';
        				}
        				else {
        					result += '<li class="artistAsideRepContentUser">';
                			result += '<div class="artistAsideRepUserName">'+replist[i].user_name+'</div>';
                			result += '<div class="artistAsideRepUserContent">'+replist[i].artist_rep_content+'</div>';
                			result += '</li>';
        				}
        			}
        			if(end_sql == max_sql) {
        				repScrollPrevent = false;
        			}
        			$('#artistAsideRepContent').prepend(result);
        			$('#currentRep').val(currentRep+1);
        		}
        		else {
        			repScrollPrevent = false;
        		}
        	}
        	,error: function(data) {
        		console.log('실패')
        	}
    	});
    }
    
	let repScrollPrevent = true;
    function repScroll(){
        var divBox = $("#artistAsideRepContentBox");
        
        if(divBox.scrollTop() == 0 && repScrollPrevent == true) {     	
        	artistDetailRepList();
        	let result = '<input type="hidden" id="tmpBox">'
        	$('#artistAsideRepContent').prepend(result);
        	let offset = $('#artistAsideRepContent').offset();
        	$('#artistAsideRepContentBox').animate({scrollTop : offset.top}, 400);
        	$('#tmpBox').remove();
        }
	}
    
    function artistDetailUrlCoppy() {
    	$('body').append('<input type="text" value="" id="urlcoppy" class="" readonly="readonly">');
    	var urlcoppy = document.getElementById("urlcoppy");
    	urlcoppy.value = window.document.location.href;  
    	urlcoppy.select();  
    	document.execCommand("copy");
    	urlcoppy.blur();
    	$('#urlcoppy').remove();
    	alert("URL이 클립보드에 복사되었습니다"); 
    }
    
    function artistDetailModifyPage() {
    	let artist_no = $('#artist_no').val();
		location.href = "/artistDetail/artistDetailModify/"+artist_no;
	}

    </script>
</head>
<body>
<!-- 기본 활용 정보 -->
<input type="hidden" value="${artistBoardDetail.artist_no }" id="artist_no" readonly="readonly">
<input type="hidden" value="${master }" id="master" readonly="readonly">
<input type="hidden" value="1" id="currentBuyReview" readonly="readonly">
<input type="hidden" value="1" id="currentProduct" readonly="readonly">
<input type="hidden" value="1" id="currentRep" readonly="readonly">
    <div class="container">
        <div class="row">
           <div class="col-md-9" id="artistDetailImgBox">
                <img src="${artistBoardDetail.artist_main_img }" alt="메인이미지" id="artistDetailTitleImg">
           </div>
           <div class="col-md-3" id="artistAsideArtistInfoBox">
           	   <button class="btn btn-default" id="artistDetailModifyPage">작가페이지 관리</button>
               <div id="artistAsideArtistInfoArtistName">
                   	<c:out value="${artistInfo.user_name }"></c:out>
               </div>
               <div id="artistAsideArtistInfoScore">
                    <span id="artistAsideArtistInfoStarScore"></span><span id="artistAsideArtistInfoNumScore">${artistBoardDetail.artist_score }</span>
               </div>
               <div class="row" id="artistAsideArtistInfoVisitCount">
               		<div class="col-xs-9">총 조회수 : </div><div class="col-xs-3">${artistBoardDetail.artist_count }</div>
               		<div class="col-xs-9">총 댓글수 : </div><div class="col-xs-3">${artistRepMaxCount }</div>
               </div>
               <div id="artistAsideArtistInfoButton">
                    <button id="artistDetailUrlCoppy">공유하기</button>
                    <button id="artistDetailDonation" data-toggle="modal" data-target="#myModal">후원하기</button>
               </div>
           </div>
        </div>
        <div class="row">
            <div class="col-md-9" id="artistDetailBox">
                <div id="artistDetailTitleBox">
                	${artistBoardDetail.artist_board_title }
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
                <div id="artistAsideRepContentBox" onscroll="repScroll()">
                	<ul id="artistAsideRepContent"></ul>
                </div>
                <div id="artistAsideRepInputBox">
                	<div class="row" id="artistAsideRepInputInnerRow">
                		<div class="col-xs-10 artistAsideRepInputInnerBox">
                			<input type="text" id="artistAsideRepInput" maxlength="30" required="required">
                		</div>
                		<div class="col-xs-2 artistAsideRepInputInnerBox" >
                			<button id="artistAsideRepButton">전송</button>
                		</div>
                	</div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
    			<div class="modal-content">
      				<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        				<h4 class="modal-title" id="myModalLabel">후원하기</h4>
      				</div>
      				<div class="modal-body">
          				<form method="post" action="list.do">
             				<ul id="donationList">
                				<li>
                    				<span class="glyphicon glyphicon-cutlery donationIcon"></span>
                     				<label for="dinner">식사</label>
                     				<input type="radio" name="donation" value="6000" id="dinner">
                     				<span class="donationPrice">6000원</span>
                 				</li>
                 				<li>
                     				<span class="glyphicon glyphicon-film donationIcon"></span>
                     				<label for="cake">영화</label>
                     				<input type="radio" name="donation" value="12000">
                     				<span class="donationPrice">12000원</span>
                 				</li>
                  				<li>
                     				<span class="glyphicon glyphicon-glass donationIcon"></span>
                     				<label for="coffee">와인</label>
                     				<input type="radio" name="donation" value="20000" id="coffee">
                     				<span class="donationPrice">20000원</span>
                 				</li>
             				</ul>
             				<input type="submit" value="후원" class="donationButton">
             				<input type="reset" value="닫기" class="donationButton" data-dismiss="modal">
          				</form>
      				</div>
      				<div class="modal-footer">
      				</div>
    			</div> <!-- 모달 콘텐츠 -->
  			</div> <!-- 모달 다이얼로그 -->
		</div> <!-- 모달 전체 윈도우 -->
    </div>
</body>
</html>