<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Comfortaa', '맑은 고딕', cursive;
    }
    #mallmenu {
        position: fixed;
        z-index: 3;
        height: 150px;
        width: 100%;
        background-color: white;
        border-bottom: 1px solid #D9D4CF;
        display: flex;
        justify-content: space-between;
    }
    .mainmenu > a > img {
        height: 150px;
        padding: 35px 40px 35px 10px;
    }
    .categoryfontcolor {
        color: #333333;
        font-size: 3em;
    }
    .mainlogo {
        text-align: center;
        padding: 5px 40px;
    }
    .mainlogo > a {
        font-family: 'Barriecito', cursive;
        font-size: 7em;
        color: #333333;
        text-align: center;
    }
    .menuhoversearch {
        position: fixed;
        height: 350px;
        width: 100%;
        background-color: white;
        border-bottom: 1px solid #D9D4CF;
        z-index: 2;
        padding: 100px 10% 0 10%;
        margin-top: 150px;
    }
    .menuhoversearch > form {
        text-align: center;
    }
    .searchtextinput {
        width: 100%;
        border: 0px;
        padding: 10px;
        font-size: 3em;
        border-bottom: 8px solid #333333;
    }
    .searchtextinput:focus {
      outline: none;
    }
    .searchsubmit {
        width: 210%;
        height: 100%;
    }
    .clickmenuicon {
        margin-top: 150px;
        position: fixed;
        width: 100%;
        background-color: white;
        border-bottom: 1px solid #D9D4CF;
        z-index: 2;
        display: flex;
        padding-top: 40px;
        flex-direction: column;
        justify-content: space-between;
    }
    .menucategory {
        width: 100%;
        text-align: center;
        font-size: 3em;
        padding: 40px;
    }
    .menucategory a {
        color: #333333;
    }
    .sessioninfo {
        display: flex;
        flex-direction: row;
        justify-content: center;
        font-size: 0.8em;
        border-top: 1px solid #D9D4CF;
        margin-top: 70px;
    }
    #searchsubmitbutton {
        border: 0px;
        background-color: white;
        width: 50px;
        height: 80px;
    }
</style>
</head>
<body>
 <nav id="mallmenu">
      <div class="mainlogo">
          <a href="/">Handius</a>
      </div>
      <div class="mainmenu">
          <a><img class="searchicon" alt="searchicon" src="/resources/image/mobilesearch.png"></a>
          <a><img class="menuicon" alt="menuicon" src="/resources/image/mobilemenu.jpg"></a>
      </div>
</nav>
<div class="menuhoversearch">
  <form action="/orderList" method="post">
    <div class="form-group">
      <div class="col-xs-9 col-xs-offset-1">
        <input type="hidden" name="searchType" value="title">
        <input type="text" class="searchtextinput" name="searchData" placeholder="검색어를 입력하세요." autocomplete=off>
      </div>    
      <div class="col-xs-1">
          <button type="submit" id="searchsubmitbutton">
          	<img class="searchsubmit" alt="searchicon" src="/resources/image/mobilesearch.png">
          </button>
      </div> 
    </div>
  </form>
</div>
<div class="clickmenuicon">
    <div class="menucategory">
        <a href="/orderList?order=0">완제품</a>
    </div>
    <div class="menucategory">
        <a href="/orderList?order=1">주문제작</a>
    </div>
    <div class="menucategory">
        <a href="/freeboard">커뮤니티</a>
    </div>
    <div class="menucategory">
        <a href="/artistList">작가페이지</a>
    </div>
    <div class="sessioninfo">
      <sec:authorize access="isAnonymous()">
        <!-- 비로그인, USER -->
        <div class="menucategory">
            <a href="/login">Login</a>
        </div>
        <div class="menucategory">
            <a href="/join">Join</a>
        </div>
      </sec:authorize>
	  <sec:authorize access="hasRole('ROLE_USER')">
        <!-- 로그인(MEMBER) -->
        <div class="menucategory">
            <a href="/myPage">My Page</a>
        </div>
        <div class="menucategory">
            <a href="/login/logout">Logout</a>
        </div>
      </sec:authorize>
	  <sec:authorize access="hasRole('ROLE_SELLER')">
        <!-- 로그인(SELLER) -->
        <div class="menucategory">
            <a href="/sell">Sell Product</a>
        </div>
      </sec:authorize>
    </div>
</div>
<script>
    $('.menuhoversearch').hide();
    $('.searchicon').click(function() {
        $('.clickmenuicon').hide();
        $('.menuhoversearch').slideToggle();
    });
    $('.clickmenuicon').hide();
    $('.menuicon').click(function() {
        $('.menuhoversearch').hide();
        $('.clickmenuicon').slideToggle();
    });
</script>
</body>
</html>