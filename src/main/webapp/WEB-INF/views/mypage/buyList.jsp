<%@page import="com.bitcamp.DTO.order.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<th>주문일자</th>
				<th>상품정보</th>
				<th>결제금액</th>
				<th>상태</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${buyList }">
				<tr>
					<td>${list.order_date }</td>
					<td><a href="/productDetail/${list.list_no }">${list.list_title }</a><br>
						<c:forEach var="item" items="${list.option_name }"
							varStatus="status">
				옵션 : ${item }<br>
				수량 : ${list.order_amount[status.index] }<br>
						</c:forEach></td>
					<td>${list.order_price }</td>
					<td>${list.order_status }</td>
					<td><c:if test="${list.order_status == '배송대기' }">
							<input type="button" class="btn btn-default cor" name="cor"
								value="수취완료">
							<span style="display: none;">${list.order_no }</span>
						</c:if> <c:if test="${list.order_status == '배송완료' }">
							<button class="btn btn-default" name="rw" id="rw"
								data-toggle="modal" data-target="#myModal">리뷰쓰기</button>
						</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
		<%-- <tbody>
			<%
				List<OrderDTO> buyList = (List<OrderDTO>) request.getAttribute("buyList");
				for (int i = 0; i < buyList.size(); i++) {
			%>
			<tr>
				<td><%=buyList.get(i).getOrder_date()%></td>
				<td><%=buyList.get(i).getList_title()%>
				<%List<String> option_name = buyList.get(i).getOption_name();
				List<Integer> order_amount = buyList.get(i).getOrder_amount();
				if (option_name != null) {
					for (int j = 0; j < option_name.size(); j++) {%>
					<%=option_name.get(j)%> <%=order_amount.get(j)%>
					<%
					}
					}
					%></td>
				<td><%=buyList.get(i).getOrder_price()%></td>
				<td><%=buyList.get(i).getOrder_status()%></td>
			</tr>
			<%
				}
			%>
		</tbody> --%>
	</table>
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header"></div>
				<div class="modal-body">Hello! Webisfree.com</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$("input[name=cor]").click(function() {
				var d = $(this).next().text();
				if (confirm("상품을 받으셨나요?\n상품을 받으신 분만 수취확인을 해주세요.")) {
					alert("수취확인이 완료되었습니다.");
					location.href = "cor/" + d;
				} else {
					alert("수취확인을 취소하였습니다.");
				}
			});
		});
	</script>
</body>
</html>