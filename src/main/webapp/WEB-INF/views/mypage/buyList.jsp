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
</head>
<body>
	<table>
		<tr>
			<th>주문일자</th>
			<th>상품정보</th>
			<th>결제금액</th>
			<th>상태</th>
		</tr>
		<tbody>
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
					<%=option_name.get(j)%>
					<%=order_amount.get(j)%>
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
		</tbody>
	</table>
</body>
</html>