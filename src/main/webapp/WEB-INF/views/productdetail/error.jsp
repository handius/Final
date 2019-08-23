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
        #errorImg {
            width: 100%;
            text-align: center;
            height: 500px;
            font-size: 450px;
            padding-top: 50px;
        }
        
        #errorMessage{
            width: 100%;
            font-size: 60px;
            text-align: center;
            padding-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="glyphicon glyphicon-remove-circle" id="errorImg"></div>
        <div id="errorMessage"><c:out value="${error }"></c:out></div>
    </div>
</body>
</html>