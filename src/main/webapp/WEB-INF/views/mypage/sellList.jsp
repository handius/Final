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

body {
	background-color: #D9D4CF !important;
}

.jumbotron {
	width: 100%;
	height: 400px;
	background-image: url("/resources/image/mypage/computer.jpg");
	background-size: cover;
	background-position: 0 45%;
	padding: 0;
	margin-bottom: 0 !important;
}

.container {
	background-color: white;
	margin: 5%;
	padding: 3% 5% !important;
}

.container * {
	margin: 5px;
}

.container h1 {
	color: #7C7877;
	font-size: 3vw;
	font-weight: bold;
}

.container hr {
	width: 45%;
	margin: 3% 1%;
	border: 1px solid #7C7877;
}

.sellList {
	font-size: 13px;
}

.sellList thead {
	background-color: #7C7877;
}

.sellList tbody {
	background-color: white;
}

.orderDTO {
	border-top: 1px solid #D9D4CF;
	border-bottom: 1px solid #D9D4CF;
}

.btn {
	margin: 0;
}

.formPage {
	display: flex;
	justify-content: center;
}
</style>
</head>
<body>
	<div class="jumbotron"></div>
	<div class="container">
		<h1>나의판매내역</h1>
		<hr>
		<table class="table sellList">
			<thead>
				<tr>
					<th>결제번호</th>
					<th>결제일자</th>
					<th>결제번호</th>
					<th>상품명</th>
					<th>결제정보</th>
					<th>주문제작정보</th>
					<th>총금액</th>
					<th>상태</th>
					<th>구매자정보</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${sellList }" varStatus="status1">
					<tr class="orderDTO">
						<td>${list.order_no }</td>
						<td>${list.order_date }</td>
						<td>${list.list_no }</td>
						<td><a href="/productDetail/${list.list_no }">${list.list_title }</a></td>
						<td><c:forEach var="item" items="${list.option_name }"
								varStatus="status2">
					${item }/${list.order_amount[status2.index] }개(+${list.order_amount[status2.index]*list.option_price[status2.index] }원)<br>
							</c:forEach></td>
						<td><c:if test="${list.ordermade_no==null }">완제품</c:if> <c:if
								test="${list.ordermade_no!=null }">
								<table>
									<c:forEach var="item"
										items="${orderOrderList2[status1.index] }" varStatus="i">
										<c:if test="${item.order_option eq 'picture' }">
											<tr>
												<td>주문옵션${i.index+1}</td>
												<td>${item.order_name }</td>
											</tr>
											<tr>
												<td colspan="2"><img src="${item.order_value }"
													alt="주문사진"></td>
											</tr>
										</c:if>
										<c:if test="${item.order_option eq 'color' }">
											<tr>
												<td>주문옵션${i.index+1}</td>
												<td>${item.order_name }</td>
											</tr>
											<tr>
												<td colspan="2"><span
													style="background-color: ${item.order_value}">
														색상:${item.order_value }</span></td>
											</tr>
										</c:if>
										<c:if test="${item.order_option eq 'text' }">
											<tr>
												<td>주문옵션${i.index+1}</td>
												<td>${item.order_name }</td>
											</tr>
											<tr>
												<td colspan="2">${item.order_value }</td>
											</tr>
										</c:if>
									</c:forEach>
								</table>
							</c:if></td>
						<td>${list.order_price }</td>
						<td>${list.order_status }</td>
						<td>${buyerList[status1.index].user_id }<br>
							${buyerList[status1.index].user_name }<br>
							${buyerList[status1.index].user_call }<br>
							${buyerList[status1.index].user_address }<br>
						</td>
						<td><c:if test="${list.order_status == '배송대기' }">
								<input type="button" class="btn btn-default btn-block sp"
									name="sp" value="발송처리">
								<span style="display: none;">${list.order_no }</span>
							</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="divPage">
			<form class="formPage" action="/sellList" method="post">
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
	</div>
	<script>
		$(document).ready(function() {
			$("input[name=sp]").click(function() {
				var d = $(this).next().text();
				if (confirm("정말로 발송처리하시겠습니까?")) {
					alert("발송처리가 완료되었습니다.");
					location.href = "sp/" + d;
				} else {
					alert("발송처리를 취소하였습니다.");
				}
				return false;
			});
		});
	</script>
</body>
</html>