<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
    <style>
    	* {
    		font-family: 'Comfortaa', '맑은 고딕', cursive;
    	}
        
        a:visited,
        a:active,
        a:link {
            color: black;
            text-decoration: none !important;
        }
        
        a:hover {
            text-decoration: none !important;
            color: dodgerblue;
        }
        
        ul {
            list-style: none;
            padding: 0 !important;
        }
        
        .row {
            margin: 0 !important;
        }
        
        .jumbotron {
            width: 100%;
            height: 400px;
            background-image: url("/resources/image/ArtistMain.jpg");
            background-size: cover;
            background-position: 0 70%;
            margin-bottom: 0 !important;
        }
        
        #jumbotronTextBox {
        	max-width: 1170px;
        	line-height: 300px;
        	color: white;
            font-size: 3vw;
            font-weight: bold;
            text-shadow: 0 0 5px black;
            text-align: center;
            margin: auto;
        }
        
        /*네비*/
        
        #artistListNaxBox {
            height: 50px;
            border-bottom: 1px solid silver;
            background-color: #d9d4cf;
        }
        
        #mobileArtistListNavBox {
            display: none;
        }
        
        #mobileArtistListNavBoxBackground {
        	background-color: #d9d4cf;
        }
        
        .artistListNavTypeBlock {
            line-height: 50px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }
        
        .artistListNavTypeBlock a {
        	color: rgba(93,93,93);
        }
        
        #artistListNavSearchBox {
            padding: 5px 0;
            text-align: right;
        }
        
        .artistListNavSearchText {
            width: 50%;
            height: 40px;
            border: 0;
            border: 2px solid #7C7877;
            padding-left: 10px;
        }
        
        .artistListNavSearchButton {
            width: 10%;
            height: 40px;
            border: 2px solid #7C7877;
            background-color: #7C7877;
            color: white;
            position: relative;
            bottom: 1px;
            margin-left: -5px;
        }
        
        /*작가 리스트*/
        
        artistListUl {
        	text-align: center;
        }
        
        #artistListUl li {
        	width: 31%;
        	border: 1px solid silver;
        	display: none;
        	margin: 20px 10px 0 10px;
        }
        .artistListTitleImgBox {
            height: 190px;
            padding: 0 !important;
        }
        
        .artistListTitleImgBox img {
            width: 100%;
            height: 190px;
            object-fit: cover;
            border-bottom: 1px solid silver;
        }
        
        .artistListLank {
        	width: 50px;
        	line-height: 50px;
        	color: white;
        	text-align: center;
        	font-size:  20px;
        	background-color: #ABD0CE;
        	position: absolute;
        }
        
        .artistListDetailBox {
        	background-color: white;
            padding: 0;
        }
        
        .artistListTitleName {
            height: 40px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            padding-top: 15px;
        }
        
        .artistListStarScore {
            line-height: 30px;
            font-size: 30px;
            text-align: right;
            color: #FFBE0A;
            padding: 0 15px;
        }
        
        .artistListNumScore {
            line-height: 25px;
            font-size: 20px;
            text-align: left;
            padding: 5px 15px 0 15px;
        }
        
        .artistListDetailTitle {
            height: 120px;
            padding: 10px 15px;
            font-size: 16px;
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: normal;
        }

       @media (max-width: 1199px) {
            
            .artistListNavSearchText {
                width: 80%;
            }
            
            .artistListNavSearchButton {
                width: 20%;
            }
            
            #artistListUl li {
            	width: 47%;
            }
        }
        
        @media (max-width: 991px) {
        	.container {
        		padding: 0 !important;
        		width: 100% !important;
        	}
        	
        	#jumbotronTextBox {
				font-size: 5vw;        	
        	}
        	
            #mobileArtistListNavBox {
                display: contents;
            }
            
            #mobileArtistListNavBox .container {
                border-bottom: 1px solid silver;
            }
            
            #mobileArtistListNavBoxBackground {
            	height: 
            }
            
            .dropdown {
                width: 100%;
            }
            
            .drowdownList {
            	background-color: #d9d4cf;
            }
            
            .artistListNavSearchText {
                width: 80%;
                height: 90px;
                font-size: 40px;
            }
            
            .artistListNavSearchButton {
                width: 20%;
                height: 90px;
                font-size: 40px;
            }
            
            #artistListNaxBox {
                display: none;
            }
            
            .artistListTitleImgBox, .artistListTitleImgBox img {
                height: 100%;
            }
            
            #dropdownButton {
                width: 100%;
                height: 90px;
                color: white;
                background-color: #7C7877;
                border: 1px solid silver;
                margin: 5px 0;
            }
            
            #dropdownButton span {
            	border-top: 15px solid;
            	border-right: 15px solid transparent;
            	border-left: 15px solid transparent;
            }
            
            #dropdownResultBox {
            	font-size: 30px;
            }
            
            .dropdown-menu {
                min-width: 0;
                width: 100%;
                text-align: center;
                padding: 0;
            }
            
            .drowdownList a {
                height: 80px;
                font-size: 30px;
                padding: 20px 0 !important;
                
            }
            
            #artistListUl li {
            	width: 100%;
            	margin: 0;
            	margin-top: 40px;
            }
            
            .artistListLank {
            	width: 100px;
            	height: 100px;
            	line-height: 100px;
            	font-size: 40px;
            }
            
            .artistListTitleName {
            	height: 80px;
            	font-size: 40px;
            }
            
            .artistListStarScore {
            	line-height: 60px;
            	font-size: 60px;
            }
            
            .artistListNumScore {
            	line-height: 60px;
            	font-size: 40px;
            }
            
            .artistListDetailTitle {
            	height: 240px;
            	font-size: 32px;
            }
        }
    </style>
    <script>
    
    window.onresize = function(event) {
    	let innerWidth =  window.innerWidth;
    	if(innerWidth < 991) {
    		let text = $('.artistListNavSearchText:eq(1)').val();
    		$('.artistListNavSearchText:eq(0)').val(text);
    	}
    	else {
    		let text = $('.artistListNavSearchText:eq(0)').val();
    		$('.artistListNavSearchText:eq(1)').val(text);
    	}
    };
    
    $(window).scroll(function() {
    	scrollArtistList();
    });
    
    $(document).ready(function(){
    	artistList("인기순","");
    	listTypeColorInit();
    	$('.artistListNavTypeBlock').on('click',listTypeReplace);
    	$('.drowdownList').on('click', listTypeReplace);
    	$('.artistListNavSearchButton').on('click',search);
    });
    
    function listTypeColorInit() {    	
    	$('[href="#1"]').parent().css('background-color','#7C7877');
    	$('[href="#1"]').css('color','white');
    }

    //정렬선택에 의한 재정렬
    let DelaylistTypeTokken = 0;
    let listTypeSave = "인기순"; //선택 저장값
    function listTypeReplace() {
    	let listType = $(this).children('a').text();
    	$('.artistListNavTypeBlock').css('background-color','#d9d4cf');
    	$('.drowdownList').css('background-color','#d9d4cf');
    	$('.artistListNavTypeBlock').children('a').css('color','rgba(93,93,93)');
    	$('.drowdownList').children('a').css('color','rgba(93,93,93)');
    	
    	let selectValue = $(this).children('a').attr('href');
    	$('[href="'+selectValue+'"]').parent().css('background-color','#7C7877');
    	$('[href="'+selectValue+'"]').css('color','white');
    	$('#dropdownResultBox').text(listType);
    	
    	//선택한 값이 이전값과 같다면 함수작동을 멈춤
    	if(listType == listTypeSave) {
    		return;
    	}
    	
    	//선택한 값이 이전과 다르다면
    	else {
    		console.log('정렬초기화 작동');
    		$('#artistListUl').empty();
    		$('#currentArtistList').val(1);
    		listTypeSave = listType;
    		artistListLank = 1; //랭크 초기화
    	}
    	
    	if(DelaylistTypeTokken == 0) {
    		DelaylistTypeTokken = 1;
    		delayScrollTokken = 1; //스크롤 잠금
    		artistList(listType, searchTextSave);
    		
    		setTimeout(function() {
    			DelaylistTypeTokken = 0;
    			delayScrollTokken = 0; //스크롤 잠금 해제
			}, 500);
    	}
    }
    
    function enterkeyPress() {	
    	if(event.keyCode == 13) {
    		search();
    	}
	}
    
    //검색에 의한 재정렬
    DelaysearchTextTokken = 0; //토큰값
    let searchTextSave = ""; //검색 저장값
    function search() {
    	let searchText = $('.artistListNavSearchText:eq(0)').val();
    	if(!searchText) {
    		alert("검색어를 입력하세요");
    	}
    	else {
    		console.log('검색초기화 작동');
    		$('#artistListUl').empty();
    		$('#currentArtistList').val(1);
    		searchTextSave = searchText;
    		artistListLank = 1; //랭크 초기화
    		delayScrollTokken = 1; //스크롤 잠금
    		
    		if(DelaysearchTextTokken == 0) {
    			DelaysearchTextTokken = 1;
    			artistList(listTypeSave , searchText);
    			
    			setTimeout(function() {
    				DelaysearchTextTokken = 0;
    				delayScrollTokken = 0; //스크롤 잠금 해제
    			}, 500);
    		}
    	}
    }
    
    let delayScrollTokken = 0;
    function scrollArtistList() {
    	let windowHeight = window.innerHeight;
    	let scrollWindowBottom = $(window).scrollTop() + $(window).height();
    	let endBlockTop = 0;
        if($('#footer').length == 1) {
        	endBlockTop = $('#footer').offset().top;
        }
        else {
        	endBlockTop = $('#mobileFooter').offset().top;
        }
    	if(scrollWindowBottom > endBlockTop && delayScrollTokken == 0) {
    		delayScrollTokken = 1;
    		artistList(listTypeSave, searchTextSave);
    		
    		setTimeout(function() {
    			delayScrollTokken = 0;
			}, 250);
    	}
    }
    
    let artistListLank = 1;
    function artistList(inputListType, inputSearchText) {
    	
    	let currentArtistList = $('#currentArtistList').val();
    	//만약 현재페이지 값이 없다면 1로 초기화함
    	if(!currentArtistList) {
    		currentArtistList = 1;
    	}
    	
    	let listType = "인가순";
    	//만약 정렬값이 있다면 정렬값 변경
    	if(inputListType) {
    		console.log("정렬값 변경");
    		listType = inputListType;
    	}
    	
    	//만약 검색값이 있다면 검색값으로 변경
    	let searchText = "";
    	if(inputSearchText) {
    		console.log("검색값 변경")
    		searchText = inputSearchText;
    	}
    	
    	$.ajax({
    		url: "/ajaxArtistList"
    		,contentType: "application/json; charseet=utf-8"
    		,data: JSON.stringify({listType:listType, currentArtistList:currentArtistList, searchText:searchText})
    		,type: "POST"
    		,dataType: "json"
    		,success: function(data) {
    			console.log('작가 리스트 성공');
    			let result = "";
    			if(data.length == 0) {
    				if($('.artistListTitleImgBox').length == 0 && $('#artistListUl>#jumbotronTextBox').length == 0) {
    					console.log($('.artistListTitleImgBox').length);
    					result += 	'<div id="jumbotronTextBox">';
    					result += 		'결과값이 없습니다';
    					result += 	'</div>';
    					$('#artistListUl').append(result);
    				}
    			}
    			else {
    				for(let i=0; i<data.length; i++) {
    					let artistBoarddto = data[i].artistBoarddto;
    					let listNo = data[i].listNo;
    					let listImg = data[i].listImg;
    					result += '<li>';
    					result += 	 '<div class="artistListTitleImgBox">';
    					result += 		'<div class="artistListLank">'+artistListLank+'</div>';
    					result += 		'<a href="/artistDetail/'+artistBoarddto.artist_no+'">';
    					result += 			'<img src="'+artistBoarddto.artist_main_img+'" alt="타이틀 이미지">';
    					result += 		'</a>';
    					result +=	 '</div>';
    					result += 	 '<div class="row artistListDetailBox"';
    					if(artistBoarddto.artist_board_status == 1) {
    						result += '>';
    					}
    					else {
    						result += 'style="background-color:#D9D4CF">';
    					}
    					result += 		'<div class="col-xs-12 artistListTitleName"><a href="/artistDetail/'+artistBoarddto.artist_no+'">'+artistBoarddto.user_name+'</a></div>';
    					result += 		'<div class="col-xs-8 artistListStarScore">'+starScoreCel(artistBoarddto.artist_score)+'</div>';
    					result += 		'<div class="col-xs-4 artistListNumScore">'+artistBoarddto.artist_score+'</div>';
    					result += 		'<div class="col-xs-12 artistListDetailTitle">'+artistBoarddto.artist_board_title+'</div>';
    					result += 	 '</div>';
    					result += '</li>';
    					artistListLank++; // 랭크증가
    				}
    				$('#artistListUl').append(result);
    				$('#currentArtistList').val(Number(currentArtistList)+1);
    			
    				for(let i=0; i<artistListLank; i++) {
    					setTimeout(function() {
    						$('#artistListUl>li:eq('+i+')').fadeIn();
    						$('#artistListUl>li:eq('+i+')').css('display', 'inline-block');
    					}, 100*i);
    				}
    			}
    		}
    		,error:function(data) {
    			console.log('작가 리스트 실패');
    		}
    	});
    }
    
    function starScoreCel(ScoreNum) {
    	let starScoreNum = ScoreNum;
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
    	return result;
    }
    </script>
</head>
<body>
<input type="hidden" value="1" id="currentArtistList" readonly="readonly">
    <section>
        <div class="jumbotron">
        	<div id="jumbotronTextBox">
        		찾고 싶은 작가님들을 검색해 보세요!
        	</div>
        </div>
        <div id="artistListNaxBox">
           <div class="container">
                <div class="row">
                    <div class="col-sm-2 artistListNavTypeBlock"><a href="#1">인기순</a></div>
                    <div class="col-sm-2 artistListNavTypeBlock"><a href="#2">평점순</a></div>
                    <div class="col-sm-2 artistListNavTypeBlock"><a href="#3">최신순</a></div>
                    <div class="col-sm-6" id="artistListNavSearchBox">
                        <input type="text" class="artistListNavSearchText" onkeydown="enterkeyPress()">
                        <input type="button" class="artistListNavSearchButton" value="검색">
                    </div>
                </div>
           </div>
        </div>
        <div id="mobileArtistListNavBox">      
            <div class="container">
               <div class="row" id="mobileArtistListNavBoxBackground">
                   <div class="col-xs-4">
                        <div class="dropdown">
                            <button class="dropdown-toggle" id="dropdownButton" data-toggle="dropdown">
                                                               <div id="dropdownResultBox">인기순</div><span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li role="presentation" class="drowdownList">
                                    <a href="#1">인기순</a>
                                </li>
                                <li role="presentation" class="drowdownList">
                                    <a href="#2">평점순</a>
                                </li>
                                <li role="presentation" class="drowdownList">
                                    <a href="#3">최신순</a>
                                </li>
                            </ul>
                        </div>
                   </div>
                   <div class="col-xs-8">
                        <div id="artistListNavSearchBox">
                            <input type="text" class="artistListNavSearchText" onkeydown="enterkeyPress()">
                            <input type="button" class="artistListNavSearchButton" value="검색">
                        </div>
                   </div>
               </div>
            </div>
        </div>
    </section>
    <section>
        <div class="container">
            <ul id="artistListUl">
            </ul>
        </div>
    </section>
</body>
</html>