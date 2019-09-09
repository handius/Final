<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<style>
	body{
		background-color: white !important;
	}
	.jumbotron{
		margin-top:0px;
		margin-bottom:0px !important;
		background-image: url("/resources/image/flower.jpeg");
		background-size: cover;
		height: 300px;
	}
	.order{
		text-align: center;
		margin-top: 100px;
		margin-bottom: 150px;
	}
	.order h2{
		margin-bottom: 50px;
		font-weight: 550;
		color: #7C7877;
	}
	#orderMade{
		display: inline-block;
		height: 400px;
		width: 320px;
		border: 1px solid silver;
		border-radius: 50px;
		margin: 0 auto;
		background-image: url("/resources/image/orde.jpg");
		background-size: contain;
		background-position: bottom;
		box-shadow: 3px 5px silver;
		transition: 0.3s;
	}
	#orderMade:hover{
		border: 2px solid blue;
		box-shadow: 5px 7px silver;
	}
	#perfectOrder{
		display: inline-block;
		height: 400px;
		width: 320px;
		border: 1px solid silver;
		border-radius: 50px;
		margin: 0 auto;
		background-image: url("/resources/image/perf.jpg");
		background-size: cover;
		box-shadow: 3px 5px silver;
		transition: 0.3s;
	}
	#perfectOrder:hover {
		border: 2px solid green;
		box-shadow: 5px 7px silver;
	}
}
	
</style>
</head>
<body>
	<div class="jumbotron">
  		<div class="container">
  			
	  	</div>
	</div>
	
	<div class="container">
		<div class="row order">
			<div class="col-md-6">
				<h2>주문 제작품 등록하기</h2>
				<a href="/sell/insertOrderMade" id="orderMade"></a>
			</div>
			<div class="col-md-6">
				<h2>완제품 등록하기</h2>
				<a href="/sell/insertPerfectOrder" id="perfectOrder"></a>
			</div>
		</div>
	</div>
</body>
</html>