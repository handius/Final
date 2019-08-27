<%@page import="com.bitcamp.DTO.productdetail.QABoardDTO"%>
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
<script>
	function answer_load() {
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
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<%
				List<QABoardDTO> sellerPQAList = (List<QABoardDTO>) request.getAttribute("sellerPQAList");
				List<String> list_title_list = (List<String>) request.getAttribute("list_title_list");
				for (int i = 0; i < sellerPQAList.size(); i++) {
			%>
			<tr>
				<td><%=sellerPQAList.get(i).getQa_board_no()%></td>
				<td><a
					href="productDetail/<%=sellerPQAList.get(i).getList_no()%>"><%=list_title_list.get(i)%></a></td>
				<td><%=sellerPQAList.get(i).getQa_board_content()%></td>
				<td><%=sellerPQAList.get(i).getQa_board_date()%></td>
				<td><%=sellerPQAList.get(i).getQa_board_status()%></td>
			</tr>
			<div id="answer"></div>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>