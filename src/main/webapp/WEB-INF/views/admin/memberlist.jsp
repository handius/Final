<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <title>ADMIN PAGE</title>
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
    .membertable tr th.th_one {
        width: 5%;
    }
    .membertable tr th.th_two {
        width: 10%;
    }
    .membertable tr th.th_three {
        width: 30%;
    }
    .membertable tr th.th_four {
        width: 20%;
    }
    .membertable tr th.th_five {
        width: 30%;
    }
    .membertable tr th.th_six {
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
        <h2>Member Search</h2>
        <div class="admin_content">
            <form class="form-horizontal" action="/admin" method="post">
              <div class="form-group">
                <label class="col-sm-1 control-label" for="user_name">회원 이름</label>
                <div class="col-sm-4">
                    <input class="form-control" type="text" name="user_name" id="user_name" placeholder="이름을 입력하세요.">
                </div>
<!--                 
                <label class="col-sm-1 control-label" for="id2">성별</label>
                <div class="col-sm-4">
                    <label class="radio-inline">
                        <input type="radio" name="name" id="id2" value="man" checked>남
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="name" id="id2" value="woman">여
                    </label>
                </div>
 -->                
              </div>
              <div class="form-group">
                <label class="col-sm-1 control-label" for="search_date">가입일</label>
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
                <label class="col-sm-1 control-label" for="user_authority">회원 구분</label>
                <div class="col-sm-4">
                    <select class="form-control" name="user_authority" id="user_authority">
                        <option>ROLE</option>
                        <option value="ROLE_USER">인증필요</option>
                        <option value="ROLE_MEMBER">회원</option>
                        <option value="ROLE_SELLER">작가</option>
                    </select>
                </div>
              </div>
              <div class="form-group member_search_btn">
                 <div class="col-sm-1 col-sm-offset-1">
                   <input class="btn btn-default btn-block anal_search_btn" type="submit" value="검색">
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
	  			<c:forEach var="i" varStatus="status" items="${memberList }">
                  <tr>
                      <td><c:out value="${status.count }"/></td>
                      <td>
                        <c:if test="${i.user_authority == 'ROLE_SELLER' }">작가</c:if>
                        <c:if test="${i.user_authority == 'ROLE_MEMBER' }">회원</c:if>
                        <c:if test="${i.user_authority == 'ROLE_USER' }">인증필요</c:if>
                        <c:if test="${i.user_authority == 'ROLE_ADMIN' }">관리자</c:if>
                      </td>
                      <td><c:out value="${i.user_name }"/></td>
                      <td><c:out value="${i.user_id }"/></td>
                      <td><c:out value="${i.user_regidate }"/></td>
                      <td><button class="btn btn-default btn-xs gomemberdetail" value="${i.member_no }">관리</button></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
            
          <!-- Paging Block -->
		<c:if test="${paging.totalcount == 0 }">
          <div class="pagination_block">
			<p>검색결과가 없습니다.</p>          
          </div>
        </c:if>
          <div class="pagination_block">
		  <form action="/admin" method="post">
		  	  <c:if test="${paging.totalcount != 0 }">
		  	  
				<!-- 검색 값 -->
		 		<c:forEach var="test" items="${test }" varStatus="status">
		 		<c:if test="${test.value != null }">
		 			<input type="hidden" name="${test.key }" value="${test.value }">
		 		</c:if>
				</c:forEach>
						
				<!-- 페이징 -->
				<c:if test="${paging.startblock > 1 }">
					<button class="btn btn-default" name="curr" value="${paging.startblock - 1 }">◀</button>
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
					<button class="btn btn-default" name="curr" value="${paging.endblock + 1 }">▶</button>
				</c:if>
			  </c:if>
		  </form>
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
	$('.gomemberdetail').on('click', function() {
		location.href="/admin/memberdetail/" + $(this).val();
	});
</script>
</body>
</html>