<%@page import="com.bitcamp.DTO.productdetail.BuyReviewDTO"%>
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
				<th>번호</th>
				<th>상품명</th>
				<th>내용</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<%
				List<BuyReviewDTO> buyerReviewList = (List<BuyReviewDTO>) request.getAttribute("buyerReviewList");
				List<String> list_title_list = (List<String>) request.getAttribute("list_title_list");
				for (int i = 0; i < buyerReviewList.size(); i++) {
			%>
			<tr>
				<td><%=buyerReviewList.get(i).getBuy_review_no()%></td>
				<td><a
					href="productDetail/<%=buyerReviewList.get(i).getList_no()%>"><%=list_title_list.get(i)%></a></td>
				<td><%=buyerReviewList.get(i).getBuy_review_content()%></td>
				<td><%=buyerReviewList.get(i).getBuy_review_date()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>