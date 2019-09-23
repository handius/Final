<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>Handius :: 우리가 만드는 핸드메이드 쇼핑몰</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	#avoidHeader {
		height: 120px;
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
    
    .mobilegotopicon > img {
        position: fixed;
        z-index: 20;
        bottom: 100px;
        right: 50px;
        height: 100px;
        width: 100px;
        cursor: pointer;
        border: 1px solid #7C7877;
        border-radius: 50px;
        padding: 28px;
        background-color: white;
    }
</style>
<script>
	$(document).ready(function(){
    	$('.gotopicon').on('click', function() {
        	$(window).scrollTop(0);
    	});
    	$('.mobilegotopicon').on('click', function() {
        	$(window).scrollTop(0);
    	});
    	
    	var mobileKeyWords = new Array('iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'Windows CE;', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson', 'Mobile', 'Symbian', 'Opera Mobi', 'Opera Mini', 'IEmobile');
    	for (var word in mobileKeyWords) {
    		if (navigator.userAgent.match(mobileKeyWords[word]) != null) {
    			let url = window.document.location.href;
    			if(url == 'http://localhost:8080/' || url == 'http://192.168.137.1:8080/') {
    				window.location.href = "/mobile";
    			}
    			break;
    		}
    	}
	});
</script>
</head>
<body>
	<c:set var="userAgentInfo" value="${header['User-Agent']}" />
	<c:choose>
		<c:when test="${fn:contains(userAgentInfo, 'Windows') }">
			<c:choose>
				<c:when test="${ifpagemain == 1 }">
					<div id="header"><tiles:insertAttribute name="header"/></div>
				</c:when>
				<c:otherwise>
					<div id="headerMain"><tiles:insertAttribute name="headerMain"/></div>
					<div id="avoidHeader"></div>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<div id="headerMain"><tiles:insertAttribute name="mobileHeader"/></div>
			<div id="avoidHeader"></div>
		</c:otherwise>
	</c:choose>
	<div id="main"><tiles:insertAttribute name="body"/></div>
	<c:choose>
		<c:when test="${fn:contains(userAgentInfo, 'Windows') }">
			<div class="gotopicon">
        		<span class="glyphicon glyphicon-chevron-up"></span>
    		</div>
			<div id="footer"><tiles:insertAttribute name="footer"/></div>
		</c:when>
		<c:otherwise>
			<div class="mobilegotopicon">
        		<img alt="icon" src="/resources/image/upbutton.png">
    		</div>
			<div id="mobileFooter"><tiles:insertAttribute name="mobileFooter"/></div>
		</c:otherwise>
	</c:choose>
</body>
</html>