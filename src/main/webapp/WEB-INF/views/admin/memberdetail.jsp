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
        width: 10.65%;
        text-align: center;
        background-color: #f9f9f9;
        font-weight: bold;
    }
    .memberdetailtable tr td.td_four {
        width: 85%;
    }
    .memberdetailtable tr td.td_five {
        padding: 10px 0 0 0;
        text-align: center;
        width: 10%;
        background-color: #f9f9f9;
        font-weight: bold;
    }
    .memberdetailtable tr td.td_six {
        padding: 10px 0 0 10px;
        width: 35%;
        border-top: none;
    }
    .settablepaddingzero {
        margin-bottom: 10px;
    }
    .memberupdatebtn_default {
        border: 1px solid #D9D4CF;
        background-color: white;
        padding: 10px;
        border-radius: 5px;
    }
    .td_six > a {
        margin-left: 20px;
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
        <h2>Member Detail</h2>
        <div class="admin_content">
            <table class="table table-bordered table-condensed settablepaddingzero">
              <tbody class="memberdetailtable">
                  <tr>
                      <td class="td_one">회원구분</td>
                      <td class="td_two">일반</td>
                      <td class="td_one">가입일</td>
                      <td class="td_two">2019.08.07</td>
                  </tr>
                  <tr>
                      <td class="td_one">이름</td>
                      <td class="td_two">정경진</td>
                      <td class="td_one">아이디</td>
                      <td class="td_two">dyttl0</td>
                  </tr>
                  <tr>
                      <td class="td_one">이메일</td>
                      <td class="td_two">dyttl0@gmail.com</td>
                      <td class="td_one">핸드폰</td>
                      <td class="td_two">010-4220-1789</td>
                  </tr>
                  <tr>
                      <td class="td_three">주소</td>
                      <td colspan="3" class="td_four">서울특별시 종로구 종로 69 YMCA빌딩 7층</td>
                  </tr>
              </tbody>
            </table>
        </div>
        <h2>Member Update</h2>
        <div class="admin_content">
          <form method="post" action="">
            <table class="table table-bordered table-condensed">
              <tbody class="memberdetailtable">
                  <tr>
                      <td class="td_five">회원구분</td>
                      <td class="td_two">
                       <div class="col-sm-3">
                        <select class="form-control input-sm" name="" id="id3">
                            <option value="2019">일반</option>
                            <option value="2018">작가</option>
                        </select>
                       </div></td>
                      <td class="td_five">문의내역</td>
                      <td class="td_six">0개<a>내역></a></td>
                  </tr>
              </tbody>
            </table>
            <div class="form-group row">
                <div class="col-sm-1">
                    <input type="button" class="btn-default memberupdatebtn_default btn-block" value="리스트로">
                </div>
                <div class="col-sm-1 col-sm-offset-9">
                    <input type="button" class="btn-default memberupdatebtn_default btn-block" value="탈퇴시키기">
                </div>
                <div class="col-sm-1">
                    <input type="submit" class="btn-default memberupdatebtn_default btn-block" value="저장">
                </div>
            </div>
          </form>
        </div>
<script>

</script>
</body>
</html>