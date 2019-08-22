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
				<%List<Integer> option_name = buyList.get(i).getOrder_add_option();
				List<Integer> order_amount = buyList.get(i).getOrder_amount();
				if (option_name != null) {
					for (int j = 0; j < option_name.size(); j++) {%>
					<%=option_name.get(j)%> <%=order_amount.get(j)%>
					<%}
					}%>
					<%=buyList.get(i).getOrder_price()%></td>
				<td><%=buyList.get(i).getOrder_status()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>