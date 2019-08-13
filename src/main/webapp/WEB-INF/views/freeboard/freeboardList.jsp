<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>자유게시판</h1>
	<a href="freeboardList">전체</a>|
	<a href="freeboardList?category=정보">정보</a>|
	<a href="freeboardList?category=교환">교환</a>|
	<a href="freeboardList?category=잡담">잡담</a>
	<form action="searchResult" method="post">
		<select name="search_type">
			<option value="제목">제목</option>
			<option value="글쓴이">글쓴이</option>
		</select> <input type="text" name="search_txt" placeholder="검색어를 입력하세요">
		<button type="submit">검색</button>
	</form>
	<div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>닉네임</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td><c:out value="${list.freeboard_no}"></c:out></td>
						<td><a href="freeboardDetail?no=${list.freeboard_no}"><c:out value="${list.freeboard_title}"></c:out></a></td>
						<td><c:out value="${list.user_nick}"></c:out></td>
						<td><c:out value="${list.freeboard_regiTime}"></c:out></td>
						<td><c:out value="${list.freeboard_hits}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<button onclick="location='freeboardWrite'">글쓰기</button>
</body>
</html>