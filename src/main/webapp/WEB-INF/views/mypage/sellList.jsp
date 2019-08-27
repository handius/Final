<%@page import="com.bitcamp.DTO.order.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>