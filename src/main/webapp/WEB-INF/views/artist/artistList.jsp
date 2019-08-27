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
        
        #artistListNavSearchText {
            width: 50%;
            height: 40px;
            border: 0;
            border: 2px solid #ABD0CE;
        }
        
        #artistListNavSearchButton {
            width: 10%;
            height: 40px;
            border: 2px solid #ABD0CE;
            background-color: #ABD0CE;
            color: white;
            margin-left: -5px;
        }
        
        /*작가 리스트*/
        
        #artistListUl li {
            border-top: 1px solid #3333;
            border-bottom: 1px solid #3333;
            background-color: white;
            margin: 20px 0;
        }
        .artistListTitleImgBox, .artistListImgBox {
            height: 190px;
            padding: 0;
        }
        
        .artistListTitleImgBox img, .artistListImgBox img {
            width: 100%;
            height: 190px;
            object-fit: cover;
        }
        
        .artistListDetailBox {
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
            
            #artistListNavSearchText {
                width: 80%;
            }
            
            #artistListNavSearchButton {
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
            
            .dropdown {
                width: 100%;
            }
            
            #artistListNavSearchText {
                width: 80%;
            }
            
            #artistListNavSearchButton {
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
    
    $(document).ready(artistList);
    
    $(document).ready(function(){
    	$('.artistListNavTypeBlock').on('click',artistList);
    	$('.drowdownList').on('click', artistList);
    });
    	
    
    function artistList() {
    	let listType = $(this).children('a').text();
    	let currentArtistList = $('#currentArtistList').val();
    	if(!listType) {
    		listType = '인기순';
    	}
    	
    	$.ajax({
    		url: "/ajaxArtistList"
    		,contentType: "application/json; charseet=utf-8"
    		,data: JSON.stringify({listType:listType, currentArtistList:currentArtistList})
    		,type: "POST"
    		,success: function(data) {
    			console.log('작가 리스트 성공');
    			console.log(data);
    			console.log(data.length);
    			let result = '';
    			for(let i=0; i<data.length; i++) {
    				result = '<li>';
    				result = '<div class="row">';
    				result = '<div class="col-md-2 col-sm-3 artistListTitleImgBox"><img src="./slide1.jpg" alt="artist_no"></div>';
    				result = '<div class="col-md-4 col-sm-9 artistListDetailBox">';
    				result = '<div class="col-xs-12 artistListTitleName"><a href="#">작가 이름</a></div>';
    				result = '<div class="col-xs-8 artistListStarScore">★★★★★</div>';
    				result = '<div class="col-xs-4 artistListNumScore">3.56</div>';
    				result = '<div class="col-xs-12 artistListDetailTitle">작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목 </div>';
    				result = '</div>';
    				result = '<div class="col-md-2 artistListImgBox"><img src="./slide1.jpg" alt="list_no"></div>';
    				result = '<div class="col-md-2 artistListImgBox"><img src="./slide1.jpg" alt="list_no"></div>';
    				result = '<div class="col-md-2 artistListImgBox"><img src="./slide1.jpg" alt="list_no"></div>';
    				result = '</div>';
    				result = '</li>';
    			}
    			$('.artistListUl').append(result);
    		}
    		,error:function(data) {
    			console.log('작가 리스트 실패');
    		}
    	})
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
                        <input type="text" id="artistListNavSearchText">
                        <input type="button" id="artistListNavSearchButton" value="검색">
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
                            <input type="text" id="artistListNavSearchText">
                            <input type="button" id="artistListNavSearchButton" value="검색">
                        </div>
                   </div>
               </div>
            </div>
        </div>
    </section>
    <section>
        <div class="container">
            <ul id="artistListUl">
                <!-- <li>
                    <div class="row">
                        <div class="col-md-2 col-sm-3 artistListTitleImgBox"><img src="./slide1.jpg" alt="artist_no"></div>
                        <div class="col-md-4 col-sm-9 artistListDetailBox">
                            <div class="col-xs-12 artistListTitleName"><a href="#">작가 이름</a></div>
                            <div class="col-xs-8 artistListStarScore">★★★★★</div>
                            <div class="col-xs-4 artistListNumScore">3.56</div>
                            <div class="col-xs-12 artistListDetailTitle">작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목 </div>
                        </div>
                        <div class="col-md-2 artistListImgBox"><img src="./slide1.jpg" alt="list_no"></div>
                        <div class="col-md-2 artistListImgBox"><img src="./slide1.jpg" alt="list_no"></div>
                        <div class="col-md-2 artistListImgBox"><img src="./slide1.jpg" alt="list_no"></div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-2 col-sm-3 artistListTitleImgBox"><img src="./slide1.jpg" alt="artist_no"></div>
                        <div class="col-md-4 col-sm-9 artistListDetailBox">
                            <div class="col-xs-12 artistListTitleName"><a href="#">작가 이름</a></div>
                            <div class="col-xs-8 artistListStarScore">★★★★★</div>
                            <div class="col-xs-4 artistListNumScore">3.56</div>
                            <div class="col-xs-12 artistListDetailTitle">작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목 </div>
                        </div>
                        <div class="col-md-2 artistListImgBox"><img src="./slide1.jpg" alt="list_no"></div>
                        <div class="col-md-2 artistListImgBox"><img src="./slide1.jpg" alt="list_no"></div>
                        <div class="col-md-2 artistListImgBox"><img src="./slide1.jpg" alt="list_no"></div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-2 col-sm-3 artistListTitleImgBox"><img src="./slide1.jpg" alt="artist_no"></div>
                        <div class="col-md-4 col-sm-9 artistListDetailBox">
                            <div class="col-xs-12 artistListTitleName"><a href="#">작가 이름</a></div>
                            <div class="col-xs-8 artistListStarScore">★★★★★</div>
                            <div class="col-xs-4 artistListNumScore">3.56</div>
                            <div class="col-xs-12 artistListDetailTitle">작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목 작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목작가페이지 타이틀 제목 </div>
                        </div>
                        <div class="col-md-2 artistListImgBox"><img src="./slide1.jpg" alt="list_no"></div>
                        <div class="col-md-2 artistListImgBox"><img src="./slide1.jpg" alt="list_no"></div>
                        <div class="col-md-2 artistListImgBox"><img src="./slide1.jpg" alt="list_no"></div>
                    </div>
                </li> -->
            </ul>
        </div>
    </section>
</body>
</html>