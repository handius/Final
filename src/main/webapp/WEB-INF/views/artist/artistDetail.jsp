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
            padding: 0;
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
            padding: 0;
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
    
    </script>
</head>
<body>
    <div class="container">
        <div class="row">
           <div class="col-md-9" id="artistDetailImgBox">
                <img src="https://upload.wikimedia.org/wikipedia/commons/1/15/Handmade_Gold_Necklace.jpg" alt="메인이미지">
           </div>
           <div class="col-md-3" id="artistAsideArtistInfoBox">
               <div id="artistAsideArtistInfoArtistName">
                   	작가이름
               </div>
               <div id="artistAsideArtistInfoScore">
                    <span id="artistAsideArtistInfoStarScore">★★★★☆</span><span id="artistAsideArtistInfoNumScore">4.5</span>
               </div>
               <div id="artistAsideArtistInfoVisitCount">
                    <span class="artistLeft">오늘 방문자 수 : </span><span class="artistRight">3</span><br>
                    <span class="artistLeft">총 방문자 수 : </span><span class="artistRight">45</span>
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
                   <div class="row" id="artistDetailProductCollection">
                        <div class="col-md-3 col-sm-4 col-xs-6 artistDetailProductCollectionImgBox">
                            <img src="./slide1.jpg" alt="리스트 번호">
                        </div>
                        <div class="col-md-3 col-sm-4 col-xs-6 artistDetailProductCollectionImgBox">
                            <img src="./slide1.jpg" alt="리스트 번호">
                        </div>
                        <div class="col-md-3 col-sm-4 col-xs-6 artistDetailProductCollectionImgBox">
                            <img src="./slide1.jpg" alt="리스트 번호">
                        </div>
                        <div class="col-md-3 col-sm-4 col-xs-6 artistDetailProductCollectionImgBox">
                            <img src="./slide1.jpg" alt="리스트 번호">
                        </div>
                        <div class="col-md-3 col-sm-4 col-xs-6 artistDetailProductCollectionImgBox">
                            <img src="./slide1.jpg" alt="리스트 번호">
                        </div>
                        <div class="col-md-3 col-sm-4 col-xs-6 artistDetailProductCollectionImgBox">
                            <img src="./slide1.jpg" alt="리스트 번호">
                        </div>
                        <div class="col-md-3 col-sm-4 col-xs-6 artistDetailProductCollectionImgBox">
                            <img src="./slide1.jpg" alt="리스트 번호">
                        </div>
                        <div class="col-md-3 col-sm-4 col-xs-6 artistDetailProductCollectionImgBox">
                            <img src="./slide1.jpg" alt="리스트 번호">
                        </div>
                   </div>
                   <button class="btn btn-default btn-lg btn-block" id="artistDetailProductCollectionButton">더보기</button>
                </div>
                <div class="artistDetailLine">
                     구매후기
                </div>
                <div id="artistDetailBuyReviewCollectionBox">
                    <div id="artistDetailBuyReviewCollection">
                         <div class="artistDetailBuyReview">
                             <div class="col-md-3 artistDetailBuyReviewImgBox"><img src="./slide1.jpg" alt="리스트 번호"></div>
                             <div class="col-md-9 artistDetailBuyReviewProductTitle"><a href="#">상품이름</a></div>
                             <div class="col-md-9 artistDetailBuyReviewProductOption">상품옵션</div>
                             <div class="col-md-9 artistDetailBuyReviewContent">후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용</div>
                             <div class="col-md-4 col-sm-6 col-xs-6 artistDetailBuyReviewStarScore">★★★★★</div>
                             <div class="col-md-5 artistDetailBuyReviewUserName">홍길동</div>
                         </div>
                         <div class="artistDetailBuyReview">
                             <div class="col-md-3 artistDetailBuyReviewImgBox"><img src="./slide1.jpg" alt="리스트 번호"></div>
                             <div class="col-md-9 artistDetailBuyReviewProductTitle"><a href="#">상품이름</a></div>
                             <div class="col-md-9 artistDetailBuyReviewProductOption">상품옵션</div>
                             <div class="col-md-9 artistDetailBuyReviewContent">후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용</div>
                             <div class="col-md-4 col-sm-6 col-xs-6 artistDetailBuyReviewStarScore">★★★★★</div>
                             <div class="col-md-5 artistDetailBuyReviewUserName">홍길동</div>
                         </div>
                    </div>
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