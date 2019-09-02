<%@page import="com.bitcamp.DTO.Product.ListDTO"%>
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
				<th>상품번호</th>
				<th>상품명</th>
				<th>등록일자</th>
				<th>기본가</th>
				<th>주문수량</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${registerList }">
				<tr>
					<td>${list.list_no }</td>
					<td>${list.list_title }</td>
					<td>${list.list_date }</td>
					<td>${list.list_base_price }</td>
					<td>${list.buy_count }</td>
					<td><button
							class="btn btn-default btn-block answerpadding delete_question_btn"
							value="${list.list_no }">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script>
		// '삭제' 버튼
		$('.delete_question_btn').click(function() {
			if (confirm('정말로 삭제하시겠습니까?')) {
				alert("삭제가 완료되었습니다.");
				location.href = "/updateList_status/" + $(this).val();
			} else {
				alert("삭제를 취소하였습니다.");
			}
			return false;
		});
	</script>
</body>
</html>