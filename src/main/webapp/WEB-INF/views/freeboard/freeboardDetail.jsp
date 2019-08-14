<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>카테고리</td>
			<td>${board.freeboard_category }</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>${board.user_nick}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${board.freeboard_regiTime }</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${board.freeboard_hits }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${board.freeboard_title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${board.freeboard_content }</td>
		</tr>
	</table>
	<div></div>
	
	<button onclick="location='freeboardList'">목록으로</button>
	<button onclick="location='boardModify?no=${board.freeboard_no}'">수정하기</button>
	<button onclick="location='boardDelete?no=${board.freeboard_no}'">삭제하기</button>

</body>
</html>