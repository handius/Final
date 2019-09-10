<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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

.btna {
	float: right;
}

.btna a {
	font-weight: normal;
	color: #7C7877;
}

.nickname span {
	font-weight: 600;
	vertical-align: middle;
}

.regidate {
	font-size: 10px;
}

#rep_box {
	padding: 5px 15px;
	padding-bottom: 20px;
}
</style>
<script>

<c:set var="memberNo"><sec:authentication property="principal.member.member_no" /></c:set>
<c:set var="userNick"><sec:authentication property="principal.member.user_nick" /></c:set>
var freeboard_no = ${freeboard_no};
var userNick = '<c:out value="${userNick}"/>';
var memberNo = '<c:out value="${memberNo}"/>';

//답글 폼
function addReply(rep_no){
	var a = '';
	a+= '<div style="padding-left:30px;">';
	a+= '<div class="nickname">${userNick}</div>';
	a+= '<div><textarea id="ta_repContent" class="form-control"></textarea></div>';
	a+= '<div class="btna"><a onclick="writeRepRep('+rep_no+')">답글달기</a> <a onclick="listReply(freeboard_no)">취소</a></div>'
	a+= '</div>';
	
	$('#rep_content'+rep_no).after(a);
	/* $('#rep_add'+rep_no).html(a); */
}

//답글달기
function writeRepRep(rep_no){	
	var rep_content = $('#ta_repContent').val();
	var member_no = ${memberNo};
	
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
				listReply(freeboard_no);
			},
			error : function(error) {
				console.log("에러:" + error);
			}
		});
	} 
}

//댓글수정폼
function editReply(rep_no, rep_content) {
	var a = '';

	a += '<div>';
	a += '<input type="text" id="edit_content" class="form-control" value="' + rep_content + '"/>';
	a += '<a onclick="repUpdate(' + rep_no
			+ ')">수정</a> <a onclick="listReply(freeboard_no)">취소</a>';
	a += '</div>';

	$('#rep_content' + rep_no).html(a);
	}

//댓글 수정
function repUpdate(rep_no){
	var rep_content = $('#edit_content').val();
	$.ajax({
		url : '/freeboard/modifyReply',
		type : 'post',
		data : {
			'rep_content' : rep_content,
			'rep_no' : rep_no
		},
		success : function() {
			alert('변경되었습니다!');
			listReply(freeboard_no);
		}
	});
	
}

//댓글 삭제
	function deleteReply(rep_no) {
		$.ajax({
			url : '/freeboard/deleteReply',
			type : 'post',
			data : {
				'rep_no' : rep_no
			},
			success : function() {
				alert('삭제되었습니다!');
				listReply(freeboard_no);
			}
		});
	}

</script>
<body>
<c:set var="memberNo"><sec:authentication property="principal.member.member_no" /></c:set>
<c:set var="userNick"><sec:authentication property="principal.member.user_nick" /></c:set>

	<div id="wraprep">
		<c:set var="freeboard_no" value="${freeboard_no}" />
		<c:forEach var="list" items="${list}">
			<c:if test="${list.rep_parent_no eq null || list.rep_parent_no == ''}">
				<div id="rep_box">
					<div>
						<div class="nickname"><span class="glyphicon glyphicon-user"></span><span>${list.user_nick}</span>
							<div class="btna">
								<a onclick="addReply(${list.rep_no})">답글</a>
								<c:if test="${memberNo eq list.member_no }">
									<a onclick="editReply('${list.rep_no}', '${list.rep_content}')">수정</a>
									<a onclick="deleteReply('${list.rep_no}')">삭제</a>
								</c:if>
							</div>
						</div>
					</div>
					<div>
						<div class="regidate">${list.rep_regiDate}</div>
					</div>
					<div>
						<div id="rep_content${list.rep_no}">${list.rep_content}</div>
						<div id="rep_add${list.rep_no}"></div>
					</div>
				</div>
			</c:if>
			<c:if test="${list.rep_parent_no>=1}">
				<div id="rep_box" style="margin-left: 50px;">
					<div>
						<div class="nickname"><span class="glyphicon glyphicon-user"></span><span>${list.user_nick}</span>
							<div class="btna">
								<a onclick="addReply(${list.rep_no})">답글</a>
								<c:if test="${memberNo eq list.member_no }">
									<a onclick="editReply('${list.rep_no}', '${list.rep_content}')">수정</a>
									<a onclick="deleteReply('${list.rep_no}')">삭제</a>
								</c:if>
							</div>
						</div>
					</div>
					<div>
						<div class="regidate">${list.rep_regiDate}</div>
					</div>
					<div>
						<div id="rep_content${list.rep_no}">${list.rep_content}</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
</body>
</html>