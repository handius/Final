<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<h5><a href="/controller/sell/book">책</a></h5>
			</div>
			<div class="col-md-2">
				<h5><a href="/controller/sell/cup">머그컵</a></h5>
			</div>
			<div class="col-md-2">
				<h5><a href="/controller/sell/table">가구</a></h5>
			</div>
			<div class="col-md-2">
				<h5><a href="/controller/sell/accessary">악세사리</a></h5>
			</div>
			<div class="col-md-2">
				<h5><a href="/controller/sell/handmade">공예</a></h5>
			</div>
			<div class="col-md-2">
				<h5><a href="/controller/sell/anything">기타</a></h5>
			</div>
		</div>
	</div>
	<div>
		
		<form action="" method="get" id="frm">
			<c:forEach var="hash" items="${hashList }">
				<label>
					<c:out value="${hash }"></c:out>
					<input type="checkbox" name="hashTag" value="${hash }">
				</label>
			</c:forEach>
			<input type="checkbox" id="hasStock" name="hasStock" value="1">
			<label for="searchType">필터 :</label>
			<select name="searchType" id="searchType">
				<option value="title">제목</option>
				<option value="aritst">작성자</option>
				<option value="product">상품명</option>
			</select>
			<input type="text" id="searchData" name="searchData">
			<input type="submit" value="검색">
			<input type="reset" value="취소">
		</form>
	</div>
	<div class="container"> 
	 	<div class="row">
	 		<c:forEach var="item" items="${list }">
		    	<div class="col-sm-6 col-md-3">
		      		<div class="thumbnail">
		      			<c:forEach var="image" items="${item.list_image_loc }" end="1">
		      				<img src="${image }" alt="이미지가 없습니다.">
		      			</c:forEach>
		          		<div class="caption">
		            		<h3>${item.list_title } </h3>
		            		<p>${item.list_artist }</p>
		      			</div>
		      		</div>
		   		</div>
	   		</c:forEach>
	 	</div>  
	</div>
	
	<c:if test="${PageDTO.startblock>1 }">
		<a href="?currpage=${PageDTO.startblock-1 }">이전</a>
	</c:if>
	<c:forEach var="i" begin="${PageDTO.startblock }" end="${PageDTO.endblock }">
		<c:if test="${i==PageDTO.currpage }">
			<c:out value="${i }"></c:out>
		</c:if>
		<c:if test="${i!=PageDTO.currpage }">
			<a href="?currpage=${i }"><c:out value="${i}"></c:out></a>
		</c:if>
	</c:forEach>
	<c:if test="${PageDTO.endblock < PageDTO.totalpage }">
		<a href="?currpage=${PageDTO.endblock+1}">▶</a> 
	</c:if>
</body>
</html>