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
<!-- 추가 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<style>
    .mainsettemplate {
        font-family: 'Comfortaa', '맑은 고딕', cursive;
        color: #7C7877;
        margin: auto;
        margin-bottom: 80px;
    }
    .maintemplatetitle {
        padding: 30px;
        text-align: center;
        font-size: 4em;
        margin-top: 30px;
        border-bottom: 1px solid #D9D4CF;
    }
    .mainimgtemplate {
        margin-top: 50px;
    }
    .mainproductslide {
        margin-top: 30px;
        width: 740px;
        height: 600px;
    }
    .mainproductname {
        padding: 10px;
        font-size: 1.5em;
        text-align: center;
    }
    .mainproductname > h4 {
        font-size: 1em;
        margin: 40px 0 20px;
        font-size: 40px;        
    }
    .gotopicon > img {
        position: fixed;
        z-index: 1;
        bottom: 50px;
        right: 50px;
        height: 100px;
        width: 100px;
        cursor: pointer;
        border: 1px solid #7C7877;
        border-radius: 50px;
        padding: 28px;
        background-color: white;
    }
    .showmoreproduct {
    	margin: 40px;
    	text-align: center;
    }
    .showmoreproduct > h4 > a {
    	color: #7C7877;
        font-size: 2em;
    }
    .mainimgsize {
        width: 100%;
    }
    .marginbot {
        margin-bottom: 50px;
    }
    .padding5per {
        padding: 0 5%;
    }
    
    /*swiper*/
    
    .swiper-container {
      width: 100%;
      height: 100%;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    .swiper-pagination-bullet {
      width: 20px;
      height: 20px;
      text-align: center;
      line-height: 20px;
      font-size: 12px;
      color:#D9D4CF;
      opacity: 1;
      background: #D9D4CF;
    }
    .swiper-pagination-bullet-active {
      color:#ABD0CE;
      background: #ABD0CE;
    }
.swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
.swiper-slide a {
	width: 100%;
}
</style>
</head>
<body>
  <!-- Swiper -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
  	  <c:forEach var="i" items="${mainimglist }" varStatus="status">
    	<c:if test="${i.main_view_no == 23 }">
    	  <div class="swiper-slide">
    	    <a href="${i.main_image_link }">
    	 	  <img class="mainimgsize" src="${i.main_image_path }" alt="${status.count }"/>
    	 	</a>
    	  </div>
    	</c:if>
      </c:forEach>
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
  </div>

<div class="mainsettemplate">
  <c:forEach var="i" items="${mainviewlist }">
    <c:if test="${i.main_view_no == 2 && i.main_view_use == 1 }">
      <div class="maintemplatetitle">${i.main_view_name }</div>
      <!-- Swiper -->
	  <div class="swiper-container">
	    <div class="swiper-wrapper">
	      <c:forEach var="i" items="${product1 }">
	      <div class="swiper-slide">
	        <div class="row">
		       <a href="/productDetail/${i.list_no }">
			       <img class="mainproductslide" src="${i.list_image_loc }" alt="${i }">
		       </a>
		       <div class="mainproductname"><h4><c:out value="${i.list_title }"/></h4></div>
		       <div class="mainproductname marginbot"><c:out value="${i.list_base_price }"/>￦</div>
	        </div>
	      </div>
	      </c:forEach>
	    </div>
	    <!-- Add Pagination -->
	    <div class="swiper-pagination"></div>
	  </div>
    </c:if>
  </c:forEach>
</div>

<div class="mainimgtemplate">
  <c:forEach var="i" items="${mainimglist }">
    <c:if test="${i.main_view_no == 24}">
      <div class="swiper-slide">
    	<a href="${i.main_image_link }">
      	  <img class="mainimgsize" src="${i.main_image_path }" alt="5"/>
        </a>
      </div>
    </c:if>
  </c:forEach>
</div>

<div class="mainsettemplate">
  <c:forEach var="i" items="${mainviewlist }">
    <c:if test="${i.main_view_no == 4 && i.main_view_use == 1 }">
      <div class="maintemplatetitle">${i.main_view_name }</div>
      <!-- Swiper -->
	  <div class="swiper-container">
	    <div class="swiper-wrapper">
	      <c:forEach var="i" items="${product2 }">
	      <div class="swiper-slide">
	        <div class="row">
		       <a href="/productDetail/${i.list_no }">
			       <img class="mainproductslide" src="${i.list_image_loc }" alt="${i }">
		       </a>
		       <div class="mainproductname"><h4><c:out value="${i.list_title }"/></h4></div>
		       <div class="mainproductname marginbot"><c:out value="${i.list_base_price }"/>￦</div>
	        </div>
	      </div>
	      </c:forEach>
	    </div>
	    <!-- Add Pagination -->
	    <div class="swiper-pagination"></div>
	  </div>
    </c:if>
  </c:forEach>
</div>

<div class="mainsettemplate">
  <c:forEach var="i" items="${mainviewlist }">
    <c:if test="${i.main_view_no == 5 && i.main_view_use == 1 }">
      <div class="maintemplatetitle">${i.main_view_name }</div>
      <!-- Swiper -->
	  <div class="swiper-container">
	    <div class="swiper-wrapper">
	      <c:forEach var="i" items="${product3 }">
	      <div class="swiper-slide">
	        <div class="row">
		       <a href="/productDetail/${i.list_no }">
			       <img class="mainproductslide" src="${i.list_image_loc }" alt="${i }">
		       </a>
		       <div class="mainproductname"><h4><c:out value="${i.list_title }"/></h4></div>
		       <div class="mainproductname marginbot"><c:out value="${i.list_base_price }"/>￦</div>
	        </div>
	      </div>
	      </c:forEach>
	    </div>
	    <!-- Add Pagination -->
	    <div class="swiper-pagination"></div>
	  </div>
    </c:if>
  </c:forEach>
</div>

    <div class="gotopicon">
        <img alt="icon" src="/resources/image/upbutton.png">
    </div>
    
<script>
	

    var swiper = new Swiper('.swiper-container', {
      spaceBetween: 30,
      centeredSlides: true,
      autoplay: {
        delay: 5000,
        disableOnInteraction: false,
      },
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });

    $('.gotopicon').on('click', function() {
        $(window).scrollTop(0);
    })
</script>
</body>
</html>