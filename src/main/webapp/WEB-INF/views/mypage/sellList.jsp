<%@page import="com.bitcamp.DTO.member.MemberDTO"%>
<%@page import="com.bitcamp.DTO.order.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<%
				List<OrderDTO> sellList = (List<OrderDTO>) request.getAttribute("sellList");
				List<MemberDTO> buyerList = (List<MemberDTO>) request.getAttribute("buyerList");
				for (int i = 0; i < sellList.size(); i++) {
			%>
			<tr>
				<td><%=sellList.get(i).getOrder_no()%></td>
				<td><%=sellList.get(i).getOrder_date()%></td>
				<td><%=sellList.get(i).getList_title()%></td>
				<td><%List<String> option_name = sellList.get(i).getOption_name();
				List<Integer> order_amount = sellList.get(i).getOrder_amount();
				if (option_name != null) {
					for (int j = 0; j < option_name.size(); j++) {%>
					<%=option_name.get(j)%> <%=order_amount.get(j)%>
					<%
					}
					}
					%></td>
				<td><%=sellList.get(i).getOrder_price()%></td>
				<td><%=sellList.get(i).getOrder_status()%></td>
				<td><%=buyerList.get(i).getUser_id() %>
				<%=buyerList.get(i).getUser_name() %>
				<%=buyerList.get(i).getUser_call() %>
				<%=buyerList.get(i).getUser_address() %>
				</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>