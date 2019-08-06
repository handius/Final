<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<style>
	.order{
		text-align: center;
	}
	.order h2{
		margin-bottom: 50px;
	}
	#orderMade{
		display: inline-block;
		height: 400px;
		width: 320px;
		border: 1px solid black;
		margin: 0 auto;
		background-color: blue;
	}
	#perfectOrder{
		display: inline-block;
		height: 400px;
		width: 320px;
		border: 1px solid black;
		margin: 0 auto;
		background-color: green;
	}
</style>
</head>
<body>
	<div class="jumbotron">
  		<div class="container">
  			<h1>상품 판매 페이지</h1>
    		<p>상품 판매 페이지</p>
	  	</div>
	</div>
	
	<div class="container">
		<div class="row order">
			<div class="col-md-6">
				<h2>주문 제작품 등록하기</h2>
				<a href="#" id="orderMade"></a>
			</div>
			<div class="col-md-6">
				<h2>완제품 등록하기</h2>
				<a href="/controller/sell/insertPerfectOrder" id="perfectOrder"></a>
			</div>
		</div>
	</div>
</body>
</html>