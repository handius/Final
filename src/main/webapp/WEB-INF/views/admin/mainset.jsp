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
    .admin_content_wrap {
        background-color: white;
        border: 1px solid #D9D4CF;
        border-radius: 5px;
        width: 1620px;
        padding: 20px 30px;
        margin-top: 8px;
        margin-left: 270px;
    }
    .member_search_btn {
        padding: 20px 0 0;
        margin: 0;
    }
    .admin_content p {
        margin-bottom: 30px;
    }
    /**/
    .admin_content {
        margin: 10px 0 50px;
        border-top: 1px solid #D9D4CF;
        border-bottom: 1px solid #D9D4CF;
        padding: 30px 15px;
    }
    .mainsettemplate {
        border: 1px solid #D9D4CF;
        border-radius: 5px;
    }
</style>
</head>
<body>
        <h2>Main Page Setting</h2>
        <div class="admin_content">
           <h4>Main Page Slide</h4>
           <p>(최대 4장, 권장 사이즈 1980*600)</p>
        <div class="admin_content mainsettemplate">
            <form class="form-horizontal" action="" method="post">
              <div class="form-group">
                <label class="col-sm-1 control-label" for="id2">사진 1</label>
                <div class="col-sm-2">
                    <input type="file">
                </div>
                <label class="col-sm-1 control-label" for="id1">링크</label>
                <div class="col-sm-3">
                    <input class="form-control" type="text" name="" id="id1" placeholder="이름을 입력하세요.">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-1 control-label" for="id2">사진 2</label>
                <div class="col-sm-2">
                    <input type="file">
                </div>
                <label class="col-sm-1 control-label" for="id1">링크</label>
                <div class="col-sm-3">
                    <input class="form-control" type="text" name="" id="id1" placeholder="이름을 입력하세요.">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-1 control-label" for="id2">사진 3</label>
                <div class="col-sm-2">
                    <input type="file">
                </div>
                <label class="col-sm-1 control-label" for="id1">링크</label>
                <div class="col-sm-3">
                    <input class="form-control" type="text" name="" id="id1" placeholder="이름을 입력하세요.">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-1 control-label" for="id2">사진 4</label>
                <div class="col-sm-2">
                    <input type="file">
                </div>
                <label class="col-sm-1 control-label" for="id1">링크</label>
                <div class="col-sm-3">
                    <input class="form-control" type="text" name="" id="id1" placeholder="이름을 입력하세요.">
                </div>
              </div>
              <div class="form-group member_search_btn">
                 <div class="col-sm-1 col-sm-offset-1">
                   <input class="btn btn-default btn-block" type="submit" value="저장">
                 </div>
              </div>
            </form>
          </div>
           <h4>Main Product Template 1</h4>
           <p>(최대 3상품)</p>
        <div class="admin_content mainsettemplate">
            <form class="form-horizontal" action="" method="post">
              <div class="form-group">
                <label class="col-sm-1 control-label" for="id11">사용 여부</label>
                <div class="col-sm-2">
                    <label class="radio-inline">
                        <input type="radio" name="name" id="id11" value="use" checked>사용
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="name" id="id11" value="disuse">미사용
                    </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-1 control-label" for="id22">전시명</label>
                <div class="col-sm-3">
                    <input class="form-control" type="text" name="" id="id22" placeholder="이름을 입력하세요.">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-1 control-label" for="product_template-1">전시 작품</label>
                <div class="col-sm-3">
                    <input type="button" class="btn btn-default" name="" id="product_template-1" value="작품선택">
                </div>
              </div>
              <div class="form-group member_search_btn">
                 <div class="col-sm-1 col-sm-offset-1">
                   <input class="btn btn-default btn-block" type="submit" value="저장">
                 </div>
              </div>
            </form>
          </div>
          
           <h4>Main Page Image</h4>
           <p>(최대 4장, 권장 사이즈 1980*600)</p>
        <div class="admin_content mainsettemplate">
            <form class="form-horizontal" action="" method="post">
              <div class="form-group">
                <label class="col-sm-1 control-label" for="id2">사진</label>
                <div class="col-sm-2">
                    <input type="file">
                </div>
                <label class="col-sm-1 control-label" for="id1">링크</label>
                <div class="col-sm-3">
                    <input class="form-control" type="text" name="" id="id1" placeholder="이름을 입력하세요.">
                </div>
              </div>
              <div class="form-group member_search_btn">
                 <div class="col-sm-1 col-sm-offset-1">
                   <input class="btn btn-default btn-block" type="submit" value="저장">
                 </div>
              </div>
            </form>
          </div>

           <h4>Main Product Template 2</h4>
           <p>(최대 3상품)</p>
        <div class="admin_content mainsettemplate">
            <form class="form-horizontal" action="" method="post">
              <div class="form-group">
                <label class="col-sm-1 control-label" for="id11">사용 여부</label>
                <div class="col-sm-2">
                    <label class="radio-inline">
                        <input type="radio" name="name" id="id11" value="use" checked>사용
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="name" id="id11" value="disuse">미사용
                    </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-1 control-label" for="id22">전시명</label>
                <div class="col-sm-3">
                    <input class="form-control" type="text" name="" id="id22" placeholder="이름을 입력하세요.">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-1 control-label" for="product_template-1">전시 작품</label>
                <div class="col-sm-3">
                    <input type="button" class="btn btn-default" name="" id="product_template-1" value="작품선택">
                </div>
              </div>
              <div class="form-group member_search_btn">
                 <div class="col-sm-1 col-sm-offset-1">
                   <input class="btn btn-default btn-block" type="submit" value="저장">
                 </div>
              </div>
            </form>
          </div>          

           <h4>Main Product Template 3</h4>
           <p>(최대 3상품)</p>
        <div class="admin_content mainsettemplate">
            <form class="form-horizontal" action="" method="post">
              <div class="form-group">
                <label class="col-sm-1 control-label" for="id11">사용 여부</label>
                <div class="col-sm-2">
                    <label class="radio-inline">
                        <input type="radio" name="name" id="id11" value="use" checked>사용
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="name" id="id11" value="disuse">미사용
                    </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-1 control-label" for="id22">전시명</label>
                <div class="col-sm-3">
                    <input class="form-control" type="text" name="" id="id22" placeholder="이름을 입력하세요.">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-1 control-label" for="product_template-1">전시 작품</label>
                <div class="col-sm-3">
                    <input type="button" class="btn btn-default" name="" id="product_template-1" value="작품선택">
                </div>
              </div>
              <div class="form-group member_search_btn">
                 <div class="col-sm-1 col-sm-offset-1">
                   <input class="btn btn-default btn-block" type="submit" value="저장">
                 </div>
              </div>
            </form>
          </div>
        </div>
<script>
    
</script>
</body>
</html>