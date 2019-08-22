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
			<th>번호</th>
			<th>제목</th>
			<th>문의유형</th>
			<th>문의일자</th>
			<th>답변유무</th>
		</tr>
		<tbody>
			<c:forEach var="item" items="${cQAList }">
				<tr>
					<td><c:out value="${item.question_no }"></c:out></td>
					<td><c:out value="${item.question_type }"></c:out></td>
					<td><c:out value="${item.question_title }"></c:out></td>
					<td><c:out value="${item.question_date }"></c:out></td>
					<td><c:out value="${item.answer_status }"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="customerQA">1:1 문의하기</a>
</body>
</html>