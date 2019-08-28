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
                      <td class="td_two get_user_auth">
                        <c:if test="${detail.user_authority == 'ROLE_SELLER' }">작가</c:if>
                        <c:if test="${detail.user_authority == 'ROLE_MEMBER' }">회원</c:if>
                        <c:if test="${detail.user_authority == 'ROLE_USER' }">인증필요</c:if>
                      </td>
                      <td class="td_one">가입일</td>
                      <td class="td_two"><c:out value="${detail.user_regidate }"/></td>
                  </tr>
                  <tr>
                      <td class="td_one">이름</td>
                      <td class="td_two"><c:out value="${detail.user_name }"/></td>
                      <td class="td_one">아이디</td>
                      <td class="td_two"><c:out value="${detail.user_id }"/></td>
                  </tr>
                  <tr>
                      <td class="td_one">이메일</td>
                      <td class="td_two"><c:out value="${detail.user_email }"/></td>
                      <td class="td_one">핸드폰</td>
                      <td class="td_two"><c:out value="${detail.user_call }"/></td>
                  </tr>
                  <tr>
                      <td class="td_three">주소</td>
                      <td colspan="3" class="td_four"><c:out value="${detail.user_address }"/></td>
                  </tr>
              </tbody>
            </table>
        </div>
        <h2>Member Update</h2>
        <div class="admin_content">
          <form method="post" action="/admin/memberroleupdate">
            <table class="table table-bordered table-condensed">
              <tbody class="memberdetailtable">
                  <tr>
                      <td class="td_five">회원구분</td>
                      <td class="td_two">
                       <div class="col-sm-3">
                        <select class="form-control input-sm" name="user_authority" id="user_authority">
                            <option value="ROLE_MEMBER">일반</option>
                            <option class="ifselleroption" value="ROLE_SELLER">작가</option>
                        </select>
                       </div></td>
                      <td class="td_five">문의내역</td>
                      <td class="td_six"><c:out value="${count }"/>개<a href="/admin/qna?member_no=${detail.member_no }">내역></a></td>
                  </tr>
              </tbody>
            </table>
            <div class="form-group row">
                <div class="col-sm-2">
                    <input type="button" id="gomemberlist" class="btn-default memberupdatebtn_default btn-block" value="리스트로">
                </div>
                <div class="col-sm-2 col-sm-offset-7">
                    <button class="btn-default memberupdatebtn_default btn-block member_delete" value="${detail.member_no }">탈퇴시키기</button>
                </div>
                <div class="col-sm-1">
                	<input type="hidden" name="member_no" value="${detail.member_no }">
                    <input type="submit" class="btn-default memberupdatebtn_default submitblock btn-block" value="저장">
                </div>
            </div>
          </form>
        </div>
<script>
var detail_auth = $.trim($('.get_user_auth').text());
if(detail_auth == '작가') {
	$('.ifselleroption').attr('selected', 'selected');
	$('.ifselleroption').parent().attr('disabled', 'disabled');
}

$('.submitblock').click(function(event) {
	var memberrole = $('#user_authority option:selected').val();
	if(detail_auth == '인증필요' && memberrole == 'ROLE_MEMBER') {
		if(confirm("이메일 인증없이 회원 권한을 주시겠습니까?")) {
			alert("권한이 변경되었습니다.");
		} else {
			event.preventDefault();
		}
	} else if(detail_auth == '회원' && memberrole == 'ROLE_MEMBER') {
		alert("이미 인증된 회원입니다.");
		event.preventDefault();
	} else if(detail_auth == '작가' && memberrole == 'ROLE_SELLER') {
		alert("이미 작가입니다.");
		event.preventDefault();
	} else {
		alert("권한이 변경되었습니다.");
	}
	console.log(detail_auth);
	console.log(memberrole);
})

$('#gomemberlist').on('click', function() {
	location.href="/admin"
});
$('.member_delete').on('click', function() {
 	var result = confirm('정말 탈퇴시키시겠습니까?');
	if (result) { 
 		location.href="/admin/deletemember/" + $(this).val(); 
 	} else {
		
	} 
	return false;
});
</script>
</body>
</html>