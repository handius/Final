<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		margin: 0px;
		padding: 0px;
	}
	.category{
		background-color: silver;
	}
	.jumbotron{
		margin-bottom:0 !important;
		background-image: url("/controller/resources/image/back.jpg");
		background-size: cover;
	}
	.paging{
		text-align: center;
	}
	#hashform label{
		padding:10px;
		border: 1px solid silver;
		border-radius: 5px;
		margin: 10px;
	}
	#hashform input[type="checkbox"]{
		display: none;
	}
	#hashplus{
		position: relative;
		margin-bottom: 30px;
	}
	form > hr{
	}
	.searchClass{
		text-align: right;
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<script>
	var hashCounter = 0;
	$(function(){
		loadHash();
	})
	function loadHash(){
		hashCounter = hashCounter+1;
		console.log("loadHash");
		$.ajax({
			url:"/controller/ajaxHashPager?hashPage="+hashCounter
			, type:"GET"
			, dataType:"json"
			, success:function(data){
				var result = "";
				$.each(data, function(index, value){
					result += '<label>'+value+'<input type="checkbox" name="hashTag" value="'+value+'"></label>';
				});
				result += '<input type="button" id="hashplus" onclick="loadHash()" value="+">';
				$('#hashform').html(result);
				
			}
		});
	}
	
</script>	
</head>

<body>
	<c:set var="Stock" value="${param.hasStock }"/>
	<c:set var="Type" value="${param.searchType }"/>
	<c:set var="Data" value="${param.searchData }"/>
	
	<div class="jumbotron">
  		<div class="container">
  			<h1>Hello, world!</h1>
    		<p>상품 구매 페이지</p>
    		<p><a class="btn btn-primary btn-lg">Learn more</a></p>
	  	</div>
	</div>

	<div class="container-fluid category">
		<div class="row">
			<div class="col-md-2">
				<h5><a href="/controller/orderList/book">책</a></h5>
			</div>
			<div class="col-md-2">
				<h5><a href="/controller/orderList/cup">머그컵</a></h5>
			</div>
			<div class="col-md-2">
				<h5><a href="/controller/orderList/table">가구</a></h5>
			</div>
			<div class="col-md-2">
				<h5><a href="/controller/orderList/accessary">악세사리</a></h5>
			</div>
			<div class="col-md-2">
				<h5><a href="/controller/orderList/handmade">공예</a></h5>
			</div>
			<div class="col-md-2">
				<h5><a href="/controller/orderList/anything">기타</a></h5>
			</div>
		</div>
	</div>
	<div class="container">
		
		<form class="form-inline" action="" method="get" role="form">
			<div class="container" id="hashform">
				
			</div>
			<hr>
			<div class="row">
				<div class="col-md-2">
					<label class="checkbox-inline">
						<input type="checkbox" id="hasStock" name="hasStock" value="1">
						<span>품절 품목 제외</span>
					</label>
				</div>
				<div class="col-md4 col-md-offset-6 searchClass">
					<label for="searchType">
						<select name="searchType" id="searchType" class="form-control">
							<option value="title">제목</option>
							<option value="aritst">작성자</option>
							<option value="product">상품명</option>
						</select>
					</label>
					<div class="form-group">
						<input type="text" id="searchData" class="form-control" name="searchData" placeholder="내용을 입력해주세요.">
					</div>
					<div class="form-group">
						<input type="submit" value="검색">
						<input type="reset" value="취소">
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="container"> 
	 	<div class="row">
	 		<c:forEach var="item" items="${list }">
		    	<div class="col-sm-6 col-md-3">
		      		<div class="thumbnail">
		      			<c:forEach var="image" items="${item.list_image_loc }" end="1">
		      				<img src="/controller/resources/image/caat.jpg" alt="이미지가 없습니다.">
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
	<%	
		String[] hashTag = request.getParameterValues("hashTag");
		String hashTagValues = "";
		if(hashTag != null && hashTag.length>0){
			for(int i=0; i<hashTag.length; i++){
				hashTagValues = hashTagValues.concat("hashTag=" + hashTag[i]+"&");
			}
		}
	%>
	
	<div class="row paging">
		<ul class="pagination">
			<c:if test="${PageDTO.startblock>1 }">
				<li><a href="?currpage=${PageDTO.startblock-1 }&<%=hashTagValues %>hasStock=${Stock}&searchType=${Type}&searchData=${Data}">◀</a></li>
			</c:if>
			<c:forEach var="i" begin="${PageDTO.startblock }" end="${PageDTO.endblock }">
				<c:if test="${i==PageDTO.currpage }">
					<li class="active"><a href="#"><c:out value="${i }"></c:out></a></li>
				</c:if>
				<c:if test="${i!=PageDTO.currpage }">
					<li><a href="?currpage=${i }&<%=hashTagValues %>hasStock=${Stock}&searchType=${Type}&searchData=${Data}"><c:out value="${i}"></c:out></a></li>
				</c:if>
			</c:forEach>
			<c:if test="${PageDTO.endblock < PageDTO.totalpage }">
				<li><a href="?currpage=${PageDTO.endblock+1}&<%=hashTagValues %>hasStock=${Stock}&searchType=${Type}&searchData=${Data}">▶</a></li> 
			</c:if>
		</ul>
	</div>
</body>
</html>