<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="customerQAResult">
		<ul>
			<li><select name="question_type">
					<option value="문의하기">문의하기</option>
					<option value="신고하기">신고하기</option>
					<option value="작가신청">작가신청</option>
			</select></li>
			<li><label for="question_title">제목</label> <input type="text"
				name="question_title" id="question_title"></li>
			<li><label for="question_content">내용</label> <textarea
					name="question_content" id="question_content" rows="5" cols="30"></textarea></li>
			<li><input type="submit" value="문의하기"></li>
		</ul>
	</form>
</body>
</html>