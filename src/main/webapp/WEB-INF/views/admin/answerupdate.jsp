<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/admin/answermodify/${dto.question_no }" method="post">
      <textarea id="summernote" name="answer_content" class="form-control answerbtn">
    	${dto.answer_content }
      </textarea>
	  <div class="row">
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
	<script>
	// 섬머노트
      $('#summernote').summernote({
        height: 300
      });
	</script>
</body>
</html>