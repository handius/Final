<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		margin: 0px;
		padding: 0px;
		background-color: white !important;
	}
	hr{
		border-top: 3px double #D9D4CF !important;
	}
	.jumbotron{
		background-image: url("/resources/image/perfectimage.jpeg");
		background-size: cover;
		height: 400px;
	}
	.orderbox{
		margin-top: 20px;
	}
	.orderbox span{
		font-size: 1.2em;
		font-weight: bolder;
	}
	.title h1{
		font-weight: 500;
		text-align: center;
		margin-bottom: 40px;
		color: #7C7877;
	}
	.bold{
		font-weight: 800;
		font-size: 1.2em;
		background-color: #ABD0CE;
		border-radius: 5px 5px 0px 0px;
		color: #7C7877;
	}
	.align{
		text-align: center;
		border: 1px solid silver;
		padding: 10px;
	}
	.stitle{
		font-weight: 700;
		margin-bottom: 20px;
	}
	#textfrm{
		border: 1px solid silver;
		height: 400px;
		background-color:white;
		padding: 20px;
	}
	.mbox{
		border:1px solid silver;
		margin-bottom: 20px;
		background-color:white;
		padding: 10px;
	}
	.btnfrm{
		text-align: center;
		margin-bottom: 30px;
	}
	.cspan{
		display:inline-block;
		background-color: #ABD0CE;
		border-radius: 5px 5px 0px 0px;
		text-align: center !important;
		padding-top:5px;
		padding-bottom:5px;
		width: 130px;
		color: #7C7877;
	}
	.gspan{
		display: inline-block;
		background-color:white;
		border: 1px solid silver;
		padding: 10px;
		width: 100%;
	}
	.oimage{
		height: 100%;
		width: 100%;
	}
	.ibox{
		height: 300px;
	}
</style>
</head>
<body>
	
	<div class="jumbotron">
	  	<div class="container">
	  		
		</div>
	</div>
	<div class="container">
		<div class="title">
			<h1>본 제품은 주문 제작 형식을 가진 물품입니다.</h1>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-3 ibox">
				<c:forEach var="image" items="${ListDTO.list_image_loc }" end="0">
					<img src="${image }" alt="이미지가 없습니다." class="oimage">
				</c:forEach>
			</div>
			<div class="col-md-9">
				<div class="row orderbox">
					<span class="cspan">게시글 제목</span> 
					<span class="gspan"><c:out value="${ListDTO.list_title }"></c:out></span>
				</div>
				<div class="row orderbox">
					<span class="cspan">상품 이름</span> 
					<span class="gspan"><c:out value="${ListDTO.list_product }"></c:out></span>
				</div>
				<div class="row orderbox">
					<span class="cspan">상품 가격</span> 
					<span class="gspan"><fmt:formatNumber value="${ListDTO.list_base_price }" type="number"/>원</span>
				</div>
			</div>
		</div>
		<hr>
		<form action="checking" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="stitle">
					<h2>요구 사항</h2>
				</div>
				<div class="row">
					<div class="col-md-7">
						<div class="bold align">요구 사항 상세</div>
						<div id="textfrm">
							${ListDTO.ordered_content }
						</div>	
					</div>
					<div class="col-md-5">
						<c:forEach var="ord" items="${orders}" varStatus="status">
							<c:if test="${ord.order_option eq 'picture'}">
								<div class="bold align"><label><c:out value="${ord.order_name }"/></label></div>
								<div class="mbox"><input type="file" name="order_picture" required="required"></div>
								<div><input type="hidden" name="order_count" value="p${status.index }o${ord.list_order_no}"></div>
							</c:if>
							<c:if test="${ord.order_option eq 'color'}">
								<div class="bold align"><label><c:out value="${ord.order_name }"/></label></div>
								<div class="mbox"><input type="color" name="order_color" required="required"></div>
								<div><input type="hidden" name="order_count" value="c${status.index }o${ord.list_order_no}"></div>
							</c:if>
							<c:if test="${ord.order_option eq 'text'}">
								<div class="bold align"><label><c:out value="${ord.order_name }"/></label></div>
								<div class="mbox"><input type="text" name="order_text" required="required"></div>
								<div><input type="hidden" name="order_count" value="t${status.index }o${ord.list_order_no}"></div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<hr>
			<div class="row btnfrm">
				<input type="hidden" name="member_no" value="${member_no }">
				<input type="hidden" name="list_no" value="${ListDTO.list_no }">
				<input type="reset" class="btn" style="background-color: #7c7877; color:white;" value="취소">
				<input type="submit" class="btn" style="background-color: #7c7877; color:white;" value="확인">
			</div>
		</form>
		
	</div>
</body>
</html>