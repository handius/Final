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
    <style>
        
        a:visited,
        a:active,
        a:link {
            color: black;
            text-decoration: none;
        }
        
        a:hover {
            text-decoration: none !important;
            color: dodgerblue;
        }
        
        body {
            background-color: #f1f1f1 !important;
        }
        
        ul {
            list-style: none;
            padding: 0;
        }
        
        .row {
            margin: 0;
        }
        
        .jumbotron {
            width: 100%;
            height: 400px;
            background-image: url("/resources/image/ArtistMain.jpg");
            background-size: cover;
            background-position: 0 70%;
            padding: 0;
            margin-bottom: 0 !important;
        }
        
        /*네비*/
        
        #artistListNaxBox {
            height: 50px;
            border-bottom: 1px solid silver;
            background-color: white;
        }
        
        #mobileArtistListNavBox {
            display: none;
        }
        
        .artistListNavTypeBlock {
            line-height: 50px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }
        
        #artistListNavSearchBox {
            padding: 5px 0;
            text-align: right;
        }
        
        .artistListNavSearchText {
            width: 50%;
            height: 40px;
            border: 0;
            border: 2px solid #ABD0CE;
        }
        
        .artistListNavSearchButton {
            width: 10%;
            height: 40px;
            border: 2px solid #ABD0CE;
            background-color: #ABD0CE;
            color: white;
            margin-left: -5px;
        }
        
        /*작가 리스트*/
        
        #artistListUl li {
            margin: 20px 0;
        }
        .artistListTitleImgBox, .artistListImgBox {
            height: 190px;
            padding: 0 !important;
        }
        
        .artistListTitleImgBox img, .artistListImgBox img {
            width: 100%;
            height: 190px;
            object-fit: cover;
        }
        
        .artistListDetailBox {
        	background-color: white;
            padding: 0;
        }
        
        .artistListTitleName {
            line-height: 40px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
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
        
        @media (max-width: 991px) {
            
            .artistListImgBox {
                display: none;
            }
            
            .artistListNavSearchText {
                width: 80%;
            }
            
            .artistListNavSearchButton {
                width: 20%;
            }
        }
        
        @media (max-width: 767px) {
            #mobileArtistListNavBox {
                display: contents;
            }
            
            #mobileArtistListNavBox .container {
                background-color: white;
                border-bottom: 1px solid silver;
            }
            
            .row {
            	background-color: white;
            }
            
            .dropdown {
                width: 100%;
            }
            
            .artistListNavSearchText {
                width: 80%;
            }
            
            .artistListNavSearchButton {
                width: 20%;
            }
            
            #artistListNaxBox {
                display: none;
            }
            
            .artistListTitleImgBox, .artistListTitleImgBox img {
                height: 100%;
            }
            
            #dropdownButton {
                width: 100%;
                height: 40px;
                background-color: white;
                border: 1px solid silver;
                margin: 5px 0;
            }
            
            .dropdown-menu {
                min-width: 0;
                width: 100%;
                text-align: center;
                padding: 0;
            }
            
            .drowdownList a {
                height: 40px;
                padding: 10px 0 !important;
                
            }
        }
    </style>
    <script>
    
    $(window).scroll(function() {
    	scrollArtistList();
    });
    
    $(document).ready(artistList);
    
    $(document).ready(function(){
    	$('.artistListNavTypeBlock').on('click',artistList);
    	$('.drowdownList').on('click', artistList);
    	$('.artistListNavSearchButton').on('click',search);
    });
    	
    
    let saveListType = '인기순';
    function artistList(searchText) {
    	let listType = $(this).children('a').text();
    	let currentArtistList = $('#currentArtistList').val();
    	//정렬값이 지정이 안되있다면
    	if(!listType) {
    		listType = '인기순';
    	}
    	else {
    		//이전 정렬값과 다르다면 초기화
    		if(listType != saveListType) {
    			console.log('정렬초기화 작동');
    			$('#artistListUl').empty();
    			$('#currentArtistList').val(0);
    			currentArtistList = 1;
    			saveListType = listType;
    		}
    		//검색값이 변경됨
    		else if(searchChangeTokken == 1) {
    			console.log('검색초기화 작동');
    			$('#artistListUl').empty();
    			$('#currentArtistList').val(0);
    			currentArtistList = 1;
    			searchChangeTokken = 0;
    		}
    		//이전 정렬값과 같으나 스크롤에서 호출한게 아니라면
    		else if(delayScrollTokken == 0) {
    			return;
    		}
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
    			for(let i=0; i<data.length; i++) {
    				let artistBoarddto = data[i].artistBoarddto;
    				let listNo = data[i].listNo;
    				let listImg = data[i].listImg;
    				result += '<li>';
    				result += 	'<div class="row">';
    				result += 		'<div class="col-md-2 col-sm-3 artistListTitleImgBox"><a href="/artistDetail/'+artistBoarddto.artist_no+'"><img src="'+artistBoarddto.artist_main_img+'" alt="타이틀 이미지"></a></div>';
    				result += 		'<div class="col-md-4 col-sm-9 artistListDetailBox">';
    				result += 			'<div class="col-xs-12 artistListTitleName"><a href="/artistDetail/'+artistBoarddto.artist_no+'">'+artistBoarddto.user_name+'</a></div>';
    				result += 			'<div class="col-xs-8 artistListStarScore">'+starScoreCel(artistBoarddto.artist_score)+'</div>';
    				result += 			'<div class="col-xs-4 artistListNumScore">'+artistBoarddto.artist_score+'</div>';
    				result += 			'<div class="col-xs-12 artistListDetailTitle">'+artistBoarddto.artist_board_title+'</div>';
    				result += 		'</div>';
    				for(let j=0; j<listNo.length; j++) {
    					if(j<3) {
    						result += '<div class="col-md-2 artistListImgBox"><a href="/productDetail/'+listNo[j]+'"><img src="'+listImg[j]+'" alt="제품 이미지"></a></div>'
    					}
    					else {
    						break;
    					}
    				}
    				result += 	'</div>';
    				result += '</li>';
    			}
    			$('#artistListUl').append(result);
    			$('#currentArtistList').val(Number(currentArtistList)+1);
    		}
    		,error:function(data) {
    			console.log('작가 리스트 실패');
    		}
    	});
    }
    
    let delayScrollTokken = 0;
    function scrollArtistList() {
    	let windowHeight = window.innerHeight;
    	let scrollWindowBottom = $(window).scrollTop() + $(window).height();
    	let endBlockTop = $('#footer').offset().top;
    	if(scrollWindowBottom > endBlockTop && delayScrollTokken == 0) {
    		delayScrollTokken = 1;
    		artistList();
    		
    		setTimeout(() => {
    			delayScrollTokken = 0;
			}, 500);
    	}
    }
    
    function starScoreCel(ScoreNum) {
    	let starScoreNum = ScoreNum;
    	let result = "";
    	let count = Math.round(starScoreNum);
    	
    	if(starScoreNum == 0) {
    		result = "0"
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
    
    let searchChangeTokken = 0;
    function SearchChangeTokken() {
    	console.log('체인지 작동됨!');
    	searchChangeTokken = 1;
	}
    
    function search() {
    	let searchText = $(this).prev().val();
    	$(this).prev().val("");
    	if(!searchText) {
    		alert("검색어를 입력하세요");
    	}
    	else {
    		artistList(searchText);
    	}
    }
    
    </script>
</head>
<body>
<input type="hidden" value="1" id="currentArtistList" readonly="readonly">
    <section>
        <div class="jumbotron"> 
        </div>
        <div id="artistListNaxBox">
           <div class="container">
                <div class="row">
                    <div class="col-sm-2 artistListNavTypeBlock"><a href="#">인기순</a></div>
                    <div class="col-sm-2 artistListNavTypeBlock"><a href="#">평점순</a></div>
                    <div class="col-sm-2 artistListNavTypeBlock"><a href="#">최신순</a></div>
                    <div class="col-sm-6" id="artistListNavSearchBox">
                        <input type="text" class="artistListNavSearchText" onchange=" SearchChangeTokken()">
                        <input type="button" class="artistListNavSearchButton" value="검색">
                    </div>
                </div>
           </div>
        </div>
        <div id="mobileArtistListNavBox">      
            <div class="container">
               <div class="row">
                   <div class="col-xs-4">
                        <div class="dropdown">
                            <button class="dropdown-toggle" id="dropdownButton" data-toggle="dropdown">
                                                               조회순<span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li role="presentation" class="drowdownList">
                                    <a href="#">조회순</a>
                                </li>
                                <li role="presentation" class="drowdownList">
                                    <a href="#">평점순</a>
                                </li>
                                <li role="presentation" class="drowdownList">
                                    <a href="#">최신순</a>
                                </li>
                            </ul>
                        </div>
                   </div>
                   <div class="col-xs-8">
                        <div id="artistListNavSearchBox">
                            <input type="text" class="artistListNavSearchText" onchange=" SearchChangeTokken()">
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