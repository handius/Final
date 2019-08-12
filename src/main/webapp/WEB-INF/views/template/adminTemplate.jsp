<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>test</title>
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
    body {
        background-color: #F0E5DE;
    }
    .admin_top {
        background-color: #333333;
        height: 50px;
        color: #D9D4CF;
    }
    .admin_mid {
        height: 100%;
        padding: 0;
    }
    .admin_category_wrap {
        position: fixed;
        left: 9px;
        top: 58px;
        height: auto;
        border: 1px solid #D9D4CF;
        border-radius: 5px;
        width: inherit;
        width: 252px;
        background-color: white;
    }
    .admin_category_parent {
        border-bottom: 1px solid #D9D4CF;
        padding: 10px;
        text-align: center;
        font-size: 16px;
        width: 250px;
        color: #333333;
    }
    .admin_category_child {
        border-bottom: 1px solid #D9D4CF;
        width: 250px;
        text-align: center;
        padding: 20px 0 13px;
        background-color: #fffbf7;
    }
    .admin_content_wrap {
        background-color: white;
        border: 1px solid #D9D4CF;
        border-radius: 5px;
        width: 1620px;
        padding: 10px 30px;
        margin-top: 8px;
        margin-left: 270px;
    }
    .pcateg4, .categ4 {
        border-bottom: 0px;
    }
    .categ4 {
        border-top: 1px solid #D9D4CF;
    }  
.moveanimation1 {
    -webkit-transition-duration: 0.1s;  
    -webkit-transform:  translateY(-50px);
    -webkit-transition-timing-function: ease-in;
}  
.moveanimation2 {
    -webkit-transition-duration: 0.1s;  
    -webkit-transform:  translateY(0px);
    -webkit-transition-timing-function: ease;
}
    .admintopright > span {
        float: right;
        padding: 13px;
        text-align: right;
    }
    .admintopnavleft > p {
        padding: 10px 0;
        font-size: 1.5em;
    }
    .admin_category_child > p > a {
        color: #7C7877;
    }
</style>
</head>
<body>
  <div class="adminAllWrapper">
    <div class="admin_top">
        <div class="col-xs-3 admintopnavleft">
            <p>Admin Page</p>
        </div>
           <div class="admintopright">
            <span>로그아웃</span>
            <span>내 쇼핑몰 가기</span>
           </div>
    </div>
    <div class="admin_mid">
          <div class="admin_category_wrap">
             <div class="admin_category_parent">
                 <h3>Admin Menu</h3>
             </div>
            <div class="admin_category_parent pcateg1">화면
            </div>
                <div class="admin_category_child categ1">
                    <p><a href="/admin">회원 관리</a></p>
                </div>
                
            <div class="admin_category_parent pcateg2">통계분석
            </div>
              <div class="admin_category_child categ2">
                  <p><a href="/admin/searchText">검색어 분석</a></p>
                  <p><a href="/admin/analnewmember">신규회원 분석</a></p>
                  <p><a href="/admin/analproduct">판매순위 분석</a></p>
              </div>
                
            <div class="admin_category_parent pcateg3">메인
            </div>
                <div class="admin_category_child categ3">
                    <p><a href="/admin/mainset">메인페이지 관리</a></p>
                </div>
                
            <div class="admin_category_parent pcateg4">운영
            </div>
                <div class="admin_category_child categ4">
                    <p><a href="/admin/qna">1 : 1 문의</a></p>
                    <p><a href="#">욕설 관리</a></p>
                </div>
          </div>
          <div class="admin_content_wrap gridpaddingzero">
            <div class="admin_main_content"><tiles:insertAttribute name="body"/></div>
          </div>
          <div id="senddata" data-categ="${admin_category}"></div>
    </div>
  </div>
<script>
    $('.admin_category_child').hide();
    
    var categ_data = $('#senddata').data('categ');
    if(categ_data == 'member') {
    	$('.categ1').show();
    } else if(categ_data == 'anal') {
    	$('.categ2').show();
    } else if(categ_data == 'mainset') {
    	$('.categ3').show();
    } else if(categ_data == 'operate') {
    	$('.categ4').show();
    }
    
    $('.pcateg1').on('click', function() {
        $('.categ1').slideToggle('fast');
    })
    $('.pcateg2').on('click', function() {
        $('.categ2').slideToggle('fast');
    })
    $('.pcateg3').on('click', function() {
        $('.categ3').slideToggle('fast');
    })
    $('.pcateg4').on('click', function() {
        $('.categ4').slideToggle('fast');
    })
    
        $(window).scroll(function() {
            var height = $(document).scrollTop();
            if(height > 50) {
                $('.admin_category_wrap').removeClass('moveanimation2');
                $('.admin_category_wrap').addClass('moveanimation1');
            } else if (height < 50) {
                $('.admin_category_wrap').removeClass('moveanimation1');
                $('.admin_category_wrap').addClass('moveanimation2');
            }
        });
</script>
</body>
</html>