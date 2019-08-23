<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function answer_load(){
		$('#')
	}
</script>
<body>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>상품명</th>
				<th>내용</th>
				<th>문의일</th>
				<th>문의일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${buyerPQList }">
				<tr>
					<td><c:out value="${item.qa_board_no }"></c:out></td>
					<td><c:out value="${item.qa_board_no }"></c:out></td>
					<td><c:out value="${item.qa_board_content }"></c:out></td>
					<td><c:out value="${item.qa_board_date }"></c:out></td>
					<td><c:out value="${item.qa_board_status }"></c:out></td>
				</tr>
				<div id="answer"></div>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>