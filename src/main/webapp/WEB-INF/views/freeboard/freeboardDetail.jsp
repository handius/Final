<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function writeReply() {

		var freeboard_no = replyForm.board_no.value;
		var rep_content = replyForm.replyText.value;

		if (!rep_content) {
			alert("내용을 입력하세요.");
		} else {

			var paramData = JSON.stringify({
				"rep_content" : rep_content,
				"freeboard_no" : freeboard_no
			});

			var headers = {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			};

			$.ajax({

				url : "/freeboard/freeboardReply",
				headers : headers,
				data : paramData,
				type : 'POST',
				dataType : 'text',
				success : function(result) {
					console.log(result);
					/* showReplyList(); */
					$('#replyText').val('');
				},
				error : function(error) {
					console.log("에러:" + error);
				}
			});
		}
	}
</script>
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

	<div>
		<p>댓글()</p>
		<div class="repList"></div>
		<div>
			<form id="replyForm">
				<input id="board_no" type="hidden" value="${board.freeboard_no}">
				<textarea id="replyText" name="replyText" rows="2" cols="50"
					placeholder="댓글을 입력해주세요"></textarea>
				<br> <a onclick="writeReply()">댓글작성</a>
			</form>
		</div>
	</div>

	<button onclick="location='freeboardList'">목록으로</button>
	<button onclick="location='boardModify?no=${board.freeboard_no}'">수정하기</button>
	<button onclick="location='boardDelete?no=${board.freeboard_no}'">삭제하기</button>

</body>
</html>