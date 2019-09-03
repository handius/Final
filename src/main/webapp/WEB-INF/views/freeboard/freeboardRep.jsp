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
<link
	href="https://fonts.googleapis.com/css?family=Barriecito&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Comfortaa', '맑은 고딕', cursive;
}
</style>
<script>
//댓글수정폼
function editReply(rep_no) {
	console.log(rep_no);
	let rep_content = $('rep_tbody'+rep_no);
	var a = '';

	a += '<div>';
	a += '<input type="text" class="form-control" name="content_' + rep_no
			+ '" value="' + rep_content + '"/>';
	a += '<a onclick="commentUpdateProc(' + rep_no
			+ ')">수정</a> <a onclick="showReplyList()">취소</a> </span>';
	a += ''
	a += '</div>';

	$('#rep_content' + rep_no).replace(a);
	}
</script>
<body>
	<div>
		<table class="rep_table">
			<c:forEach var="list" items="${list}">
				<tbody id="rep_tbody${list.rep_no}">
					<tr>
						<td>${list.user_nick}</td>
						<td><a onclick="addReply(${list.rep_no})">답글</a> <a
							onclick="editReply('${list.rep_no}')">수정</a> <a>삭제</a></td>
					</tr>
					<tr>
						<td colspan="2">${list.rep_regiDate}</td>
					</tr>
					<tr>
						<td id="rep_content" colspan="2">${list.rep_content}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
</body>
</html>