<%@page import="com.bitcamp.DTO.productdetail.BuyReviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Comfortaa', '맑은 고딕', cursive;
}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th style="display: none;">번호</th>
				<th>상품명</th>
				<th>내용</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${buyerReviewList }" varStatus="status">
				<tr>
					<td style="display: none;">${list.buy_review_no }</td>
					<td><a href="productDetail/${list.list_no }">${list_title_list[status.index] }</a></td>
					<td>${list.buy_review_content }</td>
					<td>${list.buy_review_date }</td>
					<td><button
							class="btn btn-default btn-block answerpadding ifanswered"
							value="${list.buy_review_no }" data-toggle="modal"
							data-target="#myModal">수정</button></td>
					<td><button
							class="btn btn-default btn-block answerpadding delete_question_btn"
							value="${list.buy_review_no }">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="divPage">
		<form class="formPage" action="/buyerReviewList" method="post">
			<c:if test="${paging.startblock > 1 }">
				<a href="#">◀</a>
			</c:if>
			<c:forEach var="i" begin="${paging.startblock }"
				end="${paging.endblock }">
				<c:if test="${i == currpage }">
					<c:out value="${i }"></c:out>
				</c:if>
				<c:if test="${i != currpage }">
					<input type="submit" class="btn btn-default" name="curr"
						value="${i }">
				</c:if>
			</c:forEach>
			<c:if test="${paging.endblock < paging.totalpage }">
				<a href="#">▶</a>
			</c:if>
		</form>
	</div>
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header"></div>
				<div class="modal-body" id="updateBuy_review_content"></div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<script>
		// '수정' 버튼
		$('.ifanswered').click(function() {
			$.ajax({
				url : "/updateBuy_review_content/" + $(this).val(),
				type : "GET",
				dataType : "html",
				success : function(data) {
					$('#updateBuy_review_content').empty();
					$('#updateBuy_review_content').append(data);
				},
				error : function(data) {
					alert("error");
				}
			});
		});

		// '삭제' 버튼
		$('.delete_question_btn').click(function() {
			if (confirm('정말로 삭제하시겠습니까?')) {
				alert("삭제가 완료되었습니다.");
				location.href = "/updateBuy_review_status/" + $(this).val();
			} else {
				alert("삭제를 취소하였습니다.");
			}
			return false;
		});
	</script>
</body>
</html>