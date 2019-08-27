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
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
    * {
        font-family: 'Comfortaa', '맑은 고딕', cursive;
    }
    body {
        background-color: #F0E5DE;
    }
    .membertable tr th.th_one {
        width: 5%;
    }
    .membertable tr th.th_two {
        width: 30%;
    }
    .membertable tr th.th_three {
        width: 10%;
    }
    .member_search_btn {
        padding: 20px 0 0;
        margin: 0;
    }
    .Producttable {
        margin-top: 30px;
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
        <h2>Analysis Popular Product</h2>
        <div class="admin_content">
            <form class="form-horizontal" action="/admin/analproduct" method="post">
              <div class="form-group">
                <label class="col-sm-1 control-label" for="search_date">기간 검색</label>
                <div class="col-sm-4">
                    <select class="form-control search_date_year" name="search_date_year" id="search_date">
                        <option value="0">Year</option>
                        <option value="2019">2019년</option>
                        <option value="2018">2018년</option>
                    </select>
                </div>
                <div class="col-sm-4">
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
            </div>
              <div class="form-group member_search_btn">
                 <div class="col-sm-1 col-sm-offset-1">
                   <input class="btn btn-default btn-block" type="submit" value="검색">
                 </div>
              </div>
            </form>
        </div>
        <h2>Product Table</h2>
        <div class="admin_content">
          <div class="row">
              <div class="col-sm-3 col-sm-offset-9">
              	<form action="/exceldown2" method="post">
              	 <input type="hidden" name="search" value="${tochar }">
                 <button class="btn btn-default btn-lg btn-block">Excel Download</button>
                </form>
              </div>
          </div>
            <table class="Producttable table table-striped">
              <thead class="membertable">
                  <tr>
                      <th class="th_one">판매 순위</th>
                      <th class="th_two">상품명</th>
                      <th class="th_three">판매수량</th>
                      <th class="th_three">판매금액</th>
                      <th class="th_three">상품 카테고리</th>
                  </tr>
              </thead>
              <tbody>
                <c:forEach var="i" items="${list }">
                  <tr>
                      <td><c:out value="${i.rnum }"/></td>
                      <td><c:out value="${i.list_product }"/></td>
                      <td><c:out value="${i.buy_count }"/></td>
                      <td><c:out value="${i.list_base_price }"/></td>
                      <td><c:out value="${i.list_category }"/></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
                                
          <!-- Paging Block -->
          <div class="pagination_block">
			  <form action="/admin/analproduct" method="post">
			  	  <c:if test="${list != null }">
			  	  
					<!-- 검색 값 -->
			 		<input type="hidden" name="tochar" value="${tochar }">
							
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

        </div>
<script>
    
</script>
</body>
</html>