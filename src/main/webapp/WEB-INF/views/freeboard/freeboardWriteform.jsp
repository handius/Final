<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<form action="freeboardWriteResult" method="post">
	<input type="hidden" name="member_no" value="${member.member_no }">
		<table>
			<tr>
				<td>카테고리</td>
				<td><select name="category" required="required">
						<option disabled="disabled" selected="selected" value="">카테고리를
							선택하세요</option>
						<option value="정보">정보</option>
						<option value="교환">교환</option>
						<option value="잡담">잡담</option>
				</select></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" required="required"></td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="writer"
					value="<sec:authentication property="principal.member.user_nick" />"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="30" cols="50" name="content"
						required="required"></textarea></td>
			</tr>
		</table>
		<input type="button" value="목록으로"
			onclick="location.href='../freeboard'">
		<button type="submit">작성완료</button>
	</form>
</body>
</html>