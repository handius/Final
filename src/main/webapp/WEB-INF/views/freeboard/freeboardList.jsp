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
	<a href="">전체</a>|
	<a href="">정보</a>|
	<a href="">교환</a>|
	<a href="">잡담</a>
	<form>
		<select name="search_type">
			<option value="제목">제목</option>
			<option value="글쓴이">글쓴이</option>
		</select>
		<input type="text" placeholder="검색어를 입력하세요">
		<button type="submit">검색</button>
	</form>
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
			<tr></tr>
		</tbody>
	</table>
	<button onclick="location='freeboardWrite'">글쓰기</button>
</body>
</html>