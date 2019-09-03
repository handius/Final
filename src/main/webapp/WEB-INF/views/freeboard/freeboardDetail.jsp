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

.nickname {
	font-weight: 600;
}

#divReply {
	padding-bottom: 50px;
}

.tdHead {
	text-align: center;
	background-color: #f9f9f9;
	font-weight: bold;
}

.rep_table {
	width: 100%;
	border-spacing: 10px;
}

.rep_regidate {
	font-size: 12px;
}

.rep_nav {
	width: 150px;
	text-align: right;
}

.rep_nickname {
	font-weight: 700;
}

.rep_no {
	width: 20px;
}

.rep_content_td {
	padding: 10px 0px 10px;
}

.table_tr {
	padding: 200px;
}
</style>
<script>
	var sessionid = ${sessionScope.member.member_no};
	var freeboard_no = ${board.freeboard_no};
	$(document).ready(function() {
		showReplyList();
		/* listReply(freeboard_no); */
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

	//댓글리스트 출력2
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

	//댓글리스트 출력
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
	//댓글출력
	function showHtml(result) {
		let html = "<table class='rep_table' style='margin-top: 10px;'><tbody id='rep_tbody'>";
		$
				.each(
						result,
						function(index, item) {
							html += "<tr class='table_tr'>";
							if(item.rep_parent_no != null){
								html+="<div style='padding-left:10px;'></div>";
							}
							html += "<td class='rep_no' id='rep_no"+item.rep_no+"'>"
								+ (index + 1) + "</td>";	
							html += "<td class='rep_nickname'>"
									+ item.user_nick + "</td>"; //닉네임
							html += "<td class='rep_nav'><a onclick='addReply("
									+ item.rep_no
									+ ")'  style='padding-left:5px'> 답글 </a>";

							if (sessionid == item.member_no) {
								html += '<a href="javascript:void(0)" onclick="editReply('
										+ item.rep_no
										+ ', \''
										+ item.rep_content
										+ '\')" style="padding-right:5px">수정</a>';
								html += "<a onclick='deleteReply("
										+ item.rep_no + ")'>삭제 </a>"; //답글 수정 삭제
							}
							html += "</td></tr>";
							html += "<tr><td></td><td colspan='3'  class='rep_regidate'>"
									+ item.rep_regiDate + "</td></tr>"; //작성일
							html += "<tr class='table_tr_last'  id='tr"+item.rep_no+"'><td></td><td class='rep_content_td commentContent"+item.rep_no+"' align='left' width='450px'>"
									+ item.rep_content + "</td>";
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

	//댓글등록
	function addReply(rep_no) {
		console.log("function 실행" + rep_no);

		var a = '<tr><td></td><td class="nickname">${sessionScope.member.user_nick }</td></tr>';
		a += '<tr><td></td><td colspan="2"><textarea id="repContent" class="form-control"></textarea><a onclick="writeRepRep('
				+ rep_no
				+ ') " style="padding-right:5px">답글달기</a><a onclick="showReplyList()">취소</a></td>';
		a += '</tr>';

		var trHtml = $("tr[id=tr" + rep_no + "]:last");
		console.log(trHtml);
		trHtml.after(a);
	}

	//댓글수정폼
	function editReply(rep_no, rep_content) {
		var a = '';

		a += '<div>';
		a += '<input type="text" class="form-control" name="content_' + rep_no
				+ '" value="' + rep_content + '"/>';
		a += '<a onclick="commentUpdateProc(' + rep_no
				+ ')">수정</a> <a onclick="showReplyList()">취소</a> </span>';
		a += ''
		a += '</div>';

		$('.commentContent' + rep_no).html(a);
	}

	//댓글수정
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
				alert('변경되었습니다!');
				showReplyList();
			}
		});
	}

	//댓글삭제
	function deleteReply(rep_no) {
		$.ajax({
			url : '/deleteReply',
			type : 'post',
			data : {
				'rep_no' : rep_no
			},
			success : function() {
				alert('삭제되었습니다!');
				showReplyList();
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

	//답글작성
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
		<table class="table table-bordered table-condensed">
			<tbody>
				<tr>
					<td class="tdHead">제목</td>
					<td class="title" colspan="6">[${board.freeboard_category}]
						${board.freeboard_title }</td>
				</tr>
				<tr>
					<td class="tdHead">닉네임</td>
					<td>${board.user_nick}</td>
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