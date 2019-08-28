<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>test</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
<style>
    * {
        font-family: 'Comfortaa', '맑은 고딕', cursive;
    }
    body {
        background-color: #F0E5DE;
    }
    .member_search_btn {
        padding: 20px 0 0;
        margin: 0;
    }
    .membertable tr th.th_one, .qna_td_one {
        text-align: center;
        width: 4%;
    }
    .membertable tr th.th_one_left {
        width: 4%;
    }
    .membertable tr th.th_two {
        width: 30%;
    }
    .membertable tr th.th_three {
        width: 10%;
    }
    .membertable tr th.th_four {
        width: 20%;
    }
    .membertable tr th.th_five {
        width: 10%;
    }
    .pagination_block {
    	text-align: center;
    }
    /**/
    .admin_content {
        margin: 10px 0 50px;
        border-top: 1px solid #D9D4CF;
        border-bottom: 1px solid #D9D4CF;
        padding: 30px 15px;
    }
</style>
</head>
<body>
        <h2>Question & Answer</h2>
        <div class="admin_content">
            <form class="form-horizontal" action="/admin/qna" method="post">
              <div class="form-group">
                <label class="col-sm-1 control-label" for="question_title">제목</label>
                <div class="col-sm-4">
                    <input class="form-control" type="text" name="question_title" id="question_title" placeholder="제목을 입력하세요.">
                </div>
                <label class="col-sm-1 control-label" for="question_type">질문유형</label>
                <div class="col-sm-4">
                    <label class="radio-inline">
                        <input type="radio" name="question_type" id="question_type" value="제품 문의">제품 문의
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="question_type" id="question_type" value="작가 문의">작가 문의
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="question_type" id="question_type" value="신고">신고
                    </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-1 control-label" for="search_date">작성일</label>
                <div class="col-sm-2">
                    <select class="form-control search_date_year" name="search_date_year" id="search_date">
                        <option value="0">Year</option>
                        <option value="2019">2019년</option>
                        <option value="2018">2018년</option>
                    </select>
                </div>
                <div class="col-sm-2">
                    <select class="form-control search_date_month" name="search_date_month" id="search_date">
                        <option value="0">Month</option>
                        <option value="01">01월</option>
                        <option value="02">02월</option>
                        <option value="03">03월</option>
                        <option value="04">04월</option>
                        <option value="05">05월</option>
                        <option value="06">06월</option>
                        <option value="07">07월</option>
                        <option value="08">08월</option>
                        <option value="09">09월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                    </select>
                </div>
                <label class="col-sm-1 control-label" for="answer_status">답변 상태</label>
                <div class="col-sm-4">
                    <select class="form-control" name="answer_status" id="answer_status">
                        <option value="">Status</option>
                        <option value="답변대기">답변대기</option>
                        <option value="완료">완료</option>
                    </select>
                </div>
              </div>
              <div class="form-group member_search_btn">
                 <div class="col-sm-1 col-sm-offset-1">
                   <input class="btn btn-default btn-block q_search_btn anal_search_btn" type="submit" value="검색">
                 </div>
              </div>
            </form>
          </div>
        <!-- Question List -->
        <h2>Question List</h2>
        <div class="admin_content">
            <table class="table table-striped table-hover">
              <thead class="membertable">
                  <tr>
                      <th class="th_one"><input type="checkbox" id="allselectedcheckbox"></th>
                      <th class="th_one_left">No</th>
                      <th class="th_two">제목</th>
                      <th class="th_three">작성자</th>
                      <th class="th_four">작성일</th>
                      <th class="th_five">답변상태</th>
                  </tr>
              </thead>
              <tbody>
                <c:forEach var="i" items="${list }" varStatus="status">
                  <tr>
                    <td class="qna_td_one"><input type="checkbox" name="deletechkbox" value="${i.question_no }"></td>
                    <td><c:out value="${status.count }"/></td>
                    <td><a href="/admin/answer/${i.question_no }"><c:out value="${i.question_title }"/></a></td>
                    <td><c:out value="${i.user_name }"/></td>
                    <td><c:out value="${i.question_date }"/></td>
                    <td><c:out value="${i.answer_status }"/></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
                    
          <!-- Paging Block -->
          <div class="pagination_block">
			  <form action="/admin/qna" method="post">
			  	  <c:if test="${list != null }">
			  	  
					<!-- 검색 값 -->
			 		<c:forEach var="test" items="${test }" varStatus="status">
			 		<c:if test="${test.value != null }">
			 			<input type="hidden" name="${test.key }" value="${test.value }">
			 		</c:if>
					</c:forEach>
							
					<c:if test="${paging.startblock > 1 }">
						<a href="#">◀</a>
					</c:if>
					<c:forEach var="i" begin="${paging.startblock }" end="${paging.endblock }">
						<c:if test="${i == paging.currpage }">
							<button class="btn"><c:out value="${i }"></c:out></button>
						</c:if>
						<c:if test="${i != paging.currpage }">
							<input type="submit" class="btn btn-default" name="curr" value="${i }">
						</c:if>
					</c:forEach>
					<c:if test="${paging.endblock < paging.totalpage }">
						<a href="#">▶</a>
					</c:if>
				  </c:if>
			  </form>
		  </div>
        <div class="row">
        	<div class="col-sm-1">
        		<button class="btn btn-default btn-block" id="delete_all_btn">삭제</button>
        	</div>
        </div>
        </div>
<script>
$('.anal_search_btn').click(function() {
	if ($('.search_date_year').val() != 0 && $('.search_date_month').val() == 0) {
		alert('검색할 달을 선택해주세요.');
		$('.search_date_year').val(0);
	}
	if ($('.search_date_month').val() != 0 && $('.search_date_year').val() == 0) {
		alert('검색할 연도를 선택해주세요');
		$('.search_date_month').val(0);
	}
});
	$('#allselectedcheckbox').click(function() {
		var checkall = $(this).is(":checked");
		if(checkall == true) {
			$('input:checkbox').attr("checked", true);
		} else {
			$('input:checkbox').attr("checked", false);
		}
	});
	$('.q_search_btn').click(function() {
		if ($('.search_date_year').val() != 0 && $('.search_date_month').val() == 0) {
			alert('검색할 달을 선택해주세요.');
			$('.search_date_year').val(0);
		}
		if ($('.search_date_month').val() != 0 && $('.search_date_year').val() == 0) {
			alert('검색할 연도를 선택해주세요');
			$('.search_date_month').val(0);
		}
	});
	var sendvalue = "";
	$('#delete_all_btn').click(function() {
		$('input:checkbox[name="deletechkbox"]').each(function() {
			var tf = $(this).is(":checked");
			if (tf == true) sendvalue += $(this).val() + ",";
		});
		location.href = "/admin/deleteallquestion?deleteall=" + sendvalue;
	});
</script>
</body>
</html>