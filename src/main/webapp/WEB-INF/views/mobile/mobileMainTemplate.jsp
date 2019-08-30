<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Handius :: 우리가 만드는 핸드메이드 쇼핑몰</title>
<style>
	#avoidHeader {
		height: 150px;
	}
</style>
</head>
<body>
	<div id="headerMain"><tiles:insertAttribute name="mobileHeader"/></div>
	<div id="avoidHeader"></div>
	<div id="main"><tiles:insertAttribute name="main"/></div>
	<div id="mobileFooter"><tiles:insertAttribute name="mobileFooter"/></div>
</body>
</html>