<%@page import="com.bitcamp.DTO.productdetail.BuyReviewDTO"%>
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
				<th>번호</th>
				<th>상품명</th>
				<th>내용</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<%
				List<BuyReviewDTO> sellerReviewList = (List<BuyReviewDTO>) request.getAttribute("sellerReviewList");
				List<String> list_title_list = (List<String>) request.getAttribute("list_title_list");
				for (int i = 0; i < sellerReviewList.size(); i++) {
			%>
			<tr>
				<td><%=sellerReviewList.get(i).getBuy_review_no()%></td>
				<td><a
					href="productDetail/<%=sellerReviewList.get(i).getList_no()%>"><%=list_title_list.get(i)%></a></td>
				<td><%=sellerReviewList.get(i).getBuy_review_content()%></td>
				<td><%=sellerReviewList.get(i).getBuy_review_date()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>