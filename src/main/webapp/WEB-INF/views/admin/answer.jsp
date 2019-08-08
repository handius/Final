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
    .admin_content_wrap {
        background-color: white;
        border: 1px solid #D9D4CF;
        border-radius: 5px;
        width: 1620px;
        padding: 20px 30px;
        margin-top: 8px;
        margin-left: 270px;
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
                      <td class="td_two">이샛기가 돈먹고 튀었어요 잡아주세여!!!!</td>
                      <td class="td_one">작성자</td>
                      <td class="td_two">dyttl0</td>
                  </tr>
                  <tr>
                      <td class="td_one">작성일</td>
                      <td class="td_two">2019.08.07 17:16:32</td>
                      <td class="td_one">답변상태</td>
                      <td class="td_two">대기</td>
                  </tr>
                  <tr>
                    <td class="td_three" colspan="4">
                        버튼에 의미를 추가하기 위해 색을 사용하는 것은 시각적인 표시만 제공할 뿐입니다.<br>
                        그것은 스크린리더같은 보조 공학의 사용자들에게는 전달되지 않을 것입니다.<br>
                        색에 의한 정보를 콘텐츠 자체에도 나타낼 수 있도록 하세요.
                        그리고 .sr-only 로 텍스트를 숨길수도 있습니다.
                    </td>
                  </tr>
              </tbody>
            </table>
            <form>
                <textarea id="summernote" class="form-control answerbtn">
                
                </textarea>
                <div class="form-group row">
                    <div class="col-sm-1 col-sm-offset-10">
                        <input type="button" class="btn btn-default btn-block answerpadding" value="문의삭제">
                    </div>
                    <div class="col-sm-1">
                        <input type="submit" class="btn btn-default btn-block answerpadding" value="답변등록">
                    </div>
                </div>
            </form>
        </div>
<script>
      $('#summernote').summernote({
        height: 300
      });
</script>
</body>
</html>