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
                <div class="col-sm-2">
                    <input class="form-control" type="text" name="question_title" id="question_title" placeholder="제목을 입력하세요.">
                </div>
                <label class="col-sm-1 control-label" for="question_type">질문유형</label>
                <div class="col-sm-3">
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
                <div class="col-sm-1">
                    <select class="form-control search_date_year" name="search_date_year" id="search_date">
                        <option value="0">Year</option>
                        <option value="2019">2019년</option>
                        <option value="2018">2018년</option>
                    </select>
                </div>
                <div class="col-sm-1">
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
                <div class="col-sm-2">
                    <select class="form-control" name="answer_status" id="answer_status">
                        <option value="">Status</option>
                        <option value="답변 대기">답변 대기</option>
                        <option value="완료">완료</option>
                    </select>
                </div>
              </div>
              <div class="form-group member_search_btn">
                 <div class="col-sm-1 col-sm-offset-1">
                   <input class="btn btn-default btn-block q_search_btn" type="submit" value="검색">
                 </div>
              </div>
            </form>
          </div>
        <h2>Question List</h2>
        <div class="admin_content">
            <table class="table table-striped table-hover">
              <thead class="membertable">
                  <tr>
                      <th class="th_one"><input type="checkbox"></th>
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
                      <td class="qna_td_one"><input type="checkbox"></td>
                      <td><c:out value="${status.count }"/></td>
                      <td><a href="/admin/answer/${i.question_no }"><c:out value="${i.question_title }"/></a> :: <c:out value="${i.question_delete_status }"/></td>
                      <td><c:out value="${i.user_name }"/></td>
                      <td><c:out value="${i.question_date }"/></td>
                      <td><c:out value="${i.answer_status }"/></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
        <div class="row">
        	<div class="col-sm-1">
        		<button class="btn btn-default btn-block">삭제</button>
        	</div>
        </div>
        </div>
<script>
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
</script>
</body>
</html>