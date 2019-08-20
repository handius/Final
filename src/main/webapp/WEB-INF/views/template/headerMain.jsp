<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Barriecito&display=swap" rel="stylesheet">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<style>
    /* 위 */
    .menu-wrap {
        height: 120px;
        width: 100%;
        position: fixed;
    }
    .menu-wrap a {
        color: white;
    }
    .mainlogo > a {
        font-family: 'Barriecito', cursive;
        font-size: 4em;
        padding: 0 30px 0 10px;
        color: #333333;
    }
    /**/
    .menu-wrap-row a {
        color: #333333;
    }
    .menu-wrap-row a.categoryfontcolor {
        color: #7C7877;
    }
    .menu-wrap-row {
        height: 120px;
        width: 100%;
        position: fixed;
        background-color: white;
        border-bottom: 1px solid #D9D4CF;
    }
    /**/
    .mainlogo > a:hover {
        text-decoration: none;
        color: #333333;
    }
    #mainmenu > div {
        height: 100px;
        padding: 10px;
    }
    #mainmenu1 > a {
        font-size: 16px;
        margin: 0 20px;
    }
    #mainmenu2 {
        padding: 50px 0;
        float: right;
        margin-right: 20px;
    }
    #mainmenu2 > a {
        font-size: 1em;
        margin: 0 5px;
    }
    #mainmenu1 {
        float: left;
        padding: 50px 0;
    }
    .mainlogo {
        float: left;
        padding: 20px;
    }
    .categoryfontcolor {
        padding-bottom: 10px;
        transition-duration: 0.3s;
    }
    .categoryfontcolor:hover {
        text-decoration: none;
        border-bottom: 5px solid #444444;
    }
    #mallmenu {
        z-index: 2;
    }
    .menuhoversearch {
        position: fixed;
        height: 400px;
        width: 100%;
        background-color: white;
        border-bottom: 1px solid #D9D4CF;
        z-index: 1;
        padding: 225px 10% 0 10%;
    }
    .menuhoversearch > form {
        text-align: center;
    }
    #searchsubmitbutton {
        border: 0px;
        background-color: white;
        font-size: 40px;
    }
    #searchsubmitbutton:hover {
        background-color: white;
    }
    .searchtextinput {
        margin-left: 30%;
        width: 90%;
        border: 0px;
        padding: 10px;
        font-size: 18px;
        border-bottom: 3px solid #333333;
    }
    .searchtextinput:focus {
      outline: none;
    }
    @media(max-width: 1140px) {
    #mallmenu {
        width: 1140px;
    } 
    }
</style>
</head>
<body>
    <div id="mallmenu" class="menu-wrap-row">
            <div id="mainmenu2">
                <a class="categoryfontcolor" href="/login">로그인</a>
                <a class="categoryfontcolor" href="/join">회원가입</a>
                <a class="categoryfontcolor" href="#">마이페이지</a>
                <a class="categoryfontcolor" id="searchcategoryhover" href="#"><span class="glyphicon glyphicon-search"></span></a>
            </div>
            <div>
            <div class="mainlogo">
                <a href="/">Handius</a>
            </div>
            <div id="mainmenu1">
                <a class="categoryfontcolor" href="/orderList?order=0">완제품</a>
                <a class="categoryfontcolor" href="/orderList?order=1">주문제작</a>
                <a class="categoryfontcolor" href="#">커뮤니티</a>
                <a class="categoryfontcolor" href="#">작가페이지</a>
            </div>
            </div>
    </div>
    <div class="menuhoversearch">
       <form action="/orderList" method="post">
        <div class="form-group">
          <div class="col-xs-6 col-xs-offset-1">
          	<input type="hidden" name="searchType" value="title">
            <input type="text" class="searchtextinput" name="searchData" placeholder="검색어를 입력하세요." autocomplete=off>
          </div>    
          <div class="col-xs-2">
              <button type="submit" id="searchsubmitbutton"><span class="glyphicon glyphicon-search"></span></button>
          </div> 
        </div>
       </form>
    </div>
    <script>
        $('#searchcategoryhover').mouseover(function() {
            $('.menuhoversearch').slideDown();
        });
        $('.menuhoversearch').mouseleave(function() {
            $('.menuhoversearch').slideUp();
        });
        $('.menuhoversearch').hide();
    </script>
</body>
</html>