<%@page import="com.bitcamp.DTO.member.MemberDTO"%>
<%@page import="com.bitcamp.DTO.order.OrderDTO"%>
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
				<th>주문번호</th>
				<th>주문일자</th>
				<th>상품명</th>
				<th>주문정보</th>
				<th>총금액</th>
				<th>상태</th>
				<th>구매자정보</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${sellList }" varStatus="status">
				<tr>
					<td>${list.order_no }</td>
					<td>${list.order_date }</td>
					<td><a href="/productDetail/${list.list_no }">${list.list_title }</a></td>
					<td><c:forEach var="item" items="${list.option_name }"
							varStatus="status">
					${item }/${list.order_amount[status.index] }개(+${list.order_amount[status.index]*list.option_price[status.index] }원)<br>
						</c:forEach></td>
					<td>${list.order_price }</td>
					<td>${list.order_status }</td>
					<td>${buyerList[status.index].user_id }
						${buyerList[status.index].user_name }
						${buyerList[status.index].user_call }
						${buyerList[status.index].user_address }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>