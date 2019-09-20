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
    <link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Comfortaa', '맑은 고딕', cursive;
        }
        
        .row {
        	margin: 0 !important;
        }

        a:visited,
        a:active,
        a:link {
            color: black;
        }

        .productDetailLine {
        	line-height: 40px;
            margin-top: 50px;
        }

        .productDetailLine div {
            font-size: 18px;
        }

        .productDetailLine hr {
            border: 2px solid #7C7877;
            padding: 0;
            margin-top: 0;
        }
        
        .productDetailLine span{
        	vertical-align: middle;
        	font-size: 25px;
        }
        
        .asideProductDetailLine {
        	margin-top: 20px;
        }
        
        .asideProductDetailLine hr {
        	border: 0.5px solid silver;
            padding: 0;
            margin-top: 0;
        }

		/* 메인시작 */
        .productDetailMain {
            height: 100%;
            border-right: 1px solid silver;
        }
        
        #myCarousel {
        	width: 100%;
        	height: 400px !important;
        }
        
        .item img {
        	width: 100%;
        	height: 400px !important;
        	overflow: hidden;
        }

        #productDetailUnderImgBox {
            width: 100%;
            height: 140px;
            margin-top: 10px;
            text-align: left;
        }

        #productDetailUnderImgBox img {
            width: 24%;
            height: 100%;
        }

        #productDetail {
            padding: 0;
            margin: 0;
        }

        #productDetailContent {
            width: 100%;
            height: 100%;
            border-top: 4px solid #7C7877;
            font-size: 20px;
            padding-top: 20px;
            padding-bottom: 30px;
            margin-top: 50px;
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
        
        .productDetailQandAResponse {
        	max-width: 90%;
        	margin-left: 10% !important;
        }
        
        .productDetailQandAResponse .productDetailQandAStatus .productDetailQandAStatusCircle{
        	background-color: #ABD0CE;
        	color: white;
        }

        .productDetailQandAStatus {
            height: 100px;
            padding: 10px 0 30px 0 !important;
        }
        
        .productDetailQandAStatusCircle {
        	width: 60px !important;
        	height: 60px;
        	line-height: 60px;
            color: #7C7877;
            text-align: center;
            font-size: 20px;
        	border-radius: 50%;
            background-color: #D9D4CF;
            float: right !important;
            padding: 0 !important;
        }

        .productDetailQandAWriter {
            height: 30px;
            font-size: 15px;
            padding-top: 10px;
        }

        .productDetailQandAWriterDate {
            height: 30px;
            font-size: 15px;
            text-align: right;
            padding-top: 10px;
        }

        .productDetailQandAContent {
            height: 70px;
            font-size: 15px;
            padding-top: 5px;
            padding-bottom: 10px;
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
            margin-top: 15px;
        }
        
        #productDetailQandAInputCheckBox label {
        	position: relative;
        	bottom: 4px;
        	font-size: 20px;
        }

        #productDetailQandAInputCheckBox input {
            width: 22px;
            height: 22px;
        }
        

        #productDetailQandAInput {
        	width: 85%;
            height: 70px;
            border: 2px solid #7C7877;
            font-size: 20px;
            padding-left: 10px;
        }

        #productDetailQandAInputButton {
        	width: 14%;
            height: 70px;
            background-color: #7C7877;
            border: 0;
            color: white;
            font-size: 18px;
            font-weight: bold;
            margin-left: 0px;
        }

        .productDetailBuyReview {
            max-width: 780px;
            border-bottom: 1px solid #7C7877;
            padding: 0;
        }

        .productDetailBuyReviewImg {
            max-width: 180px;
            line-height: 150px;
            height: 150px;
            background-color: #D9D4CF;
            font-size: 20px;
            text-align: center;
            padding: 0 !important;
        }

        .productDetailBuyReviewImg img {
            max-width: 180px;
            width: 100%;
            height: 100%;
            object-fit: cover;
            margin-bottom: 1px;
        }

        .productDetailBuyReviewOption {
            height: 20px;
            font-size: 14px;
        }

        .productDetailBuyReviewContent {
            height: 100px;
            font-size: 15px;
            padding-top: 10px;
        }

        .productDetailBuyReviewScore,
        .productDetailBuyReviewWriter,
        .productDetailBuyReviewWriteDate {
            line-height: 30px;
            font-size: 15px;
            vertical-align: text-bottom;
        }

        .productDetailBuyReviewScore {
            color: #FFBE0A;
            font-size: 20px;
            text-align: right;
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
        
        #productRemove, #productActive {
        	width: 100%;
        	height: 50px;
        	display: none;
        	border: 2px solid #7C7877;
        	color: #7C7877;
        	font-size: 20px;
        	font-weight: bold;
        	background-color: white;
        }

        #productDetailAside {
            max-width: 390px;
            height: 100%;
            background-color: white;
            display: inline-block;
            position: fixed;
            padding: 0;
            padding-bottom: 150px;
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
            border-bottom: 1px solid #7C7877;
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
            padding-top: 2px;
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

        .customerOrderValueImgBox, .customerOrderValueColorBox, .customerOrderValueTextBox {
            width: 100%;
            padding 0 !important;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        
        .customerOrderValueImgBox {
        	height: 200px;
        }
        
        .customerOrderValueColorBox {
        	height: 70px;
        }
        
        .customerOrderValueTextBox {
        	height: 105px;
        	overflow: hidden;
        	text-overflow: ellipsis;
        }

        .customerOrderTitle {
            height: 35px;
            border: 1px solid #7C7877;
            background-color: white;
            font-size: 15px;
            padding: 5px 10px 5px 20px;
        }

        .customerOrderValueImg, .customerOrderValueColor, .customerOrderValueText {
            border-right: 1px solid silver;
            border-left: 1px solid silver;
            border-bottom: 1px solid #7C7877;
            text-align: center;
            font-size: 20px;
            padding: 0 !important;
        }
        
        .customerOrderValueImg {
        	height: 165px;
        }

        .customerOrderValueImg img {
        	width: 100%;
            height: 100%;
        }
        
        .customerOrderValueColor {
        	line-height: 35px;
        }
        
        .customerOrderValueText {
        	height: 68px;
        	text-align: left;
        	overflow: hidden;
        	text-overflow: ellipsis;
        	background-color: #eeeeee;
        	padding: 5px 15px !important;
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
            border: 1px solid #7C7877;
            text-align: left;
            font-size: 15px;
            padding: 5px 10px 5px 20px;
        }

        .asideOptionButton span {
            float: right;
            margin-top: 5px;
        }

        .asideBuyButton,
        .MobileBuyLinkButton {
            width: 100%;
            height: 56px;
            border: 2px solid #ABD0CE;
            background-color: #ABD0CE;
            color: white;
            font-size: 25px;
            font-weight: bold;
            margin-top: 10px;
        }

        .moreButton {
            width: 100%;
            height: 35px;
            border: 0;
            background-color: #7C7877;
            color: white;
            font-size: 20px;
            font-weight: bold;

        }

        #MobileBuyLinkButtonBox {
            width: 100%;
            height: 10%;
            display: none;
            position: fixed;
            top: 93.5%;
            background-color: white;
            border-top: 1px solid silver;
            z-index: 10;
        }

        #MobileBuyCloseButtonBox {
            width: 100%;
            text-align: center;
            font-size: 50px;
            display: none;
        }
		
		/* 일반 반응형 */
        @media (max-width: 991px) {
            .container {
                width: 100% !important;
                max-width: 100%;
                padding: 0 !important;
                margin: 0;
            }
            
            .row {
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
                right: 0;
                z-index: 9;
            }
            
            #productDetailContent {
				font-size: 30px;            
            }
            
            .productDetailLine div, .productDetailLine span {
            	font-size: 35px;
            }
            
            #productDetailTap li a {
            	font-size: 30px;
            }
            
            .productDetailQandA{
                max-width: 100%;
                height: 200px;
            }
            
            .productDetailQandAResponse {
            	width: 90%;
            	height: 200px;
            }
            
            .productDetailQandAStatusCircle {
            	width: 150px !important;
            	height: 150px;
            	line-height: 150px;
            	font-size: 40px;
            }
            
            .productDetailQandAWriter {
            	height: 60px;
            	font-size: 30px;
            }
            
            .productDetailQandAWriterDate {
            	height: 60px;
            	font-size: 30px;
            }
            
            .productDetailQandAContent {
            	height: 140px;
            	font-size: 30px;
            }
            
            #productDetailQandAInputCheckBox label{
            	font-size: 30px;
            }
            
            #productDetailQandASecretCheckBox input {
            	width: 30px;
            	height: 30px;
            }
            
            #productDetailQandAInput {
            	height: 100px;
            	font-size: 35px;
            	margin-bottom: 30px;
            }
            
            #productDetailQandAInputButton {
            	height: 100px;
            	font-size: 36px;
            }
            
            .moreButton {
            	height: 80px;
            	font-size: 40px;
            }
            
            .productDetailBuyReview {
                max-width: 100%;
            }

            .productDetailBuyReviewImg {
                max-width: 100%;
                width: 100%;
                line-height: 100%;
                height: 100%;
            }

            .productDetailBuyReviewImg img {
                max-width: 100%;
                width: 100%;
                height: 100%;
            }
            
            .productDetailBuyReviewOption {
            	height: 40px;
            	font-size: 30px;
            }
            
            .productDetailBuyReviewContent {
            	height: 200px;
            	font-size: 30px;
            }
            
            .productDetailBuyReviewScore {
            	height: 60px;
            	font-size: 50px !important;
            }
            
            .productDetailBuyReviewWriter, .productDetailBuyReviewWriteDate{
            	height: 60px;
            	font-size: 30px;
            }
            
            .table {
            	font-size: 25px;
            }
            
            #MobileBuyCloseButtonBox {
            	font-size: 100px;
            }
            
            #productDetailAsideProductName {
            	font-size: 50px;
            }
            
            #productDetailAsideArtistName {
            	font-size: 30px;
            }
            
            .productDetailAsideOptionResultBox {
            	height: 180px;
            }
            
            .productDetailAsideOptionName {
            	height: 80px;
            	line-height: 70px;
            }
            
            .productDetailAsideOptionNameResult {
            	font-size: 30px;
            }
            
            .productDetailAsideOptionCancel {
            	height: 80px;
            }
            
            .productDetailAsideOptionCancel span {
            	font-size: 40px;
            }
            
            .productDetailAsideOptionNumBox {
            	height: 60px;
            	padding-top: 15px;
            }
            
            .productDetailAsideOptionNumBox .numButton {
            	width: 50px;
            	height: 50px;
            	font-size: 32px;
            }
            
            .productDetailAsideOptionNum {
            	width: 100px;
            	height: 50px;
            	font-size: 30px;
            	padding-left: 45px;
            }
            
            .productDetailAsideOptionPrice {
            	height: 60px;
            	padding-top: 15px;
            }
            
            .productDetailAsideOptionPrice span  {
            	font-size: 30px;
            }
            
            .productDetailAsideOptionPriceResult {
            	font-size: 30px;
            	margin-right: 0;
            }
            
            #totalOptionPriceBox .col-xs-5 {
            	font-size: 30px;
            }
            
            .totalOptionPriceResult {
            	font-size: 30px;
            	margin-right: 0;	
            }
            
            .totalOptionPrice span {
            	font-size: 30px;
            }
            
            .asideOptionButton {
            	height: 70px;
            	font-size: 30px;
            }
            
            .dropdown-menu li {
            	height: 50px;
            	font-size: 28px;
            }
            
            .customerOrderTitle, .customerOrderValueColor {
            	height: 70px;
            	line-height: 70px;
            	font-size: 30px;
            }
            
            .customerOrderValueTextBox {
            	height: 210px;
            }
            
            .customerOrderValueText {
            	height: 138px;
            	font-size: 30px;
            }
        
        	.customerOrderValueImgBox {
        		height: 400px;
        	}
        
        	.customerOrderValueImg {
        		height: 365px;
        	}

        	.customerOrderValueImg img {
        		width: 100%;
            	height: 100%;
            	object-fit: cover;
        	}
        	

            .productDetailMain {
                padding: 0;
            }

            .MobileBuyLinkButton {
            	height: 100px;
            	font-size: 60px;
            	margin: 0;
            }
            
            #MobileBuyLinkButtonBox {
            	max-width: 100%;
            	width: 100%;
            	height: 100%;
            	right: 0;
                display: inherit;
            }
            
            .asideBuyButton {
            	height: 100px;
            	font-size: 50px;
            }
            
        }
    </style>
    <script>
        var productDetailAsideOptionSelectArr = new Array();
        
        //창 크기가 줄어들었을때 모바일 창을 작동
        window.onresize = function(event) {
        	mobileViewConverter();
        }
        
        //새로고침 했을때 이전사이트로 이동 (82 : r키, 116 : f5)
        document.onkeydown = function(event) {
        	if(event.keyCode == 116 || event.ctrlKey == true && event.keyCode == 82) {
        		event.preventDefault();
        		let orderList = $('#order_List').val();
        		let list_no = $('#list_no').val();
        		
        		if(orderList) {
        			//새로고침시 주문삭제
        			if(confirm("주문옵션이 저장되지 않습니다. 계속 하시겠습니까?") == true) {
        				let order = $('input[name="list_order_member_no"]');
        				for(let i=0; i<order.length; i++) {
        					let list_order_member_no = Number($('input[name="list_order_member_no"]:eq('+i+')').val());
        					$.ajax({
        		    			url:"/ajaxListOrderMemberNoDelete"
        		    			,contentType: 'application/json; charset=utf-8'
        		    			,data: JSON.stringify({list_order_member_no : list_order_member_no})
        		    			,dataType: "text"
        		    			,type: "POST"
        		    			,success:function(data){
        		    				console.log(data);
        		    			}
        		    			,error:function(data){
        		    				console.log('주문 삭제 실패');
        		    			}
        		    		});
        				}
        				window.location.href="/checkIsOrdered?no="+list_no;
        			}
        		}
        		else {
        			window.location.href="/productDetail/"+list_no;
        		}
        	}
		}
        
        function orderlistDelete() {
        	if(confirm("주문옵션이 저장되지 않습니다. 계속 하시겠습니까?") == true) {
				let order = $('input[name="list_order_member_no"]');
				for(let i=0; i<order.length; i++) {
					let list_order_member_no = Number($('input[name="list_order_member_no"]:eq('+i+')').val());
					$.ajax({
		    			url:"/ajaxListOrderMemberNoDelete"
		    			,contentType: 'application/json; charset=utf-8'
		    			,data: JSON.stringify({list_order_member_no : list_order_member_no})
		    			,dataType: "text"
		    			,type: "POST"
		    			,success:function(data){
		    				console.log(data);
		    			}
		    			,error:function(data){
		    				console.log('주문 삭제 실패');
		    			}
		    		});
				}
				window.location.href="/checkIsOrdered?no="+list_no;
			}
        }
        
        //스크롤이 푸터영역에 다다르면 사이드창을 고정시킴
        $(window).scroll(function() {
        	asideScrollFix();
        });
        
      	//시작시 초기화
      	$(document).ready(mobileViewConverter);
        $(document).ready(qaBoardList);
      	$(document).ready(buyReviewList);
      	$(document).ready(productRemoveOn);
        
        $(document).on('click', '.minusButton', minusButtonClick);
        $(document).on('click', '.plusButton', plusButtonClick);
        $(document).on('click', '.glyphicon-remove', productOptionCancel);
        
        $(document).ready(function() {        	
            $('.productDetailUnderImg').on('click', productDetailUnderImgClick);
            $('#productDetailClick0').on('click', productDetailClick0);
            $('#productDetailClick1').on('click', productDetailClick1);
            $('#productDetailClick2').on('click', productDetailClick2);
            $('.productDetailAsideOptionSelect').on('click', productDetailAsideOptionSelect);;
            $('.MobileBuyLinkButton').on('click', mobileAsideShow);
            $('.MobileBuyCloseButton').on('click', mobilAsideHide);
            $('#productDetailQandAInputButton').on('click', qaBoardInsert);
            $('#productDetailQandAMoreButton').on('click', qaBoardList);
            $('#productDetailBuyReviewMoreButton').on('click',buyReviewList);
            $('#artistDetailPageMove').on('click', artistDetailPageMove);
            $('#productRemove').on('click', productDetailPageToggle);
            $('#productActive').on('click', productDetailPageToggle);
        });
        
        //반응형 사이드 변환함수
        let mobileViewConverterToggle = 0;
        let mobileViewConverterfirstStart = 0;
        function mobileViewConverter() {
        	let windowWidth = window.innerWidth;
        	
        	//처음 함수 시작시 초기화 함수
        	if(mobileViewConverterfirstStart == 0) {
        		//첫 시작 화면이 모바일 화면이라면 모바일로 사이드 셋팅
        		if(windowWidth <= 991) {
        			mobileViewConverterToggle = 1;
        		}
        		mobileViewConverterfirstStart = 1;
        	}
        	
            if (windowWidth > 991 && mobileViewConverterToggle == 0) {
                $('#productDetailAside').show();
                $('#productDetailAside').css('display', 'inline-block');
                $('#productDetailAside').css('top', '12.8%').css('position','fixed');
                $('#MobileBuyCloseButtonBox').hide();
                mobileViewConverterToggle = 1;
            }

            if (windowWidth <= 991 && mobileViewConverterToggle == 1) {
            	mobilAsideHide();
                mobileViewConverterToggle = 0;
            }
        }
        
        function asideScrollFix() {
        	let windowHeight = window.innerHeight;
            let windowWidth = window.innerWidth;
            let asideHeight = $('#productDetailAside').innerHeight();
            let headerHeight = $('#mallmenu').innerHeight();
            let scrollPosition = $(window).scrollTop() + windowHeight +headerHeight;
            let endBlockTop = 0;
            if($('#footer').length == 1) {
            	endBlockTop = $('#footer').offset().top;
            }
            else {
            	endBlockTop = $('#mobileFooter').offset().top;
            }
            
            if(windowWidth > 991) {
                if (endBlockTop > scrollPosition) {
                    $('#productDetailAside').css('position', 'fixed').css('top', '120px');
                }

                if (endBlockTop < scrollPosition) {
                    $('#productDetailAside').css('position', 'absolute').css('top', (endBlockTop-asideHeight) + 'px');
                }
            }
        }

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
            let optionName = $(this).children('.productDetailAsideOptionSelectName').text().trim();
            let optionPrice = $(this).children('.productDetailAsideOptionSelectPrice').text().replace(/[^0-9]/g, '');
            let optionStock = $(this).children('.productDetailAsideOptionSelectStock').val();
            let optionNumber = $(this).children('.productDetailAsideOptionSelectOptionNo').val();
            let resultBox = $(this).parent().parent().parent().next();
            var result = "";
            let overlapTest = true;
            
            for(let i=0; i<productDetailAsideOptionSelectArr.length; i++) {
                if(productDetailAsideOptionSelectArr[i] == optionName) {
                    overlapTest = false;
                    break;
                }
            }
            
            if(overlapTest && optionStock > 0) {
            	result += '<div class="productDetailAsideOptionResultBox">';
            	result += '    <div class="col-xs-10 productDetailAsideOptionName">';
            	result += '        <input type="text" value="'+optionName+'" name="option_name" class="productDetailAsideOptionNameResult" readonly>';
            	result += '    </div>';
            	result += '    <div class="col-xs-2 productDetailAsideOptionCancel"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></div>';
            	result += '    <hr class="productDetailAsideOptionResultBoxInnerHr">';
            	result += '    <div class="col-xs-6 productDetailAsideOptionNumBox">';
            	result += '        <input type="button" value="-" class="numButton minusButton">';
            	result += '        <input type="number" name="order_amount" class="productDetailAsideOptionNum" value="1" max="'+optionStock+'" min="1" readonly>';
            	result += '        <input type="button" value="+" class="numButton plusButton">';
            	result += '    </div>';
            	result += '    <div class="col-xs-6 productDetailAsideOptionPrice">';
            	result += '        <input type="number" value="'+optionPrice+'" name="option_price" class="productDetailAsideOptionPriceResult" readonly><span>원</span>';
            	result += '    </div>';
            	result += '    <input type="hidden" value="'+optionNumber+'" name="order_add_option" readonly="readonly">'
            	result += '</div>';
            	$('#ResultBox').append(result);
                $('.productDetailAsideOptionResultBox').css('display','block');
                productDetailAsideOptionSelectArr.push(optionName);
            	resultBox.show();
           	    totalOptionPriceCel();
            }
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
            let optionName = optionBoxParent.children('.productDetailAsideOptionName').children('.productDetailAsideOptionNameResult').val();
            
            for(let i=0; i<productDetailAsideOptionSelectArr.length; i++) {
            	if(productDetailAsideOptionSelectArr[i] == optionName) {
            		productDetailAsideOptionSelectArr.splice(i, 1);
            		break;
            	}
            }
            
            optionBoxParent.remove();
            totalOptionPriceCel();
        }

        function totalOptionPriceCel() {
        	let basePrice = Number($('#base_price').val());
            let totalPrice = 0;
            let optionLength = $('.productDetailAsideOptionPriceResult').length;
            for (let i = 0; i < optionLength; i++) {
                totalPrice += Number($('.productDetailAsideOptionPriceResult').eq(i).val());
            }
            $('.totalOptionPriceResult').val(basePrice+totalPrice);
        }

        //모바일에서 사이드창 보여주기 함수
        function mobileAsideShow() {
            $('#productDetailAside').show();
            $('#productDetailAside').css('top', '50%').css('position','fixed');
            $('#MobileBuyCloseButtonBox').show();
            $('#MobileBuyLinkButtonBox').hide();
        }

        //모바일에서 사이드창 내리기 함수
        function mobilAsideHide() {
            $('#productDetailAside').hide();
            $('#productDetailAside').css('top', '0px').css('position','fixed');
            $('#MobileBuyCloseButtonBox').hide();
            $('#MobileBuyLinkButtonBox').show();
        }
        
        function qaBoardInsert() {
    		let content = document.getElementById("productDetailQandAInput").value;
    		let secret = document.getElementById("productDetailQandASecretCheckBox").checked;
    		let listno = document.getElementById("list_no").value;

    		$.ajax({
    			url:"/ajaxqaboardinsert"
    			,contentType: 'application/json; charset=utf-8'
    			,data: JSON.stringify({qa_content:content, qa_secret:secret, list_no:listno})
    			,type: "POST"
    			,success:function(data){
    				console.log('Q & A 댓글 성공');
    				if(data == '1') {
    					$('#productDetailQandAInput').val('');
    					$('#productDetailQandAAjaxResult').empty();
    					$('#productDetailQandAMoreButton').show();
    					$('#qa_current_page').val(1);
    					qaBoardList();
    					alert('등록 되었습니다.');
    				}
    				else if(data == '0') {
    					alert('등록에 실패했습니다.');
    				}
    				else {
    					alert('로그인부터 해주시기 바랍니다.');
    					location.href="/login";
    				}
    			}
    			,error:function(data){
    				console.log('Q & A 댓글 실패');
    			}
    		});
		}
        
        function qaBoardList() {
			let qaCurrent = $('#qa_current_page').val();
			let listno = $('#list_no').val();
			$.ajax({
    			url:"/ajaxqaboardList"
    			,contentType: 'application/json; charset=utf-8'
    			,data: JSON.stringify({currentpage:qaCurrent, list_no:listno})
    			,type: "POST"
    			,dataType: "json"
    			,success:function(data){
    				console.log('Q & A 성공');
    				var result = '';
    				let qalist = data.qalist;
    				
     				if(qalist.length == 0) {
    					result += '<div class="row productDetailQandA">';
						result += '<div class="col-xs-2 "></div>';
    					result += '<div class="col-xs-5 productDetailQandAWriter"></div>';
    					result += '<div class="col-xs-5 productDetailQandAWriterDate"></div>';
    					result += '<div class="col-xs-12 productDetailQandAContent">Q & A가 없습니다.</div>';
    					result += '</div>';
    					$('#productDetailQandAMoreButton').hide();
    				}
     				else {
    					for(let i=0; i<qalist.length; i++) {
    						//해당 작가가 아니라면
    						if(qalist[i].level == 1) {
    							result += '<div class="row productDetailQandA">';
    							result += '<div class="col-md-1 col-xs-2 productDetailQandAStatus"><div class="col-xs-12 productDetailQandAStatusCircle">'+qalist[i].qa_board_status+'</div></div>';
        						result += '<div class="col-md-6 col-xs-5 productDetailQandAWriter">'+qalist[i].user_name+'</div>';
        						result += '<div class="col-md-5 col-xs-5 productDetailQandAWriterDate">'+jsonDateConverter(qalist[i].qa_board_date)+'</div>';
        						result += '<div class="col-md-11 col-xs-10 productDetailQandAContent">'+qalist[i].qa_board_content+'</div>';
        						result += '</div>';
    						}
    						else {
    							result += '<div class="row productDetailQandAResponse">';
    							result += '<div class="col-md-1 col-xs-2 productDetailQandAStatus"><div class="col-xs-12 productDetailQandAStatusCircle">답변</div></div>';
        						result += '<div class="col-md-6 col-xs-5 productDetailQandAWriter">'+qalist[i].user_name+'</div>';
        						result += '<div class="col-md-5 col-xs-5 productDetailQandAWriterDate">'+jsonDateConverter(qalist[i].qa_board_date)+'</div>';
        						result += '<div class="col-md-11 col-xs-10 productDetailQandAContent">'+qalist[i].qa_board_content+'</div>';
        						result += '</div>';
    						}
    					}
    					if(data.endSql == data.maxSql) {
    						$('#productDetailQandAMoreButton').hide();
    					}
     				}
     				$('#productDetailQandAAjaxResult').val(0);
    				$('#productDetailQandAAjaxResult').append(result);
    				$('#qa_current_page').val(Number(qaCurrent)+1);
    			}
    			,error:function(data){
    				console.log('Q & A 실패');
    			}
    		});
		}
        
        function buyReviewList() {
			let buyReviewCurrent = $('#buyReview_current_page').val();
			let listno = $('#list_no').val();
			$.ajax({
    			url:"/ajaxBuyReviewList"
    			,contentType: 'application/json; charset=utf-8'
    			,data: JSON.stringify({currentpage:buyReviewCurrent, list_no:listno})
    			,type: "POST"
    			,dataType: "json"
    			,success:function(data){
    				console.log('구매후기 성공');
    				var result = '';
    				let listBuyReview = data.listBuyReview
     				if(listBuyReview.length == 0) {
    					result += '<div class="row productDetailBuyReview">';
    					result += '<div class="col-xs-12 col-sm-12 col-md-9 productDetailBuyReviewContent">구매후기가 없습니다.</div>'
						result += '</div>';
    					$('#productDetailBuyReviewMoreButton').hide();
    				} 
     				else {
    					for(let i=0; i<listBuyReview.length; i++) {
    						result += '<div class="row productDetailBuyReview">';
							result += '<div class="col-xs-12 col-sm-12 col-md-3 productDetailBuyReviewImg">';
							if(listBuyReview[i].buy_review_image_loc != null) {
								result += '<img src="'+listBuyReview[i].buy_review_image_loc+'" alt="구매후기 이미지">';
							}
							else {
								result += '이미지 없음';
							}
							result += '</div>';
							result += '<div class="col-xs-12 col-sm-12 col-md-9 productDetailBuyReviewOption">'+listBuyReview[i].order_add_option+'</div>';
							result += '<div class="col-xs-12 col-sm-12 col-md-9 productDetailBuyReviewContent">'+listBuyReview[i].buy_review_content+'</div>';
							result += '<div class="col-xs-4 col-sm-4 col-md-3 productDetailBuyReviewScore">';
							for(let j=1; j<=listBuyReview[i].buy_review_score; j++) {
								result += '★';
							}
							result += '</div>';
							result += '<div class="col-xs-4 col-sm-4 col-md-3 productDetailBuyReviewWriter">'+listBuyReview[i].user_name+'</div>';
							result += '<div class="col-xs-4 col-sm-4 col-md-3 productDetailBuyReviewWriteDate">'+jsonDateConverter(listBuyReview[i].buy_review_date)+'</div>';
							result += '</div>';
    					}
    					if(data.endSql == data.maxSql) {
    						$('#productDetailBuyReviewMoreButton').hide();
    					}
     				}
     				
    				$('#productDetailBuyReviewAjaxResult').append(result);
    				$('#buyReview_current_page').val(Number(buyReviewCurrent)+1);
    			}
    			,error:function(data){
    				console.log('구매후기 실패');
    			}
    		});
		}
        
        function jsonDateConverter(milliseconds){
        	let date = new Date(milliseconds);
        	let year = date.getFullYear();
        	let month = date.getMonth()+1;
        	if(month < 10) {
        		month = '0'+month;
        	}
        	let day = date.getDate();
        	if(day < 10) {
        		day = '0'+day;
        	}
        	return year+'-'+month+'-'+day;
        }
        
        function artistDetailPageMove() {
        	let artist_no = $('#artist_no').val();
        	location.href="/artistDetail/"+artist_no;
        }
        
        function productRemoveOn() {
        	let productRemoveDecision = $('#productRemoveDecision').val();
        	if(productRemoveDecision == 'true') {
        		$('#productRemove').show();
        		$('#productActive').show();
        	}
        }
        
        function productDetailPageToggle() {
        	let listNo = $('#list_no').val();
        	$.ajax({
        		url:"/productDetail/ajaxProductToggle"
        		,contentType: "application/json; charset=utf-8"
        		,data: JSON.stringify({list_no:listNo})
        		,dataType: "text"
        		,type: "POST"
        		,success: function(data) {
        			alert(data);
        			if(data == "로그인부터 하세요") {
        				location.href="/login";
        			}
        			else {
        				location.href="/productDetail/"+listNo;
        			}
        		}
        		,error: function(data) {
        			alert("알수없는 오류");
        		}
        	});
        }
         
    </script>
</head>

<body>
<!-- 각종 정보 모음 -->
<input type="hidden" value="${QACurrentPage }" id="qa_current_page" readonly="readonly">
<input type="hidden" value="${buyReviewCurrentPage }" id="buyReview_current_page" readonly="readonly">
<input type="hidden" value="${listDTO.list_base_price }" id="base_price" readonly="readonly">
<input type="hidden" value="${artistBoardNo}" id="artist_no" readonly="readonly">
<input type="hidden" value="${productRemoveDecision }" id="productRemoveDecision" readonly="readonly">
<input type="hidden" value="${orderList }" id="order_List" readonly="readonly">
    <div class="container">
        <div class="row">
            <div class="col-md-8 productDetailMain">
                <div id="myCarousel" class="carousel slide" data-interval="false">
                    <!-- Carousel items -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="${imgList.get(0) }" alt="슬라이드 0">
                        </div>
                        <c:forEach var="img" items="${imgList }" begin="1" varStatus="i">
                        	<div class="item">
                            	<img src="${img }" alt="슬라이드 ${i.index }">
                       		</div>
                        </c:forEach>
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
                	<c:forEach var="img" items="${imgList }" varStatus="i">
                		<img src="${img }" alt="슬라이드 ${i.index }" class="productDetailUnderImg img-rounded">
                    </c:forEach>
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
                <c:if test="${listDTO.list_status == 1 }">
                	<input type="button" value="상품 비활성" id="productRemove">
                </c:if>
                <c:if test="${listDTO.list_status == 0 }">
               		<input type="button" value="상품 활성" id="productActive">
                </c:if>
                <div class="productDetailAsideBlock" id="productDetailAsideProductName">
                    	<c:out value="${listDTO.list_title }"></c:out>
                </div>
                <div class="productDetailAsideBlock" id="productDetailAsideArtistName">
                    <a href="#" id="artistDetailPageMove"><c:out value="${listDTO.list_artist }"></c:out></a>
                </div>
                <form method="post" action="/productDetailResult" id="productDetailResultForm">
                	<!-- 구매에 필요한 정보모음 -->
                	<input type="hidden" value="${listDTO.list_no }" id="list_no" name="list_no" readonly="readonly">
                    <input type="hidden" value="${listDTO.list_title }" name="list_title" readonly="readonly">
                    <!-- 옵션박스 -->
                    <div class="productDetailOptionBox productDetailAsideBlock">
                        <div class="btn-group">
                            <button type="button" class="asideOptionButton" data-toggle="dropdown"> 옵션 <span class="glyphicon glyphicon-chevron-down"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                            <c:forEach var="optionList" items="${optionList }">
                            	<li>
                                    <a href="#" class="productDetailAsideOptionSelect">
                                        <span class="productDetailAsideOptionSelectName">
                                        	<c:out value="${optionList.option_name}"></c:out>
                                        </span>
                                        <span class="productDetailAsideOptionSelectPrice">
                                        	<c:out value="${optionList.option_price }"></c:out>
                                        </span>
                                        <input type="hidden" value="${optionList.option_stock }" class="productDetailAsideOptionSelectStock" readonly>
                                        <input type="hidden" value="${optionList.option_no }" class="productDetailAsideOptionSelectOptionNo" readonly>
                                    </a>
                                </li>
                            </c:forEach>
                            </ul>
                        </div>
                        <div id="ResultBox"></div>
                    </div>
                    <c:if test="${orderList != null }">
                    	<div class="asideProductDetailLine">
                        	<hr>
                    	</div>
                    	<c:forEach var="orderList" items="${orderList }"  varStatus="i">
                    		<input type="hidden" name="list_order_member_no" value="${orderList.list_order_member_no }" readonly="readonly">
                        	<c:if test="${orderList.order_option eq 'picture' }">
                    			<div class="customerOrderValueImgBox productDetailAsideBlock">
                        			<div class="col-xs-12 customerOrderTitle">주문옵션${i.index+1} : <c:out value="${orderList.order_name }"></c:out></div>
                        			<div class="col-xs-12 customerOrderValueImg">
                        				<img src="${orderList.order_value }" alt="주문사진">
                        			</div>
                        		</div>
                        	</c:if>
                        	<c:if test="${orderList.order_option eq 'color' }">
                        		<div class="customerOrderValueColorBox productDetailAsideBlock">
                        			<div class="col-xs-12 customerOrderTitle">주문옵션${i.index+1} : <c:out value="${orderList.order_name }"></c:out></div>
                        			<div class="col-xs-12 customerOrderValueColor" style="background-color: ${orderList.order_value}; color: ${orderList.order_value_TextColor}">
                        				<c:out value="색상 : ${orderList.order_value }"></c:out>
                        			</div>
                        		</div>
                        	</c:if>
                        	<c:if test="${orderList.order_option eq 'text' }">
                        		<div class="customerOrderValueTextBox productDetailAsideBlock">
                        			<div class="col-xs-12 customerOrderTitle">주문옵션${i.index+1} : <c:out value="${orderList.order_name }"></c:out></div>
                        			<div class="col-xs-12 customerOrderValueText">
                        				<c:out value="${orderList.order_value }"></c:out>
                        			</div>
                        		</div>
                        	</c:if>
                   	 	</c:forEach>
                    </c:if>
                    <div class="asideProductDetailLine">
                        <hr>
                    </div>

                    <!-- 총 금액 -->
                    <div id="totalOptionPriceBox" class="productDetailAsideBlock">
                        <div class="col-xs-5">총 금액 : </div>
                        <div class="col-xs-7 totalOptionPrice">
                            <input type="number" value="${listDTO.list_base_price }" name="order_price" class="totalOptionPriceResult" readonly><span>원</span>
                        </div>
                    </div>
                    <div class="productDetailAsideBlock">
                        <input type="submit" class="asideBuyButton" value="구매">
                    </div>
                </form>
            </div>
            <div class="col-md-8 productDetailMain">
                <div id="productDetailContent">
                    ${listDTO.list_content }
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
                            <div id="productDetailQandAAjaxResult"></div>  
                            <button class="moreButton" id="productDetailQandAMoreButton">더보기</button>
                            <div id="productDetailQandAInputBox">
                            	<form>
                               		<div class="col-xs-12" id="productDetailQandAInputCheckBox">
                                    	<label>비밀글</label>
                                    	<input type="checkbox" id="productDetailQandASecretCheckBox">
                                	</div>
                                	<div class="col-xs-12 ">
                                		<input type="text" id="productDetailQandAInput">
                                		<button type="button" id="productDetailQandAInputButton">등록</button>
                               		</div>
                               	</form>
                            </div>
                        </div>
                        <div id="menu1" class="tab-pane fade productDetailBuyReview">
                        	<div id="productDetailBuyReviewAjaxResult"></div>
                            <button class="moreButton" id="productDetailBuyReviewMoreButton">더보기</button>
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
                	<c:if test="${artistInfo != null }">
                    <table class="table table-striped">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tr>
                            <td>닉네임</td>
                            <td><c:out value="${artistInfo.user_nick }"></c:out></td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td><c:out value="${artistInfo.user_name }"></c:out></td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td><c:out value="${artistInfo.user_address }"></c:out></td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td><c:out value="${artistInfo.user_call }"></c:out></td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td><c:out value="${artistInfo.user_email }"></c:out></td>
                        </tr>
                    </table>
                    </c:if>
                    <c:if test="${artistInfo == null }">
                    <div>작가 정보가 없습니다.</div>
                    </c:if>
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
                                                                      제주/ 도서사간 추가비용 : 3000원
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>제작/ 배송</td>
                            <td>
                                <p>3일 이내<br>
                                                                      주문 후 제작에 들어가는 작품입니다.
                                </p>
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
                                                                      고객주문 확인 후 상품제작에 들어가는 주문제작 상품은 반품/교환 불가능 합니다.
                               </p>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>