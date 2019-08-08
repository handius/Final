<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Main</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
<style>
    .item > .maintopslide {
        max-width: none !important;
        height: 620px !important;
    }
    .mainsettemplate {
        font-family: 'Comfortaa', cursive;
        color: #7C7877;
        height: 600px;
        width: 1140px;
        margin: auto;
        margin-top: 20px;
    }
    .mainsettemplate > .maintemplatetitle {
        padding: 30px;
        text-align: center;
        font-size: 2em;
        border-bottom: 1px solid #D9D4CF;
    }
    .mainimgtemplate {
        margin-top: 20px;
    }
    .mainproductslide {
        width: 100%;
    }
    .mainsettemplate > .row {
        padding-top: 60px;
    }
    .mainproductname {
        padding: 10px;
        text-align: center;
    }
    .gotopicon {
        background-color: white;
        border: 1px solid #D9D4CF;
        border-radius: 50px;
        padding: 7px 10px 10px 10px;
        position: fixed;
        z-index: 1;
        bottom: 50px;
        right: 50px;
        width: 35px;
        height: 35px;
        color: #7C7877;
        cursor: pointer;
    }
</style>
</head>
<body>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="/resources/image/1.jpg" alt="1">
    </div>

    <div class="item">
      <img src="/resources/image/2.jpg" alt="2">
    </div>

    <div class="item">
      <img src="/resources/image/3.jpg" alt="3">
    </div>

    <div class="item">
      <img src="/resources/image/4.jpg" alt="4">
    </div>
  </div>
</div>

<div class="mainsettemplate">
    <div class="maintemplatetitle">Second</div>
        <div class="row">
         <div class="col-md-4">
          <img class="mainproductslide" src="/resources/image/color1.jpg" alt="1">
          <div class="mainproductname"><h4>product1</h4></div>
          <div class="mainproductname">product price & content</div>
         </div>
         <div class="col-md-4">
          <img class="mainproductslide" src="/resources/image/color2.jpg" alt="2">
          <div class="mainproductname"><h4>product2</h4></div>
          <div class="mainproductname">product price & content</div>
         </div>
         <div class="col-md-4">
          <img class="mainproductslide" src="/resources/image/color3.jpg" alt="3">
          <div class="mainproductname"><h4>product3</h4></div>
          <div class="mainproductname">product price & content</div>
         </div>
        </div>
    </div>

<div class="mainimgtemplate">
      <img src="/resources/image/2.jpg" alt="2">
</div>
<div class="mainsettemplate">
    <div class="maintemplatetitle">fourth</div>
        <div class="row">
         <div class="col-md-4">
          <img class="mainproductslide" src="/resources/image/color1.jpg" alt="1">
          <div class="mainproductname"><h4>product1</h4></div>
          <div class="mainproductname">product price & content</div>
         </div>
         <div class="col-md-4">
          <img class="mainproductslide" src="/resources/image/color2.jpg" alt="2">
          <div class="mainproductname"><h4>product2</h4></div>
          <div class="mainproductname">product price & content</div>
         </div>
         <div class="col-md-4">
          <img class="mainproductslide" src="/resources/image/color3.jpg" alt="3">
          <div class="mainproductname"><h4>product3</h4></div>
          <div class="mainproductname">product price & content</div>
         </div>
        </div>
</div>
<div class="mainsettemplate">
    <div class="maintemplatetitle">Fifth</div>
        <div class="row">
         <div class="col-md-4">
          <img class="mainproductslide" src="/resources/image/color1.jpg" alt="1">
          <div class="mainproductname"><h4>product1</h4></div>
          <div class="mainproductname">product price & content</div>
         </div>
         <div class="col-md-4">
          <img class="mainproductslide" src="/resources/image/color2.jpg" alt="2">
          <div class="mainproductname"><h4>product2</h4></div>
          <div class="mainproductname">product price & content</div>
         </div>
         <div class="col-md-4">
          <img class="mainproductslide" src="/resources/image/color3.jpg" alt="3">
          <div class="mainproductname"><h4>product3</h4></div>
          <div class="mainproductname">product price & content</div>
         </div>
        </div>
</div>
    <div class="gotopicon">
        <span class="glyphicon glyphicon-chevron-up"></span>
    </div>
<script>
    $('.gotopicon').on('click', function() {
        $(window).scrollTop(0);
    })
</script>
</body>
</html>