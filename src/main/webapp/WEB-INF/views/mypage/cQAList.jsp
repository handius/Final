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
				<th>번호</th>
				<th>제목</th>
				<th>문의유형</th>
				<th>문의일자</th>
				<th>답변유무</th>
			</tr>
		</thead>
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