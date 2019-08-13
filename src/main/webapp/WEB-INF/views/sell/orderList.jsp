<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
<style>
	body{
		margin: 0px;
		padding: 0px;
		background-color: rgba(232, 232, 232, 0.8) !important;
	}
	a{
		color: black !important;
	}
	a:hover{
		text-decoration: none !important;
	}
	.line{
		border: 0.5px solid silver;
		width: 100%;
		margin-bottom:10px;
	}
	.category{
		background-color: white;
		border: 1px solid silver;
		height: 50px;
		vertical-align: middle;
		padding-top: 8px;
	}
	.category .row{
		text-align: center;
	}
	.category .row h5{
		font-weight: bolder;
		font-family: 'Comfortaa', cursive;
		font-style: italic;
	}
	.jumbotron{
		margin-top:0px;
		margin-bottom:0px !important;
		background-image: url("/resources/image/banner image.jpeg");
		background-size: cover;
		height: 400px;
	}
	.paging{
		text-align: center;
	}
	#hashform label{
		padding:5px 10px;
		border: 1px solid silver;
		border-radius: 20px;
		margin: 10px;
		background-color: white;
		color:silver;
	}
	#hashform input[type="checkbox"]{
		display: none;
	}
	#hashplus{
		position: relative;
		margin-bottom: 10px;
	}
	form > hr{
	}
	.searchClass{
		text-align: right;
	}
	.listbox .thumbnail{
		height: 405px;
		box-shadow: 8px 5px 3px silver;
	}
	.listbox .thumbnail img{
		height: 220px;
		border: 1px double silver;
		border-radius: 5px;
	}
	.listbox .caption{
		border: 1px solid silver;
		border-radius: 5px;
		margin-top: 5px;
	}
	.listbox .caption h4{
		margin-top: 1px !important;
		font-weight: bold;
	}
	.listbox a{
		font-size: 0.9em;
	}
	#subbtn{
		background-color: transparent;
		border: none;
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
			url:"/ajaxHashPager?hashPage="+hashCounter
			, type:"GET"
			, dataType:"json"
			, success:function(data){
				var result = "";
				$.each(data, function(index, value){
					result += '<label class="hashLabel">#'+value+'<input type="checkbox" name="hashTag" value="'+value+'"></label>';
				});
				result += '<input type="button" id="hashplus" onclick="loadHash()" value="+">';
				$('#hashform').html(result);
				
			}
		});
	}
	$(document).on('click', '.hashLabel', function(){
	
		if($(this).children('input').is(':checked')){
			$(this).css('color', 'black');
		}else{
			$(this).css('color', 'silver');
		}
	})
	
</script>	
</head>

<body>
	<c:set var="Stock" value="${param.hasStock }"/>
	<c:set var="Type" value="${param.searchType }"/>
	<c:set var="Data" value="${param.searchData }"/>
	<c:set var="Order" value="${param.order }"/>
	
		<div class="jumbotron">
	  		<div class="container">
	  				
	  			
		  	</div>
		</div>
	
		<div class="container-fluid category">
			<div class="container">
				<div class="row">
					<div class="col-md-1 col-sm-1">
						<h5><a href="/orderList/book?order=${Order}">Book</a></h5>
					</div>
					<div class="col-md-1 col-sm-1">
						<h5>/</h5>
					</div>
					<div class="col-md-1 col-sm-1">
						<h5><a href="/orderList/cup?order=${Order}">Mugcup</a></h5>
					</div>
					<div class="col-md-1 col-sm-1">
						<h5>/</h5>
					</div>
					<div class="col-md-1 col-sm-1">
						<h5><a href="/orderList/table?order=${Order}">Funiture</a></h5>
					</div>
					<div class="col-md-1 col-sm-1">
						<h5>/</h5>
					</div>
					<div class="col-md-1 col-sm-1">
						<h5><a href="/orderList/accessary?order=${Order}">Accessary</a></h5>
					</div>
					<div class="col-md-1 col-sm-1">
						<h5>/</h5>
					</div>
					<div class="col-md-1 col-sm-1">
						<h5><a href="/orderList/handmade?order=${Order}">HandCraft</a></h5>
					</div>
					<div class="col-md-1 col-sm-1">
						<h5>/</h5>
					</div>
					<div class="col-md-1 col-sm-1">
						<h5><a href="/orderList/anything?order=${Order}">ETC</a></h5>
					</div>
					<div class="col-md-1 col-sm-1">
						<h5>/</h5>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			
			<form class="form-inline" action="" method="get" role="form">
				<div class="container" id="hashform">
					
				</div>
				<div class="line">
				</div>
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
							<input type="hidden" name="order" value="${Order }">
						</div>
						<div class="form-group">
							<button type="submit" id="subbtn"><span class="glyphicon glyphicon-search"></span></button>
						</div>
						
					</div>
				</div>	
			</form>
		</div>
		<div class="container"> 
		 	<div class="row">
		 		<c:forEach var="item" items="${list }">
			    	<div class="col-sm-6 col-md-3 listbox">
			      		<div class="thumbnail">
			      			<c:forEach var="image" items="${item.list_image_loc }" end="1">
			      				<img src="${image }" alt="이미지가 없습니다.">
			      			</c:forEach>
			      		
			          		<div class="caption">
			            		<h4><a href="/checkIsOrdered?no=${item.list_no} ">${item.list_title }</a></h4>
			            		<p>${item.list_date }</p>
			            		<p>작가명 : ${item.list_artist }</p>
			            		<p>상품명 : ${item.list_product }</p>
			            		<p>가격 : ${item.list_base_price }원</p>
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
					<li><a href="?currpage=${PageDTO.startblock-1 }&<%=hashTagValues %>hasStock=${Stock}&searchType=${Type}&searchData=${Data}&order=${Order}">◀</a></li>
				</c:if>
				<c:forEach var="i" begin="${PageDTO.startblock }" end="${PageDTO.endblock }">
					<c:if test="${i==PageDTO.currpage }">
						<li class="active"><a href="#"><c:out value="${i }"></c:out></a></li>
					</c:if>
					<c:if test="${i!=PageDTO.currpage }">
						<li><a href="?currpage=${i }&<%=hashTagValues %>hasStock=${Stock}&searchType=${Type}&searchData=${Data}&order=${Order}"><c:out value="${i}"></c:out></a></li>
					</c:if>
				</c:forEach>
				<c:if test="${PageDTO.endblock < PageDTO.totalpage }">
					<li><a href="?currpage=${PageDTO.endblock+1}&<%=hashTagValues %>hasStock=${Stock}&searchType=${Type}&searchData=${Data}&order=${Order}">▶</a></li> 
				</c:if>
			</ul>
		</div>
	
</body>
</html>