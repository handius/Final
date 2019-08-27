<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

#wrap{
	margin : 0 auto;
	padding: 30px 50px;
	width: 1000px;
}
</style>
<script>
	$(document).ready(function() {
		showReplyList();
	});

	function showHtml(result) {
		let html = "<table class='table table-striped table-bordered' style='margin-top: 10px;'><tbody id='rep_tbody'>";
		$.each(result, function(index, item) {
			html += "<tr id='tr"+item.rep_no+"' align='center'>";
			html += "<td id='rep_no"+item.rep_no+"'>" + (index + 1) + "</td>";
			html += "<td>" + item.user_nick + "</td>";
			html += "<td class= 'commentContent"+item.rep_no+"' align='left'>"
					+ item.rep_content + "</td>";
			html += "<td>" + item.rep_regiDate;
			html += "<a onclick='addReply(" + item.rep_no + ")'> 답글 </a>";
			/* html += "<a onclick='modifyReply(" + item.rep_no + ")'> 수정 </a>"; */
			html += '<a href="javascript:void(0)" onclick="editReply('
					+ item.rep_no + ', \'' + item.rep_content
					+ '\')" style="padding-right:5px">수정</a>';
			html += "<a onclick='deleteReply(" + item.rep_no + ")'> 삭제 </a>";
			html += "</td>";
			html += "</tr>";
		});
		html += "</tbody></table>";
		/*   commPageNum = parseInt(commPageNum);        // 정수로 변경
		  // commentCount는 동기화되어 값을 받아오기 때문에, 댓글 insert에 즉각적으로 처리되지 못한다.
		  if("${article.commentCount}" > commPageNum * 10) {
		      nextPageNum = commPageNum + 1;
		      html +="<input type='button' class='btn btn-default' onclick='getComment(nextPageNum, event)' value='다음 comment 보기'>";
		  } */

		$("#repList").html(html);
	}

	function addReply(rep_no) {
		console.log("function 실행" + rep_no);

		var a = '<tr><td></td><td>${sessionScope.member.user_nick }</td>';
		a += '<td colspan="2"><textarea id="repContent"></textarea><a onclick="writeRepRep('
				+ rep_no + ')">작성</a></td>';
		a += '</tr>';

		var trHtml = $("tr[id=tr" + rep_no + "]:last");
		console.log(trHtml);
		trHtml.after(a);
	}

	function editReply(rep_no, rep_content) {
		var a = '';

		a += '<div>';
		a += '<input type="text" name="content_'+rep_no+'" value="'+rep_content+'"/>';
		a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('
				+ rep_no + ');">수정</button> </span>';
		a += ''
		a += '</div>';

		$('.commentContent' + rep_no).html(a);
	}

	function commentUpdateProc(rep_no) {
		var content = $('[name=content_' + rep_no + ']').val();
		$.ajax({
			url : '/modifyReply',
			type : 'post',
			data : {
				'rep_content' : content,
				'rep_no' : rep_no
			},
			success : function() {
				showReplyList();
			}
		});
	}

	function deleteReply(rep_no) {
		$.ajax({
			url : '/deleteReply',
			type : 'post',
			data : {
				'rep_no' : rep_no
			},
			success : function() {
				showReplyList();
			}
		});
	}

	function showReplyList() {
		var url = "${pageContext.request.contextPath}/getReplyList";
		var paramData = {
			"freeboard_no" : "${board.freeboard_no}"
		};

		$.ajax({
			type : 'POST',
			url : url,
			data : paramData,
			dataType : 'json',
			success : function(result) {
				showHtml(result);
			}
		});

	}

	function writeReply() {

		var freeboard_no = replyForm.board_no.value;
		var rep_content = replyForm.replyText.value;
		var member_no = replyForm.member_no.value;

		if (!rep_content) {
			alert("내용을 입력하세요.");
		} else {

			var paramData = JSON.stringify({
				"rep_content" : rep_content,
				"freeboard_no" : freeboard_no,
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
					showReplyList();
					$('#replyText').val('');
				},
				error : function(error) {
					console.log("에러:" + error);
				}
			});
		}
	}

	function writeRepRep(rep_no) {
		var freeboard_no = replyForm.board_no.value;
		var rep_content = $('#repContent').val();
		var member_no = replyForm.member_no.value;

		if (!rep_content) {
			alert("내용을 입력하세요.");
		} else {
			var paramData = JSON.stringify({
				"rep_parent_no" : rep_no,
				"rep_content" : rep_content,
				"freeboard_no" : freeboard_no,
				"member_no" : member_no
			});

			var headers = {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			};
			$.ajax({

				url : "/freeboard/ReplyReply",
				headers : headers,
				data : paramData,
				type : 'POST',
				dataType : 'text',
				success : function(result) {
					showReplyList();
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
			<p>댓글(${countRep})</p>
			<div>
				<form id="replyForm">
					<input id="member_no" type="hidden"
						value="${sessionScope.member.member_no}"> <input
						id="board_no" type="hidden" value="${board.freeboard_no}">
					<table>
						<tr>
							<td>${sessionScope.member.user_nick }</td>
							<td><textarea class="form-control" id="replyText" name="replyText" rows="2"
									cols="50" placeholder="댓글을 입력해주세요"></textarea></td>
							<td><a onclick="writeReply()">댓글작성</a></td>
						</tr>
					</table>
				</form>
			</div>
			<div id="repList"></div>
		</div>
		<button class="btn" onclick="location='../freeboard'">목록으로</button>
		<button class="btn" onclick="location='boardModify?no=${board.freeboard_no}'">수정</button>
		<button class="btn" onclick="location='boardDelete?no=${board.freeboard_no}'">삭제</button>
	</div>
</body>
</html>