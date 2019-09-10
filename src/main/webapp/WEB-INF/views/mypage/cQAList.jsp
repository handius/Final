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

/* Style the buttons that are used to open and close the accordion panel */
.accordion {
	background-color: #eee;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	text-align: left;
	border: none;
	outline: none;
	transition: 0.4s;
}

/* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
.active, .accordion:hover {
	background-color: #ccc;
}

/* Style the accordion panel. Note: hidden by default */
.panel {
	padding: 0 18px;
	background-color: white;
	display: none;
	overflow: hidden;
}

.container {
	background-color: #F0E5DE;
	margin: 5%;
	padding: 3% 5% !important;
	border-radius: 5%;
}

.container * {
	margin: 5px;
}

.container h1 {
	color: white;
	font-size: 3vw;
	font-weight: bold;
	text-shadow: 0 0 2px #7C7877;
}

.container hr {
	width: 45%;
	margin: 1%;
	border: 1px solid #D9D4CF;
}

.cQAList {
	width: 100%;
	margin: 5% 0;
}

.accordion {
	border-top: 1px solid #D9D4CF;
	border-bottom: 1px solid #D9D4CF;
}

.customerQA {
	display: flex;
	justify-content: flex-end;
}

.formPage {
	display: flex;
	justify-content: center;
}
</style>
</head>
<body>
	<div class="container">
		<h1>나의고객문의</h1>
		<hr>
		<table class="cQAList">
			<thead>
				<tr>
					<th>문의유형</th>
					<th>제목</th>
					<th>문의일자</th>
					<th>답변유무</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${cQAList }">
					<tr class="accordion">
						<td><c:out value="${item.question_type }"></c:out></td>
						<td><c:out value="${item.question_title }"></c:out></td>
						<td><c:out value="${item.question_date }"></c:out></td>
						<td><c:out value="${item.answer_status }"></c:out></td>
					</tr>
					<tr class="panel">
						<td>Q.</td>
						<td colspan="3"><c:out value="${item.question_content }"></c:out></td>
					</tr>
					<c:if test="${item.answer_status == '완료' }">
						<tr class="panel">
							<td>A.</td>
							<td colspan="3"><c:out value="${item.answer_content }"></c:out></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<div class="customerQA">
			<a href="customerQA">1:1 문의하기</a>
		</div>
		<div id="divPage">
			<form class="formPage" action="/cQAList" method="post">
				<c:if test="${paging.startblock > 1 }">
					<a href="#">◀</a>
				</c:if>
				<c:forEach var="i" begin="${paging.startblock }"
					end="${paging.endblock }">
					<c:if test="${i == currpage }">
						<c:out value="${i }"></c:out>
					</c:if>
					<c:if test="${i != currpage }">
						<input type="submit" class="btn btn-default" name="curr"
							value="${i }">
					</c:if>
				</c:forEach>
				<c:if test="${paging.endblock < paging.totalpage }">
					<a href="#">▶</a>
				</c:if>
			</form>
		</div>
	</div>
	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				/* Toggle between adding and removing the "active" class,
				to highlight the button that controls the panel */
				this.classList.toggle("active");

				/* Toggle between hiding and showing the active panel */
				var panel = $(this).nextUntil('.accordion', 'tr');
				for (var i = 0; i < panel.length; i++) {
					if (panel[i].style.display === "table-row") {
						panel[i].style.display = "none";
					} else {
						panel[i].style.display = "table-row";
					}
				}
			});
		}
	</script>
</body>
</html>