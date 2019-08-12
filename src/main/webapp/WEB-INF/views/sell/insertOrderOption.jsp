<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>
	
	<div class="jumbotron">
	  	<div class="container">
	  		<h1>주문 옵션 입력 페이지</h1>
	    	<p>주문 옵션 입력 페이지</p>
		</div>
	</div>
	<div class="container">
		<div>
			<h1>본 제품은 주문 제작 형식을 가진 물품입니다.</h1>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-3">
				<c:forEach var="image" items="${ListDTO.list_image_loc }" end="1">
					<img src="${image }" alt="이미지가 없습니다.">
				</c:forEach>
			</div>
			<div class="col-md-9">
				<div class="row">
					<span>게시글 제목</span> 
					<span><c:out value="${ListDTO.list_title }"></c:out></span>
				</div>
				<div class="row">
					<span>상품 이름</span> 
					<span><c:out value="${ListDTO.list_product }"></c:out></span>
				</div>
				<div class="row">
					<span>상품 가격</span> 
					<span><c:out value="${ListDTO.list_base_price }"></c:out></span>
				</div>
			</div>
		</div>
		<hr>
		<form action="checking" method="post" enctype="multipart/form-data">
			<div class="row">
				<div>
					<h2>요구 사항</h2>
				</div>
				<div class="row">
					<div class="col-md-7">
						<div>요구 사항 상세</div>
						<div>
							<c:out value="${ListDTO.ordered_content }"/>
						</div>	
					</div>
					<div class="col-md-5">
						<c:forEach var="ord" items="${orders}" varStatus="status">
							<c:out value="${ord.order_option}"/>
							<c:if test="${ord.order_option eq 'picture'}">
								<div><label><c:out value="${ord.order_name }"/></label></div>
								<div><input type="file" name="order_picture" required="required"></div>
								<div><input type="hidden" name="order_count" value="p${status.index }o${ord.list_order_no}"></div>
							</c:if>
							<c:if test="${ord.order_option eq 'color'}">
								<div><label><c:out value="${ord.order_name }"/></label></div>
								<div><input type="color" name="order_color" required="required"></div>
								<div><input type="hidden" name="order_count" value="c${status.index }o${ord.list_order_no}"></div>
							</c:if>
							<c:if test="${ord.order_option eq 'text'}">
								<div><label><c:out value="${ord.order_name }"/></label></div>
								<div><input type="text" name="order_text" required="required"></div>
								<div><input type="hidden" name="order_count" value="t${status.index }o${ord.list_order_no}"></div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<hr>
			<div class="row">
				<input type="hidden" name="member_no" value="${member_no }">
				<input type="hidden" name="list_no" value="${ListDTO.list_no }">
				<input type="reset" value="취소">
				<input type="submit" value="확인">
			</div>
		</form>
		
	</div>
</body>
</html>