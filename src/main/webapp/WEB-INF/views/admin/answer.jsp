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
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<style>
    * {
        font-family: 'Comfortaa', '맑은 고딕', cursive;
    }
    body {
        background-color: #F0E5DE;
    }
    .memberdetailtable tr td.td_one {
        width: 10%;
        text-align: center;
        background-color: #f9f9f9;
        font-weight: bold;
    }
    .memberdetailtable tr td.td_two {
        width: 35%;
    }
    .memberdetailtable tr td.td_three {
        padding: 10px;
    }
    .settablepaddingzero {
        margin-bottom: 10px;
    }
    .answerbtn {
        margin-bottom: 10px;
    }
    .answerpadding {
        padding: 10px;
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
        <h2>Answer</h2>
        <div class="admin_content">
            <table class="table table-bordered table-condensed settablepaddingzero">
              <tbody class="memberdetailtable">
                  <tr>
                      <td class="td_one">제목</td>
                      <td class="td_two"><c:out value="${dto.question_title }"/></td>
                      <td class="td_one">작성자</td>
                      <td class="td_two"><c:out value="${dto.user_name }"/></td>
                  </tr>
                  <tr>
                      <td class="td_one">작성일</td>
                      <td class="td_two"><c:out value="${dto.question_date }"/></td>
                      <td class="td_one">답변상태</td>
                      <td class="td_two"><c:out value="${dto.answer_status }"/></td>
                  </tr>
                  <tr>
                    <td class="td_three" colspan="4">
                        <c:out value="${dto.question_content }"/>
                    </td>
                  </tr>
              </tbody>
            </table>
            <form>
              <c:if test="${dto.answer_status == '답변 대기' }">
                <textarea id="summernote" class="form-control answerbtn">
                
                </textarea>
              </c:if>
              <c:if test="${dto.answer_status == '완료' }">
              	<c:out value="${dto.answer_content }"/>
              </c:if>
                <div class="form-group row">
                	<div class="col-sm-2">
                        <input type="button" class="btn btn-default btn-block answerpadding gobackqlist_btn" value="리스트로">
                	</div>
                    <div class="col-sm-2 col-sm-offset-6">
                        <button class="btn btn-default btn-block answerpadding delete_question_btn" value="${dto.question_no }">문의삭제</button>
                    </div>
                    <div class="col-sm-2">
                        <input type="submit" class="btn btn-default btn-block answerpadding" value="답변등록">
                    </div>
                </div>
            </form>
        </div>
<script>
$('.gobackqlist_btn').click(function() {
	location.href = "/admin/qna";
	return false;
});
$('.delete_question_btn').click(function() {
 	var result = confirm('정말 삭제하시겠습니까?');
	if (result) { 
		location.href = "/admin/deletequestion/" + $(this).val();
	} else {
		
	}
	return false;
});
      $('#summernote').summernote({
        height: 300
      });
</script>
</body>
</html>