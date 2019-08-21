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
			<c:forEach var="item" items="${buyList }">
				<tr>
					<td><c:out value="${item.order_date }"></c:out></td>
					<td><c:out value="${item.list_title }"></c:out> <c:forEach
							var="on" items="${item.option_name }">
					옵션:${on }
					</c:forEach> <c:forEach var="on" items="${item.order_amount }">
					수량:${oa }
					</c:forEach> <c:out value="${item.order_price }"></c:out></td>
					<td><c:out value="${item.order_status }"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>