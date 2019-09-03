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
    .item > a > img {
        max-width: none !important;
        height: 720px !important;
    }
    .mainsettemplate {
        font-family: 'Comfortaa', '맑은 고딕', cursive;
        color: #7C7877;
        height: 720px;
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
    .showmoreproduct {
    	margin: 40px;
    	text-align: center;
    }
    .showmoreproduct > h4 > a {
    	color: #7C7877;
    }
    #myCarousel {
    	height: 720px;
    	background-color: #7C7877;
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
  <c:forEach var="i" items="${mainimglist }" varStatus="status">
    <c:if test="${i.main_view_no == 1 }">
      <c:if test="${status.count == 1 }">
      	<div class="item active">
      	  <a href="${i.main_image_link }"><img src="${i.main_image_path }" alt="${i.main_image_path }"></a>
    	</div>
      </c:if>
      <c:if test="${status.count != 1 }">
      	<div class="item">
      	  <a href="${i.main_image_link }"><img src="${i.main_image_path }" alt="${status.count }"></a>
    	</div>
      </c:if>
    </c:if>
  </c:forEach>
  </div>
</div>

<div class="mainsettemplate">
  <c:forEach var="i" items="${mainviewlist }">
    <c:if test="${i.main_view_no == 2 && i.main_view_use == 1 }">
      <div class="maintemplatetitle">${i.main_view_name }</div>
	    <div class="row">
          <c:forEach var="i" items="${product1 }">
	         <div class="col-xs-4">
	          <a href="/productDetail/${i.list_no }"><img class="mainproductslide" src="${i.list_image_loc }" alt="${i }"></a>
	          <div class="mainproductname"><h4>${i.list_title }</h4></div>
	          <div class="mainproductname">${i.list_base_price }￦</div>
	         </div>
          </c:forEach>
	    </div>
    </c:if>
  </c:forEach>
</div>

<div class="mainimgtemplate">
  <c:forEach var="i" items="${mainimglist }">
    <c:if test="${i.main_view_no == 3}">
      <div class="row">
      	<div class="col-xs-12">
      	  <img src="${i.main_image_path }" alt="2">
      	</div>
      </div>
    </c:if>
  </c:forEach>
</div>

<div class="mainsettemplate">
  <c:forEach var="i" items="${mainviewlist }">
    <c:if test="${i.main_view_no == 4 && i.main_view_use == 1 }">
      <div class="maintemplatetitle">${i.main_view_name }</div>
	    <div class="row">
          <c:forEach var="i" items="${product2 }">
	         <div class="col-xs-4">
	          <a href="/productDetail/${i.list_no }"><img class="mainproductslide" src="${i.list_image_loc }" alt="${i }"></a>
	          <div class="mainproductname"><h4>${i.list_title }</h4></div>
	          <div class="mainproductname">${i.list_base_price }￦</div>
	         </div>
          </c:forEach>
	    </div>
    </c:if>
  </c:forEach>
</div>
<div class="mainsettemplate">
  <c:forEach var="i" items="${mainviewlist }">
    <c:if test="${i.main_view_no == 5 && i.main_view_use == 1 }">
      <div class="maintemplatetitle">${i.main_view_name }</div>
	    <div class="row">
          <c:forEach var="i" items="${product3 }">
	         <div class="col-xs-4">
	          <a href="/productDetail/${i.list_no }"><img class="mainproductslide" src="${i.list_image_loc }" alt="${i }"></a>
	          <div class="mainproductname"><h4>${i.list_title }</h4></div>
	          <div class="mainproductname">${i.list_base_price }￦</div>
	         </div>
          </c:forEach>
	    </div>
    </c:if>
  </c:forEach>
</div>
    <div class="gotopicon">
        <span class="glyphicon glyphicon-chevron-up"></span>
    </div>
<script>
    $('.gotopicon').on('click', function() {
        $(window).scrollTop(0);
    });
var mobileKeyWords = new Array('iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'Windows CE;', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson', 'Mobile', 'Symbian', 'Opera Mobi', 'Opera Mini', 'IEmobile');
for (var word in mobileKeyWords) {
	if (navigator.userAgent.match(mobileKeyWords[word]) != null) {
		window.location.href = "/mobile";
		break;
	}
}
</script>
</body>
</html>