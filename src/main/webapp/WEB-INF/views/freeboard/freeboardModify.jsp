<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="boardModifyResult?no=${board.freeboard_no}" method="post">
		<%-- <input type="text" name="member_no"
			value="<sec:authentication property="principal.member.member_no"/>"> --%>
		<table>
			<tr>
				<select name="category">
					<!-- <option disabled="disabled" selected="selected">카테고리를 선택하세요</option> -->
					<option value="정보">정보</option>
					<option value="교환">교환</option>
					<option value="잡담">잡담</option>
				</select>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" required="required" value="${board.freeboard_title }"></td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="writer"
					value="${board.user_nick}"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="30" cols="50" name="content"
						required="required">${board.freeboard_content}</textarea></td>
			</tr>
		</table>
		<input type="button" value="목록으로"
			onclick="location.href='freeboardList'">
		<button type="submit">작성완료</button>
	</form>
</body>
</html>