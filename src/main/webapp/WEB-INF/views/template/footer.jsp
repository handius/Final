<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>footer</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Barriecito&display=swap" rel="stylesheet">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <style>
        #mallfooter {
            height: 190px;
            background-color: #7C7877;
            color: #F0E5DE;
            padding: 20px;
        }
        .footerfontcolormenu {
            padding-bottom: 20px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            border-bottom: 1px solid #F0E5DE;
        }
        .footerfontcolormenu span {
            padding: 0 20px;
        }
        .footerbottom {
            padding: 20px;
        }
        .footerbottom div {
            padding: 10px 0;
        }
        .footerbottom div span {
            padding-right: 20px;
            margin-right: 10px;
            border-right: 1px solid;
        }
        #footerstylediv {
            background-color: #333333;
        }
        #footerstylediv div {
            padding: 14px;
            width: 100%;
            text-align: center;
            color: white;
        }
    </style>
</head>
<body>
    <div id="mallfooter">
        <div class="footerfontcolormenu">
            <span>이용약관</span>
            <span>개인정보처리방침</span>
            <span>청소년보호정책</span>
            <span>공지사항</span>
        </div>
        <div class="footerbottom">
           <div>
            <span>대표전화 : 1544 - 3333</span>
            팩스 : 031 - 333 - 3333 
           </div>
           <div>
            <span>서울 종로구 종로 69 YMCA빌딩 7층</span>
            Team Handius
           </div>
        </div>
    </div>
    <div id="footerstylediv">
        <div>
            COPYRIGHT © 2019-2019 HANDIUS ALL RIGHTS RESERVED.
        </div>
    </div>
</body>
</html>