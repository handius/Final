<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

#wrap {
	margin: 0 auto;
	padding: 30px 50px;
	width: 1000px;
}

#btnRepWrite {
	background-color: #ABD0CE;
	color: white;
	float: right;
}

.btnMod {
	float: right;
	margin-left: 5px;
}

.title {
	font-weight: 700;
}

#divReply {
	padding-bottom: 50px;
}

.tdHead {
	background-color: #F0E5DE;
}
</style>
<script>
	var sessionid = ${sessionScope.member.member_no};
	var freeboard_no = ${board.freeboard_no};
	$(document).ready(function() {
		listReply(freeboard_no);
	});

	var entityMap = {
		'&' : '&amp;',
		'<': '&lt;', '>' : '&gt;',
		'"' : '&quot;',
		"'" : '&#39;',
		'/' : '&#x2F;',
		'`' : '&#x60;',
		'=' : '&#x3D;'
	};

	function escapeHtml(string) {
		console.log('이스케이프');
		console.log(string);
		return String(string).replace(/[&<>"'`=\/]/g, function(s) {
			return entityMap[s];
		});
	}

	//댓글리스트 출력
	function listReply(num) {
		$
				.ajax({
					type : "get",
					url : "${pageContext.request.contextPath}/freeboardRep?no=${board.freeboard_no}&curr="
							+ num,
					success : function(result) {
						$("#repList").html(result);
					}
				});
	}

	//댓글작성
	function writeReply() {

		var freeboard_no = replyForm.board_no.value;
		var rep_content = replyForm.replyText.value;
		var member_no = replyForm.member_no.value;

		if (!rep_content) {
			alert("내용을 입력하세요.");
		} else {

			var paramData = JSON.stringify({
				"freeboard_no" : freeboard_no,
				"rep_content" : rep_content,
				"member_no" : member_no
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
					console.log("성공");
					showReplyList();
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
	<div id="wrap">
		<table class="table table-bordered table-condensed">
			<tbody>
				<tr>
					<td class="tdHead">제목</td>
					<td class="title" colspan="6">[${board.freeboard_category}]
						${board.freeboard_title }</td>
				</tr>
				<tr>
					<td class="tdHead">닉네임</td>
					<td>${board.freeboard_user_nick}</td>
					<td class="tdHead">작성일</td>
					<td>${board.freeboard_regiTime }</td>
					<td class="tdHead">조회수</td>
					<td>${board.freeboard_hits }</td>
				</tr>
				<tr>
					<td class="tdHead">내용</td>
					<td colspan="6" style="min-height: 100px">${board.freeboard_content }</td>
				</tr>
			</tbody>
		</table>

		<div>
			<p>댓글(${countRep})</p>
			<div id="divReply">
				<form id="replyForm">
					<input id="member_no" type="hidden"
						value="${sessionScope.member.member_no}"> <input
						id="board_no" name="no" type="hidden"
						value="${board.freeboard_no}">
					<div class="form-group">
						<label>${sessionScope.member.user_nick }</label>
						<textarea class="form-control" id="replyText"
							placeholder="댓글을 입력해주세요"></textarea>
					</div>
					<input type="submit" id="btnRepWrite" class="btn"
						onclick="writeReply()" value="댓글등록">
				</form>
			</div>
			<div id="repList">
				<div id="divPage"></div>
			</div>
		</div>
		<button class="btn" onclick="location='../freeboard'">목록으로</button>

		<c:if
			test="${sessionScope.member.member_no eq board.freeboard_member_no}">
			<button class="btn btnMod"
				onclick="location='boardModify?no=${board.freeboard_no}'">수정</button>
			<button class="btn btnMod"
				onclick="location='boardDelete?no=${board.freeboard_no}'">삭제</button>
		</c:if>
	</div>
</body>
</html>