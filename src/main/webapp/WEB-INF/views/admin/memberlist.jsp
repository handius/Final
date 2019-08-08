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
    .membertable tr th.th_one {
        width: 5%;
    }
    .membertable tr th.th_two {
        width: 10%;
    }
    .membertable tr th.th_three {
        width: 50%;
    }
    .membertable tr th.th_four {
        width: 10%;
    }
    .membertable tr th.th_five {
        width: 20%;
    }
    .membertable tr th.th_six {
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
        <h2>Member Search</h2>
        <div class="admin_content">
            <form class="form-horizontal" action="" method="post">
              <div class="form-group">
                <label class="col-sm-1 control-label" for="id1">회원 이름</label>
                <div class="col-sm-2">
                    <input class="form-control" type="text" name="" id="id1" placeholder="이름을 입력하세요.">
                </div>
                <label class="col-sm-1 control-label" for="id2">성별</label>
                <div class="col-sm-2">
                    <label class="radio-inline">
                        <input type="radio" name="name" id="id2" value="man" checked>남
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="name" id="id2" value="woman">여
                    </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-1 control-label" for="id3">가입일</label>
                <div class="col-sm-1">
                    <select class="form-control" name="" id="id3">
                        <option value="2019">2019년</option>
                        <option value="2018">2018년</option>
                    </select>
                </div>
                <div class="col-sm-1">
                    <select class="form-control" name="" id="id3">
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
                <label class="col-sm-1 control-label" for="id4">회원 구분</label>
                <div class="col-sm-1">
                    <select class="form-control" name="" id="id4">
                        <option value="2019">일반</option>
                        <option value="2018">작가</option>
                    </select>
                </div>
              </div>
              <div class="form-group member_search_btn">
                 <div class="col-sm-1 col-sm-offset-1">
                   <input class="btn btn-default btn-block" type="submit" value="검색">
                 </div>
              </div>
            </form>
          </div>
        <h2>Member List</h2>
        <div class="admin_content">
            <table class="table table-striped table-hover">
              <thead class="membertable">
                  <tr>
                      <th class="th_one">No</th>
                      <th class="th_two">회원 구분</th>
                      <th class="th_three">이름</th>
                      <th class="th_four">아이디</th>
                      <th class="th_five">가입일</th>
                      <th class="th_six">관리</th>
                  </tr>
              </thead>
              <tbody>
                  <tr>
                      <td>1</td>
                      <td>일반</td>
                      <td>정경진</td>
                      <td>dyttl0</td>
                      <td>2019.08.07</td>
                      <td><button class="btn btn-default btn-xs">관리</button></td>
                  </tr>
                  <tr>
                      <td>2</td>
                      <td>작가</td>
                      <td>용지연</td>
                      <td>yongzee</td>
                      <td>2019.08.14</td>
                      <td><button class="btn btn-default btn-xs">관리</button></td>
                  </tr>
                  <tr>
                      <td>3</td>
                      <td>일반</td>
                      <td>문지선</td>
                      <td>Moonjiseon03</td>
                      <td>2019.08.15</td>
                      <td><button class="btn btn-default btn-xs">관리</button></td>
                  </tr>
                  <tr>
                      <td>4</td>
                      <td>일반</td>
                      <td>김민혁</td>
                      <td>Kimbob222</td>
                      <td>2019.08.15</td>
                      <td><button class="btn btn-default btn-xs">관리</button></td>
                  </tr>
                  <tr>
                      <td>5</td>
                      <td>일반</td>
                      <td>윤건일</td>
                      <td>dbsrjsdlf</td>
                      <td>2019.08.15</td>
                      <td><button class="btn btn-default btn-xs">관리</button></td>
                  </tr>
              </tbody>
            </table>
        </div>
<script>

</script>
</body>
</html>