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
        * {
            margin: 0;
            padding: 0;
        }

        a:visited,
        a:active,
        a:link {
            color: black;
        }

        .productDetailLine {
            margin-top: 20px;
        }

        .productDetailLine div {
            font-size: 20px;
        }

        .productDetailLine hr {
            border: 0.5px solid silver;
            padding: 0;
            margin-top: 0;
        }


        .productDetailMain {
            height: 100%;
            border-right: 1px solid silver;
        }

        #productDetailUnderImgBox {
            width: 100%;
            margin-top: 10px;
            text-align: center;
        }

        #productDetailUnderImgBox img {
            width: 24%;
        }

        #productDetail {
            padding: 0;
            margin: 0;
        }

        #productDetailContent {
            width: 100%;
            height: 100%;
            border-top: 1px solid silver;
            font-size: 20px;
            padding-top: 20px;
            padding-bottom: 30px;
            margin-top: 20px;
        }

        #productDetailTabBox {
            margin-top: 10px;
        }

        #productDetailTap li {
            width: 50%;
            text-align: center;
            background-color: ;
        }

        #menu1,
        #home {
            height: 100%;
        }

        .productDetailQandA {
            max-width: 780px;
        }

        .productDetailQandAStatus {
            height: 100px;
            background-color: #1E90FF;
            color: white;
            text-align: center;
            font-size: 20px;
            padding: 5% 0;
            border-bottom: 1px solid silver;
        }

        .productDetailQandAWriter {
            height: 30px;
            font-size: 15px;
        }

        .productDetailQandAWriterDate {
            height: 30px;
            font-size: 15px;
            text-align: right;
        }

        .productDetailQandAContent {
            height: 70px;
            font-size: 15px;
            border-bottom: 1px solid silver;
        }

        #productDetailQandAInputBox {
            width: 100%;
            height: 100px;
            padding: 0;
        }

        #productDetailQandAInputBox .col-xs-12:nth-of-type(2) {
            padding: 0;
        }

        #productDetailQandAInputCheckBox {
            font-size: 15px;
            text-align: right;
        }

        #productDetailQandAInputCheckBox input {
            width: 15px;
            height: 15px;
        }

        #productDetailQandAInput {
            width: 85%;
            height: 70px;
        }

        #productDetailQandAInputButton {
            width: 14%;
            height: 70px;
            background-color: #1E90FF;
            border: 0;
            color: white;
            font-size: 18px;
            font-weight: bold;
        }

        /*
        .col-xs-1, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9, .col-xs-10, .col-xs-11, .col-xs-12
        , .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12
        , .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12 {
            padding: 0;
            margin: 0;
        }
*/

        .productDetailBuyReview {
            max-width: 780px;
            border-bottom: 1px solid silver;
            margin: 0;
            margin-bottom: 20px;
        }

        .productDetailBuyReviewImg {
            max-width: 180px;
            height: 150px;
            padding: 0;
        }

        .productDetailBuyReviewImg img {
            max-width: 180px;
            width: 100%;
            height: 150px;
        }

        .productDetailBuyReviewOption {
            height: 20px;
            font-size: 12px;
        }

        .productDetailBuyReviewContent {
            height: 100px;
            font-size: 15px;
            border-top: 1px solid silver;
        }

        .productDetailBuyReviewScore,
        .productDetailBuyReviewWriter,
        .productDetailBuyReviewWriteDate {
            height: 30px;
            padding-top: 10px;
            font-size: 15px;
            vertical-align: text-bottom;
        }

        .productDetailBuyReviewScore {
            color: #FFBE0A;
            font-size: 25px;
            text-align: center;
            padding: 0;
        }

        .productDetailBuyReviewWriteDate {
            text-align: right;
        }

        #productDetailArtistInfo {
            margin-top: 10px;
        }

        #productDetailRule {
            margin-top: 10px;
        }

        /* 사이드 */

        #productDetailAside {
            max-width: 390px;
            height: 100%;
            background-color: white;
            display: inline-block;
            position: fixed;
            border-top: 1px solid silver;
            padding: 0;
            overflow: auto;
        }

        .productDetailAsideBlock {
            padding-left: 20px;
            padding-right: 20px;
        }

        #productDetailAsideProductName {
            font-size: 25px;
            font-weight: bold;
            margin-top: 20px;
        }

        #productDetailAsideArtistName {
            font-size: 15px;
            margin-top: 5px;
        }

        .btn-group {
            width: 100%;
        }

        .dropdown-toggle {
            width: 100%;
        }

        .dropdown-menu {
            width: 100%;
        }

        .productDetailOptionBox {
            margin-top: 10px;
        }

        .productDetailAsideOptionSelectPrice {
            float: right;
        }

        .productDetailAsideOptionResultBox {
            width: 100%;
            height: 90px;
            border-bottom: 1px solid black;
            border-left: 1px solid silver;
            border-right: 1px solid silver;
            background-color: #eeeeee;
            display: none;
        }

        .productDetailAsideOptionResultBoxInnerHr {
            border: 0.5px solid silver;
            padding: 0 10px;
            margin: 10px;
        }

        .productDetailAsideOptionName {
            height: 40px;
            padding: 10px 0 0 20px;
            vertical-align: middle;
        }

        .productDetailAsideOptionNameResult {
            width: 100%;
            background-color: inherit;
            border: 0;
            font-size: 15px;
        }

        .productDetailAsideOptionCancel {
            height: 40px;
            text-align: right;
            padding-top: 10px;
            padding-right: 10px;
        }

        .productDetailAsideOptionCancel span {
            height: 50px;
            font-size: 20px;
        }

        .productDetailAsideOptionNumBox {
            height: 30px;
        }

        .productDetailAsideOptionNumBox .numButton {
            width: 25px;
            height: 25px;
            font-size: 18px;
            border: 0px;
            margin-right: -4px;
            background-color: white;

        }

        .productDetailAsideOptionNum {
            height: 25px;
            width: 50px;
            margin-right: -4px;
            padding-top: 1px;
            padding-left: 20px;
            border: 0px;
        }

        .productDetailAsideOptionPrice {
            height: 30px;
            font-weight: bold;
            font-size: 20px;
            padding-right: 0;
        }

        .productDetailAsideOptionPrice span {
            width: 10%;
            display: inline-block;
        }

        .productDetailAsideOptionPriceResult {
            background-color: inherit;
            border: 0;
            width: 90%;
            text-align: right;
            margin-right: -15px;
        }

        .customerOrderBox {
            width: 100%;
            height: 100px;
            border-top: 1px solid silver;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .customerOrderTitle {
            height: 19px;
            text-align: center;
            font-size: 15px;
            font-weight: bold;
            padding: 0;
        }

        .customerOrderValue {
            height: 80px;
            padding: 0;
        }

        .customerOrderValue img {
            height: 80px;
        }

        #totalOptionPriceBox {
            width: 100%;
            height: 50px;
            font-size: 20px;
            text-align: right;
        }

        .totalOptionPrice {
            font-size: 25px;
            font-weight: bold;
        }

        .totalOptionPriceResult {
            background-color: inherit;
            border: 0;
            width: 85%;
            text-align: right;
            margin-right: -15px;
        }

        .totalOptionPriceResult span {
            width: 15%;
        }

        .asideOptionButton {
            width: 100%;
            height: 35px;
            background-color: white;
            border: 1px solid silver;
            text-align: left;
            font-size: 15px;
            padding: 5px 10px 5px 20px;
        }

        .asideOptionButton span {
            float: right;
            margin-top: 5px;
        }

        .asideBasket {
            width: 100%;
            height: 60px;
            background-color: #ffd200;
            border: 0px;
            margin-top: 10px;
            color: black;
            font-size: 25px;
            font-weight: bold;
        }

        .asideBuyButton,
        .MobileBuyLinkButton {
            width: 100%;
            height: 60px;
            border: 0;
            background-color: #0000CD;
            color: white;
            font-size: 25px;
            font-weight: bold;
            margin-top: 10px;
        }

        .moreButton {
            width: 100%;
            height: 35px;
            border: 0;
            background-color: #1E90FF;
            color: white;
            font-size: 20px;
            font-weight: bold;

        }

        #MobileBuyLinkButtonBox {
            width: 100%;
            height: 10%;
            border-top: 3px solid silver;
            display: none;
            position: fixed;
            top: 90%;
            background-color: white;
            z-index: 10;
        }

        #MobileBuyCloseButtonBox {
            width: 100%;
            text-align: center;
            font-size: 50px;
            display: none;
        }

        @media (max-width: 991px) {
            .container {
                width: 100%;
                max-width: 100%;
            }
            
            .productDetailMain {
                border-right: 0;
            }

            #productDetailAside {
                max-width: 100%;
                width: 100%;
                height: 50%;
                border-left: 0;
                border-top: 3px solid black;
                background-color: white;
                position: fixed;
                top: 50%;
                z-index: 9;
            }
            
            .productDetailQandA{
                max-width: 100%;
            }
            
            .productDetailBuyReview {
                max-width: 100%;
            }

            .productDetailBuyReviewImg {
                max-width: 100%;
                width: 100%;
                height: 100%;
            }

            .productDetailBuyReviewImg img {
                max-width: 100%;
                width: 100%;
                height: 100%;
            }

            .customerOrderBox {
                width: 100%;
                height: 100%;
                border: 0;
            }

            .customerOrderTitle {
                width: 100%;
            }

            .customerOrderValue {
                width: 100%;
                height: 100%;
                padding: 0;
                margin-bottom: 20px;
            }

            .customerOrderValue img {
                width: 100%;
                height: 100%;
            }

            .productDetailMain {
                padding: 0;
            }

            #MobileBuyLinkButtonBox {
            	max-width: 2000px;
            	width: 100%;
                display: inherit;
            }
        }

    </style>
    <script>
        let windowTogleValue = 0;
        let scrollTogleValue = 0;
        window.onresize = function(event) {
            let windowWidth = window.innerWidth;
            if (windowWidth > 991 && windowTogleValue == 0) {
                $('#productDetailAside').show();
                $('#productDetailAside').css('display', 'inline-block');
                windowTogleValue = 1;
            }

            if (windowWidth <= 991 && windowTogleValue == 1) {
                $('#productDetailAside').hide();
                windowTogleValue = 0;
            }
        };

        $(window).scroll(function() {
            let windowHeight = window.innerHeight;
            let windowWidth = window.innerWidth;
            let asideHeight = $('#productDetailAside').innerHeight();
            let scrollPosition = $(window).scrollTop() + windowHeight;
            let endBlockTop = $('#footer').offset().top;
            
            if(windowWidth > 991) {
                if (endBlockTop > scrollPosition && scrollTogleValue == 0) {
                    $('#productDetailAside').css('position', 'fixed').css('top', '120px');
                    scrollTogleValue = 1;
                }

                if (endBlockTop < scrollPosition && scrollTogleValue == 1) {
                    $('#productDetailAside').css('position', 'absolute').css('top', (endBlockTop-asideHeight) + 'px');
                    scrollTogleValue = 0;
                }
            }
        });

        $(document).ready(function() {
            $('.productDetailUnderImg').on('click', productDetailUnderImgClick);
            $('#productDetailClick0').on('click', productDetailClick0);
            $('#productDetailClick1').on('click', productDetailClick1);
            $('#productDetailClick2').on('click', productDetailClick2);
            $('.productDetailAsideOptionSelect').on('click', productDetailAsideOptionSelect);
            $('.minusButton').on('click', minusButtonClick);
            $('.plusButton').on('click', plusButtonClick);
            $('.glyphicon-remove').on('click', productOptionCancel);
            $('.MobileBuyLinkButton').on('click', mobileAsideShow);
            $('.MobileBuyCloseButton').on('click', mobilAsideHide);
        });

        function productDetailUnderImgClick() {
            let imgClickString = ($(this).attr('alt')).replace(/[^0-9]/g, '');
            let imgClickNum = Number(imgClickString);
            $("#myCarousel").carousel(imgClickNum);
        }

        function productDetailClick0() {
            $('#productDetailTabBox').slideToggle();
        }

        function productDetailClick1() {
            $('#productDetailArtistInfo').slideToggle();
        }

        function productDetailClick2() {
            $('#productDetailRule').slideToggle();
        }

        function productDetailAsideOptionSelect() {
            let optionName = $(this).children('.productDetailAsideOptionSelectName').text();
            let optionPrice = $(this).children('.productDetailAsideOptionSelectPrice').text().replace(/[^0-9]/g, '');
            let resultBox = $(this).parent().parent().parent().next();
            resultBox.children('.productDetailAsideOptionName').children('.productDetailAsideOptionNameResult').val(optionName);
            resultBox.children('.productDetailAsideOptionPrice').children('.productDetailAsideOptionPriceResult').val(optionPrice);
            resultBox.children('.productDetailAsideOptionNumBox').children('.productDetailAsideOptionNum').val(1);
            resultBox.show();
            totalOptionPriceCel();
        }

        function minusButtonClick() {
            let inputNum = $(this).next();
            let num = parseInt($(inputNum).val());
            let min = $(inputNum).attr('min');
            let resultBox = $(this).parent().next().children();
            let currentPrice = resultBox.val();
            if (num > min) {
                $(inputNum).val(num - 1);
                $(resultBox).val((currentPrice / num) * (num - 1));
            }
            totalOptionPriceCel();
        }

        function plusButtonClick() {
            let inputNum = $(this).prev();
            let num = parseInt($(inputNum).val());
            let max = $(inputNum).attr('max');
            let resultBox = $(this).parent().next().children();
            let currentPrice = resultBox.val();
            if (num < max) {
                $(inputNum).val(num + 1);
                $(resultBox).val((currentPrice / num) * (num + 1));
            }
            totalOptionPriceCel();
        }

        function productOptionCancel() {
            let optionBoxParent = $(this).parent().parent();
            optionBoxParent.children('.productDetailAsideOptionNumBox').children('.productDetailAsideOptionNum').val(0);
            optionBoxParent.children('.productDetailAsideOptionPrice').children('.productDetailAsideOptionPriceResult').val(0);
            optionBoxParent.hide();
            totalOptionPriceCel();
        }

        function totalOptionPriceCel() {
            let totalPrice = 0;
            let optionLength = $('.productDetailAsideOptionPriceResult').length;
            for (let i = 0; i < optionLength; i++) {
                totalPrice += Number($('.productDetailAsideOptionPriceResult').eq(i).val());
            }
            $('.totalOptionPriceResult').val(totalPrice);
        }

        function mobileAsideShow() {
            $('#productDetailAside').show();
            $('#productDetailAside').css('top', '50%').css('position','fixed');
            $('#MobileBuyCloseButtonBox').show();
            $('#MobileBuyLinkButtonBox').hide();
        }

        function mobilAsideHide() {
            $('#productDetailAside').hide();
            $('#productDetailAside').css('top', '0px').css('position','fixed');
            $('#MobileBuyCloseButtonBox').hide();
            $('#MobileBuyLinkButtonBox').show();
        }

    </script>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-8 productDetailMain">
                <div id="myCarousel" class="carousel slide" data-interval="false">
                    <!-- Carousel items -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="" alt="슬라이드 0">
                        </div>
                        <div class="item">
                            <img src="" alt="슬라이드 1">
                        </div>
                        	<div class="item" alt="슬라이드 2">
                        </div>
                        <div class="item">
                            <img src="" alt="슬라이드 3">
                        </div>
                    </div>
                    <!-- Controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="icon-prev"></span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="icon-next"></span>
                    </a>
                </div>
                <div id="productDetailUnderImgBox">
                    <img src="" alt="슬라이드 0" class="productDetailUnderImg img-rounded">
                    <img src="" alt="슬라이드 1" class="productDetailUnderImg img-rounded">
                    <img src="" alt="슬라이드 2" class="productDetailUnderImg img-rounded">
                    <img src="" alt="슬라이드 3" class="productDetailUnderImg img-rounded">
                </div>
            </div>
            <!-- 모바일 구매버튼 -->
            <div id="MobileBuyLinkButtonBox">
                <button class="MobileBuyLinkButton">구매</button>
            </div>

            <!-- 사이드창 -->
            <div class="col-md-4" id="productDetailAside">
                <div id="MobileBuyCloseButtonBox">
                    <span class="glyphicon glyphicon-chevron-down MobileBuyCloseButton"></span>
                </div>
                <div class="productDetailAsideBlock" id="productDetailAsideProductName">
                    	<c:out value="${ListDTO.list_title }"></c:out>
                </div>
                <div class="productDetailAsideBlock" id="productDetailAsideArtistName">
                    <a href="#"><c:out value="${ListDTO.list_artist }"></c:out></a>
                </div>
                <form method="get" action="buy">
                    <!-- 옵션박스 -->
                    <div class="productDetailOptionBox productDetailAsideBlock">
                        <div class="btn-group">
                            <button type="button" class="asideOptionButton" data-toggle="dropdown"> 옵션1 <span class="glyphicon glyphicon-chevron-down"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="#" class="productDetailAsideOptionSelect">
                                        <span class="productDetailAsideOptionSelectName">메뉴1</span>
                                        <span class="productDetailAsideOptionSelectPrice">10000원</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="productDetailAsideOptionSelect">
                                        <span class="productDetailAsideOptionSelectName">메뉴2</span>
                                        <span class="productDetailAsideOptionSelectPrice">20000원</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="productDetailAsideOptionSelect">
                                        <span class="productDetailAsideOptionSelectName">메뉴3</span>
                                        <span class="productDetailAsideOptionSelectPrice">30000원</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="productDetailAsideOptionResultBox">
                            <div class="col-xs-10 productDetailAsideOptionName">
                                <input type="text" name="productOptionName" class="productDetailAsideOptionNameResult" readonly>
                            </div>
                            <div class="col-xs-2 productDetailAsideOptionCancel"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></div>
                            <hr class="productDetailAsideOptionResultBoxInnerHr">
                            <div class="col-xs-6 productDetailAsideOptionNumBox">
                                <input type="button" value="-" class="numButton minusButton">
                                <input type="number" name="productOptionNum" class="productDetailAsideOptionNum" value="0" max="10" min="1" readonly>
                                <input type="button" value="+" class="numButton plusButton">
                            </div>
                            <div class="col-xs-6 productDetailAsideOptionPrice">
                                <input type="number" value="${ListDTO.list_base_price }" name="productOptionPrice" class="productDetailAsideOptionPriceResult" readonly><span>원</span>
                            </div>
                        </div>
                    </div>

                    <div class="customerOrderBox productDetailAsideBlock">
                        <div class="col-xs-12 customerOrderTitle">소비자 요구사항1</div>
                        <div class="col-xs-12 customerOrderValue">
                            <img src="" alt="슬라이드 0">
                        </div>
                    </div>

                    <div class="productDetailLine">
                        <hr>
                    </div>

                    <!-- 총 금액 -->
                    <div id="totalOptionPriceBox" class="productDetailAsideBlock">
                        <div class="col-xs-5">총 금액 : </div>
                        <div class="col-xs-7 totalOptionPrice">
                            <input type="number" value="0" name="productOptionTotalPrice" class="totalOptionPriceResult" readonly><span>원</span>
                        </div>
                    </div>
                    <div class="productDetailAsideBlock">
                        <button type="button" class="asideBasket">장바구니</button>
                        <input type="submit" class="asideBuyButton" value="구매">
                    </div>
                </form>
            </div>
            <div class="col-md-8 productDetailMain">
                <div id="productDetailContent">
                    <p><c:out value="${ListDTO.list_content }"></c:out></p>
                </div>
                <div class="productDetailLine">
                    <div class="row">
                        <div class="col-xs-11">Q & A 및 구매후기</div>
                        <div class="col-xs-1">
                            <span class="glyphicon glyphicon-chevron-down" aria-hidden="true" id="productDetailClick0"></span>
                        </div>
                    </div>
                    <hr>
                </div>
                <div id="productDetailTabBox">
                    <ul class="nav nav-tabs" id="productDetailTap">
                        <li class="active"><a data-toggle="tab" href="#home">Q & A</a></li>
                        <li><a data-toggle="tab" href="#menu1">구매후기</a></li>
                    </ul>
                    <div class="tab-content" id="productDetailQandAandBuyReviewBox">
                        <div id="home" class="tab-pane fade in active productDetailQandA">
                            <div class="productDetailQandA">
                                <div class="col-xs-2 productDetailQandAStatus">
                              		      답변완료
                                </div>
                                <div class="col-xs-5 productDetailQandAWriter">홍길동</div>
                                <div class="col-xs-5 productDetailQandAWriterDate">2019.08.06</div>
                                <div class="col-xs-10 productDetailQandAContent">Q&A내용입니다.Q&AB내용입니다.Q&A내용입니다.Q&A내용입니다.Q&A내용입니다.Q&A내용입니다.Q&A내용입니다.Q&A내용입니다.</div>
                            </div>
                            <div class="productDetailQandA">
                                <div class="col-xs-2 productDetailQandAStatus">
                                		    답변완료
                                </div>
                                <div class="col-xs-5 productDetailQandAWriter">홍길동</div>
                                <div class="col-xs-5 productDetailQandAWriterDate">2019.08.06</div>
                                <div class="col-xs-10 productDetailQandAContent">Q&A내용입니다.Q&A내용입니다.Q&A내용입니다.Q&A내용입니다.Q&A내용입니다.Q&A내용입니다.Q&A내용입니다.Q&A내용입니다.</div>
                            </div>
                            <button class="moreButton">더보기</button>
                            <div id="productDetailQandAInputBox">
                                <div class="col-xs-12" id="productDetailQandAInputCheckBox">
                                    <label>비밀글</label>
                                    <input type="checkbox">
                                </div>
                                <div class="col-xs-12 ">
                                    <input type="text" id="productDetailQandAInput">
                                    <button id="productDetailQandAInputButton">등록</button>
                                </div>
                            </div>
                        </div>
                        <div id="menu1" class="tab-pane fade productDetailBuyReview">
                            <div class="row productDetailBuyReview">
                                <div class="col-xs-3 col-sm-3 col-md-3 productDetailBuyReviewImg"><img src="" alt="슬라이드 0"></div>
                                <div class="col-xs-12 col-sm-12 col-md-9 productDetailBuyReviewOption">옵션내용입니다.옵션내용입니다.옵션내용입니다.옵션내용입니다.</div>
                                <div class="col-xs-12 col-sm-12 col-md-9 productDetailBuyReviewContent">구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.</div>
                                <div class="col-xs-4 col-sm-4 col-md-3 productDetailBuyReviewScore">★★★★★</div>
                                <div class="col-xs-4 col-sm-4 col-md-3 productDetailBuyReviewWriter">홍길동</div>
                                <div class="col-xs-4 col-sm-4 col-md-3 productDetailBuyReviewWriteDate">2019.08.07</div>
                            </div>
                            <div class="row productDetailBuyReview">
                                <div class="col-xs-3 col-sm-3 col-md-3 productDetailBuyReviewImg"><img src="" alt="슬라이드 0"></div>
                                <div class="col-xs-12 col-sm-12 col-md-9 productDetailBuyReviewOption">옵션내용입니다.옵션내용입니다.옵션내용입니다.옵션내용입니다.</div>
                                <div class="col-xs-12 col-sm-12 col-md-9 productDetailBuyReviewContent">구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.구매후기 내용입니다.</div>
                                <div class="col-xs-4 col-sm-4 col-md-3 productDetailBuyReviewScore">★★★★★</div>
                                <div class="col-xs-4 col-sm-4 col-md-3 productDetailBuyReviewWriter">홍길동</div>
                                <div class="col-xs-4 col-sm-4 col-md-3 productDetailBuyReviewWriteDate">2019.08.07</div>
                            </div>
                            <button class="moreButton">더보기</button>
                        </div>
                    </div>
                </div>
                <div class="productDetailLine">
                    <div class="row">
                        <div class="col-xs-11">작가 정보</div>
                        <div class="col-xs-1">
                            <span class="glyphicon glyphicon-chevron-down" aria-hidden="true" id="productDetailClick1"></span>
                        </div>
                    </div>
                    <hr>
                </div>
                <div id="productDetailArtistInfo">
                    <table class="table table-striped">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tr>
                            <td>닉네임</td>
                            <td>비트캠프</td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td>홍길동</td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>서울시 종로구</td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td>070-500-2929</td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td>bitcamp@naver.com</td>
                        </tr>
                    </table>
                </div>
                <div class="productDetailLine">
                    <div class="row">
                        <div class="col-xs-11">배송/교환/환불 규정</div>
                        <div class="col-xs-1">
                            <span class="glyphicon glyphicon-chevron-down" aria-hidden="true" id="productDetailClick2"></span>
                        </div>
                    </div>
                    <hr>
                </div>
                <div id="productDetailRule">
                    <table class="table table-striped">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tr>
                            <td>배송비</td>
                            <td>
                                <p>기본료 : 3000원<br>
                                    배송비 무료 조건 : 20000원<br>
                                    제주/ 도서사간 추가비용 : 3000원</p>
                            </td>
                        </tr>
                        <tr>
                            <td>제작/ 배송</td>
                            <td>
                                <p>3일 이내<br>
                                    주문 후 제작에 들어가는 작품입니다.</p>
                            </td>
                        </tr>
                        <tr>
                            <td>교환/ 환불</td>
                            <td>
                                <p>조건 확인
                                    교환/환불 전 반드시 먼저 연락을 해주셔야 합니다.<br>

                                    단순변심에 의한 교환/환불은 택배 도착일 기준 7일이내만 가능하며, 왕복배송비(5,200원)는 고객님 부담입니다.
                                    (보내는 택배비 2,500원/교환 or 반품 수거 택배비 2,700원)<br>

                                    반품 요청기간이 지난 경우
                                    구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우
                                    포장을 개봉하였으니 포장이 훼손되어 상품가치가 현저히 상실된 경우
                                    구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우
                                    고객주문 확인 후 상품제작에 들어가는 주문제작 상품은 반품/교환 불가능 합니다.</p>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>