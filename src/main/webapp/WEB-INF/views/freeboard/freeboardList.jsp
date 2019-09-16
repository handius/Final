<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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

#wrap {
	margin: 0% 20% 3%;
}

.nav {
	color: #7C7877;
	text-align: center;
	padding: 3em 0em;
}

.nav a {
	color: #7C7877;
	padding: 0px 20px;
}

.btnWrite {
	background-color: #ABD0CE;
	color: #ffffff;
	float: right;
}

.table a {
	color: #333333;
}

#btnSearch {
	background-color: #F0E5DE;
	margin: 0px 3px;
}

table {
	width: 100%;
}

/* thead {
	background-color: #F0E5DE;
}
 */
.formSearch {
	display: flex;
	justify-content: center;
}

#searchKeyword {
	width: 300px;
}

.formPage {
	display: flex;
	justify-content: center;
	margin: 10px;
}

.jumbotron {
	width: 100%;
	height: 400px;
	background-image: url("/resources/image/freeboard/community.jpg");
	background-size: cover;
	background-position: 0 45%;
	padding: 0;
	margin-bottom: 0 !important;
}

.divPage {
	padding: 10px 100px;
}

.trHead th, .text_center {
	text-align: center;
}

.btnPage {
	width: 25px;
	height: 25px;
	margin: 5px;
	background-color: transparent;
	border: none;
	background-color: transparent;
	margin: 5px;
}

.btnCurrPage {
	width: 25px;
	height: 25px;
	margin: 5px;
	background-color: transparent;
	border: none;
	color: #ABD0CE;
}

#searchType {
	margin: 0px 3px;
}

.navColor {
	color: #ABD0CE;
}
</style>
<script>
	function search() {
		var url = "${pageContext.request.contextPath}/freeboard";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&searchKeyword=" + $('#searchKeyword').val();
		location.href = url;
		console.log(url);
	}
</script>
<body>
	<div class="jumbotron"></div>
	<div id="wrap">
		<div class="nav">
			<c:if test="${category eq '정보'}">
				<a href="freeboard">전체</a> | <a href="freeboard?category=정보"
					style="color: #ABD0CE;">정보</a> |
			<a href="freeboard?category=교환">교환</a> | <a
					href="freeboard?category=잡담">잡담</a>
			</c:if>
			<c:if test="${category eq '교환'}">
				<a href="freeboard">전체</a> | <a href="freeboard?category=정보">정보</a> |
			<a href="freeboard?category=교환" style="color: #ABD0CE;">교환</a> | <a
					href="freeboard?category=잡담">잡담</a>
			</c:if>
			<c:if test="${category eq '잡담'}">
				<a href="freeboard">전체</a> | <a href="freeboard?category=정보">정보</a> |
			<a href="freeboard?category=교환">교환</a> | <a
					href="freeboard?category=잡담" style="color: #ABD0CE;">잡담</a>
			</c:if>
			<c:if test="${category eq '전체' || category eq ''}">
				<a href="freeboard" style="color: #ABD0CE;">전체</a> | <a
					href="freeboard?category=정보">정보</a> |
			<a href="freeboard?category=교환">교환</a> | <a
					href="freeboard?category=잡담">잡담</a>
			</c:if>
		</div>
		<hr style="border: 0.5px solid black; margin: 0px;">
		<div>
			<table class="table">
				<thead>
					<tr class="trHead">
						<th width="70px">번호</th>
						<th>제목</th>
						<th width="150px">닉네임</th>
						<th width="150px">작성일</th>
						<th width="70px">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="5" class="text_center">검색된 결과가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${list}" var="list">
						<tr>
							<td class="text_center"><c:out value="${list.freeboard_no}"></c:out></td>
							<td><a href="freeboard/detail?no=${list.freeboard_no}"><c:out
										value="${list.freeboard_title}"></c:out>
									[${list.freeboard_rep_count }]</a></td>
							<td class="text_center"><c:out
									value="${list.freeboard_user_nick}"></c:out></td>
							<td class="text_center"><c:out
									value="${list.freeboard_regiTime}"></c:out></td>
							<td class="text_center"><c:out
									value="${list.freeboard_hits}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<br>
		<div>
			<button class="btn btnWrite" onclick="location='freeboard/write'">글쓰기</button>
		</div>
		<div id="divPage">
			<form class="formPage" action="/freeboard" method="post">
				<c:if test="${paging.startblock > 1 }">
					<a href="#">◀</a>
				</c:if>
				<c:forEach var="i" begin="${paging.startblock }"
					end="${paging.endblock }">
					<c:if test="${i == paging.currpage }">
						<button class="btnCurrPage">
							<c:out value="${i }"></c:out>
						</button>
					</c:if>
					<c:if test="${i != paging.currpage }">
						<input type="submit" name="curr" class="btnPage" id="btnPage"
							value="${i }">
					</c:if>
				</c:forEach>
				<c:if test="${paging.endblock < paging.totalpage }">
					<a href="#">▶</a>
				</c:if>
			</form>
		</div>
		<div class="form-group form-inline formSearch">
			<span class="glyphicon glyphicon-search" style="font-size: 30px;"></span>
			<select id="searchType" class="form-control">
				<option value="제목">제목</option>
				<option value="닉네임">닉네임</option>
			</select> <input type="text" class="form-control" id="searchKeyword"
				onKeypress="javascript:if(event.keyCode==13) {search();}">
			<button id="btnSearch" class="btn" onclick="search();">검색</button>
		</div>
	</div>
</body>
</html>