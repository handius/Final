<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		background-color: #F0E5DE !important;
	}
	.category a{
		color: rgba(93,93,93) !important;
		text-decoration: none;
		font-weight: bolder;
		transition : 0.3s;
	}
	.category a:hover{
		color: lightblue !important;
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
		background-color: #D9D4CF;
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
	#hashform{
		padding-top: 10px;
		padding-bottom: 10px;
	}
	#hashform label{
		padding:5px 10px;
		border: 1px solid silver;
		border-radius: 20px;
		margin: 10px;
		background-color: white;
		color:silver;
		transition : .3s;
	}
	#hashform input[type="checkbox"]{
		display: none;
	}
	#hashplus{
		position: relative;
		margin-bottom: 10px;
	}
	#sform{
		padding-top:10px;
		padding-bottom:10px;
	}
	form > hr{
	}
	.searchClass{
		text-align: right;
	}
	.listbox .thumbnail{
		height: 370px;
		box-shadow: 8px 5px 3px silver;
		border: 1px double silver;
		transition: 0.3s;
		margin-top:20px;
		margin-bottom:30px;
	}
	.listbox .thumbnail:hover{
		box-shadow: 6px 4px 2px rgba(109,109,109,0.8);
	}
	.listbox .thumbnail img{
		height: 220px;
		border: 1px double silver;
		border-radius: 5px;
	}
	.listbox .caption{
		border-top:3px double silver;
		border-bottom:3px double silver;
		margin-top: 5px;
		padding : 9px 15px !important;
		background-color: white;
		height: 133px;
		position: relative;
	}
	.listbox .caption h4{
		margin-top: 1px !important;
		font-weight: lighter;
		font-size : 1.7em;
		margin-bottom: 1px;
	}
	.listbox .caption h4 a{
		color : black !important; 
		transition: .3s;
		font-size: 0.6em;
		font-weight: 600;
	}
	.listbox .caption p{
		font-size: 1.8em;
	}
	.listbox .caption .price{
		text-align: right;
		font-weight: bolder;
		margin-bottom:0px;
		position: absolute;
		bottom : 10px;
		right: 15px;
	}
	.listbox .caption h4 a:hover{
		color:lightpink !important;
	}
	#subbtn{
		background-color: transparent;
		border: none;
	}
	#hashplus{
		background-color: transparent;
		border: 1px dotted silver;
		border-radius:50%;
		font-weight: bolder;
	}
	.arttxt{
		font-family: 'Comfortaa', cursive;
		font-style: italic;
		font-weight: bolder;
		color: black;
		font-size: 0.9em;
	}
	.smtxt{
		font-size: 0.6em;
	}
	.bul{
		width: 100%;
	}
	.bul li{
		width: 100%;
		text-align: center;
	}
	#deletebtn{
		text-align: right;
		padding : 20px;
		padding-right: 10%;
		padding-top: 0px;
	}
	
	.bul li a{
		font-size: 1.2em;
		font-weight: 800 !important;
		display: inline-block;
		padding: 10px !important;
	}
	.captionSelector + .caption{
		background-color: #D9D4CF;
	}
	@media(max-width:769px){
		
	}
	@media(max-width:770px){
		.pc{
			display: none;
		}
		.mob{
			display: block;
		}
	}
	@media(min-width:771px) {
		.pc{
			display: block;
		}
		.mob{
			display: none;
		}
	}
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
	function onDelete(){
		var deleteFiles = [];
		var jsondata = [];
		$.each($('.removeCheck:checked'), function(index, value){
			deleteFiles.push(value.value);
		});
		$.each(deleteFiles, function(index, value){
			jsondata.push({
				number : value
			});
		});
		console.log(jsondata);
		var json_sub =  JSON.stringify(jsondata);
		$.ajax({
			url : "/deleteProduct",
			type : "POST",
			data : {obj : json_sub},
			success : function(data){
				console.log(data);
				console.log("삭제 성공");
				location.reload();
			},
			error:function(request,status,error) { 
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			}
		})
		console.log(deleteFiles);
		console.log("삭제 실행");
		
	}
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
			$(this).css('border-color','black');
		}else{
			$(this).css('color', 'silver');
			$(this).css('border-color','silver');
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
			<div class="container pc">
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
			<div class="container mob dropdown">
				<a data-toggle="dropdown" href="#" class="btn btn-default"><span class="glyphicon glyphicon-align-justify"></span></a>
				<ul class="dropdown-menu bul" role="menu">
				    <li role="presentation"><a role="menuitem" tabindex="-1" href="/orderList/book?order=${Order}">Book</a></li>
				    <li role="presentation"><a role="menuitem" tabindex="-1" href="/orderList/cup?order=${Order}">Mugcup</a></li>
				    <li role="presentation"><a role="menuitem" tabindex="-1" href="/orderList/table?order=${Order}">Funiture</a></li>
				    <li role="presentation"><a role="menuitem" tabindex="-1" href="/orderList/accessary?order=${Order}">Accessary</a></li>
				    <li role="presentation"><a role="menuitem" tabindex="-1" href="/orderList/handmade?order=${Order}">HandCraft</a></li>
				    <li role="presentation"><a role="menuitem" tabindex="-1" href="/orderList/anything?order=${Order}">ETC</a></li>
				</ul>
			</div>
		</div>
		<div class="container">
			
			<form class="form-inline" action="" method="get" role="form">
				<div class="container" id="hashform">
					
				</div>
				<div class="line">
				</div>
				<div id="sform" class="row">
					<div class="col-md-2 col-xs-4">
						<label class="checkbox-inline">
							<input type="checkbox" id="hasStock" name="hasStock" value="1">
							<span>품절 품목 제외</span>
						</label>
					</div>
					<div class="col-md-5 col-md-offset-5 col-xs-6 col-xs-offset-2 searchClass">
						<label for="searchType">
							<select name="searchType" id="searchType" class="form-control">
								<option value="title">제목</option>
								<option value="artist">작성자</option>
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
			      				<a href="/checkIsOrdered?no=${item.list_no} "><img src="${image }" alt="이미지가 없습니다."></a>
			      			</c:forEach>
			      			<c:if test="${item.list_status eq 0 }">
			      				<div class="captionSelector"></div>
			      			</c:if>
			          		<div class="caption">
			          			<c:if test="${item.isordered eq 1 }">
			          				<h4><a href="/checkIsOrdered?no=${item.list_no} ">[주문제작]${item.list_title }</a></h4>
			            			<span class="arttxt">${item.list_artist }</span>
			            			<p class="price"><fmt:formatNumber value="${item.list_base_price }" type="number"/><span class="smtxt">원</span></p>
			          			</c:if>
			          			<c:if test="${item.isordered eq 0 }">
			          				<h4><a href="/checkIsOrdered?no=${item.list_no} ">[완제품]${item.list_title }</a></h4>
			            			<span class="arttxt">${item.list_artist }</span>
			            			<p class="price"><fmt:formatNumber value="${item.list_base_price }" type="number"/><span class="smtxt">원</span></p>
			          			</c:if>
			          			<c:if test="${isAdmin }">
									<input type="checkbox" value="${item.list_no }" class="removeCheck">
								</c:if>
								<c:if test="${item.list_status eq 0 }">
									<div><span>유저가 이미 삭제한 게시글입니다.</span></div>
								</c:if>
								
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
			<div id="deletebtn">
				<c:if test="${isAdmin }">
					<button type="button" class="btn btn-success" onclick="onDelete()">게시글 삭제</button>
				</c:if>
			</div>
		</div>
	
</body>
</html>