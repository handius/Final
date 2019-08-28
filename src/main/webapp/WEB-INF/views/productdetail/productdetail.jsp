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
        
        .row {
        	margin: 0 !important;
        }

        a:visited,
        a:active,
        a:link {
            color: black;
        }

        .productDetailLine {
            margin-top: 20px;
            background-color: rgb(201, 194, 180);
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
        
        #myCarousel {
        	width: 100%;
        	height: 400px !important;
        }
        
        .item img {
        	width: 100%;
        	height: 400px !important;
        	object-fit: cover;
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
        
        .productDetailQandAResponse {
        	max-width: 90%;
        	margin-left: 10%;
        }
        
        .productDetailQandAResponse .productDetailQandAStatus{
        	background-color: red;
        }

        .productDetailQandAStatus {
            height: 100px;
            background-color: rgb(201, 194, 180);
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
            background-color: rgb(201, 194, 180);
            border: 0;
            color: white;
            font-size: 18px;
            font-weight: bold;
        }

        .productDetailBuyReview {
            max-width: 780px;
            border-bottom: 1px solid silver;
            margin: 0;
            margin-bottom: 20px;
            padding: 0 0 20px 0;
        }

        .productDetailBuyReviewImg {
            max-width: 180px;
            height: 150px;
            padding: 0 !important;
        }

        .productDetailBuyReviewImg img {
            max-width: 180px;
            width: 100%;
            height: 150px;
        }

        .productDetailBuyReviewOption {
            height: 20px;
            font-size: 14px;
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
        
        #productRemove {
        	width: 100%;
        	height: 50px;
        	display: none;
        	margin-top: 20px;
        }

        #productDetailAside {
            max-width: 390px;
            height: 100%;
            background-color: white;
            display: inline-block;
            position: fixed;
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
            text-align: center;
            font-size: 25px;
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
            height: 56px;
            background-color: white;
            border: 2px solid black;
            margin-top: 10px;
            color: black;
            font-size: 25px;
            font-weight: bold;
        }

        .asideBuyButton,
        .MobileBuyLinkButton {
            width: 100%;
            height: 56px;
            border: 2px solid #0000CD;
            background-color: white;
            color: #0000CD;
            font-size: 25px;
            font-weight: bold;
            margin-top: 10px;
        }

        .moreButton {
            width: 100%;
            height: 35px;
            border: 0;
            background-color: rgb(201, 194, 180);
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

            .MobileBuyLinkButton {
            	margin: 0;
            }
            
            #MobileBuyLinkButtonBox {
            	max-width: 100%;
            	width: 100%;
            	height: 60px;
            	right: 0;
                display: inherit;
            }
            
        }
    </style>
    <script>
        var productDetailAsideOptionSelectArr = new Array();
        
        //창 크기가 줄어들었을때 모바일 창을 작동
        window.onresize = function(event) {
        	mobileViewConverter();
        };
        
        function hi() {
			
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
            $('.asideBasket').on('click',cookieInsert);
            $('#artistDetailPageMove').on('click', artistDetailPageMove);
            $('#productRemove').on('click',productRemove);
        });
        
        function mobileViewConverter() {
        	let windowWidth = window.innerWidth;
            if (windowWidth > 991) {
                $('#productDetailAside').show();
                $('#productDetailAside').css('display', 'inline-block');
            }

            if (windowWidth <= 991 ) {
                $('#productDetailAside').hide();
            }
        }
        
        function asideScrollFix() {
        	let windowHeight = window.innerHeight;
            let windowWidth = window.innerWidth;
            let asideHeight = $('#productDetailAside').innerHeight();
            let headerHeight = $('#mallmenu').innerHeight();
            let scrollPosition = $(window).scrollTop() + windowHeight +headerHeight;
            let endBlockTop = $('#footer').offset().top;
            
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
     				if(data.length == 0) {
    					result += '<div class="row productDetailQandA">';
						result += '<div class="col-xs-2 "></div>';
    					result += '<div class="col-xs-5 productDetailQandAWriter"></div>';
    					result += '<div class="col-xs-5 productDetailQandAWriterDate"></div>';
    					result += '<div class="col-xs-12 productDetailQandAContent">Q & A가 없습니다.</div>';
    					result += '</div>';
    					$('#productDetailQandAMoreButton').hide();
    				}
     				else {
    					for(let i=0; i<data.length; i++) {
    						//해당 작가가 아니라면
    						if(data[i].level == 1) {
    							result += '<div class="row productDetailQandA">';
    							result += '<div class="col-xs-2 productDetailQandAStatus">'+data[i].qa_board_status+'</div>';
        						result += '<div class="col-xs-5 productDetailQandAWriter">'+data[i].user_name+'</div>';
        						result += '<div class="col-xs-5 productDetailQandAWriterDate">'+jsonDateConverter(data[i].qa_board_date)+'</div>';
        						result += '<div class="col-xs-10 productDetailQandAContent">'+data[i].qa_board_content+'</div>';
        						result += '</div>';
    						}
    						else {
    							result += '<div class="row productDetailQandAResponse">';
    							result += '<div class="col-xs-2 productDetailQandAStatus">답변</div>';
        						result += '<div class="col-xs-5 productDetailQandAWriter">'+data[i].user_name+'</div>';
        						result += '<div class="col-xs-5 productDetailQandAWriterDate">'+jsonDateConverter(data[i].qa_board_date)+'</div>';
        						result += '<div class="col-xs-10 productDetailQandAContent">'+data[i].qa_board_content+'</div>';
        						result += '</div>';
    						}
    					}
     				}
     				$('#productDetailQandAAjaxResult').val(0);
    				$('#productDetailQandAAjaxResult').append(result);
    				$('#qa_current_page').val(Number(qaCurrent)+3);
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
     				if(data.length == 0) {
    					result += '<div class="row productDetailBuyReview">구매후기가 없습니다.';
						result += '</div>';
    					$('#productDetailBuyReviewMoreButton').hide();
    				} 
     				else {
    					for(let i=0; i<data.length; i++) {
    						result += '<div class="row productDetailBuyReview">';
							result += '<div class="col-xs-12 col-sm-12 col-md-3 productDetailBuyReviewImg">';
							if(data[i].buy_review_image_loc != null) {
								result += '<img src="'+data[i].buy_review_image_loc+'" alt="구매후기 이미지">';
							}
							result += '</div>';
							result += '<div class="col-xs-12 col-sm-12 col-md-9 productDetailBuyReviewOption">'+data[i].order_add_option+'</div>';
							result += '<div class="col-xs-12 col-sm-12 col-md-9 productDetailBuyReviewContent">'+data[i].buy_review_content+'</div>';
							result += '<div class="col-xs-4 col-sm-4 col-md-3 productDetailBuyReviewScore">';
							for(let j=1; j<=data[i].buy_review_score; j++) {
								result += '★';
							}
							result += '</div>';
							result += '<div class="col-xs-4 col-sm-4 col-md-3 productDetailBuyReviewWriter">'+data[i].user_name+'</div>';
							result += '<div class="col-xs-4 col-sm-4 col-md-3 productDetailBuyReviewWriteDate">'+jsonDateConverter(data[i].buy_review_date)+'</div>';
							result += '</div>';
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
        
        function cookieInsert() {
        	let formdata = $('#productDetailResultForm').serializeArray();
        	$.ajax({
    			url:'/ajaxCookieInsert'
    			,contentType: 'application/json; charset=utf-8'
    			,data: JSON.stringify({formData:formdata})
    			,type: 'POST'
    			,dataType: "text"
    			,success: function(data) {
					console.log('쿠키등록 성공');
					alert("장바구니에 등록되었습니다.");
				}
    			,error:function(data){
					console.log('쿠키등록 실패');
					alert("장바구니 등록에 실패했습니다.");
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
        	}
        }
        
        function productRemove() {
        	let listNo = $('#list_no').val();
        	if(confirm("상품을 삭제하시겠습니까?")) {
        		$.ajax({
        			url:"/productDetail/ajaxProductDelete"
        			,contentType: "application/json; charset=utf-8"
        			,data: JSON.stringify({list_no:listNo})
        			,dataType: "text"
        			,type: "POST"
        			,success: function(data) {
        				alert(data);
        				if(data == "삭제 성공") {
        					location.href="/";
        				}
        				else if(data == "로그인부터 하세요") {
        					location.href="/login";
        				}
        			}
        			,error: function(data) {
        				alert("알수없는 오류");
        			}
        		});
        	}
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
                <input type="button" class="btn btn-default" value="상품 삭제" id="productRemove">
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
                    	<c:forEach var="orderList" items="${orderList }"  varStatus="i">
                    		<div class="customerOrderBox productDetailAsideBlock">
                        		<div class="col-xs-12 customerOrderTitle"><c:out value="${orderList.order_name }"></c:out></div>
                        		<div class="col-xs-12 customerOrderValue">
                        			<c:if test="${orderList.order_option eq 'picture' }">
                        				<img src="${orderList.order_value }" alt="주문사진">
                        			</c:if>
                        			<c:if test="${orderList.order_option eq 'color' }">
                        				<c:out value="색상 : ${orderList.order_value }"></c:out>
                        				<div id="customerOrderColorBox"></div>
                        			</c:if>
                        			<c:if test="${orderList.order_option eq 'text' }">
                        				<c:out value="${orderList.order_value }"></c:out>
                        			</c:if>
                        		</div>
                    		</div>
                   	 	</c:forEach>
                    </c:if>
                    <div class="productDetailLine">
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
                        <button type="button" class="asideBasket">장바구니</button>
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