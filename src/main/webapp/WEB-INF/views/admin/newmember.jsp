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
        width: 10%;
    }
    .member_search_btn {
        padding: 20px 0 0;
        margin: 0;
    }
    .Analysistable {
        margin-top: 30px;
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
        <h2>Analysis New Member</h2>
        <div class="admin_content">
            <form class="form-horizontal" action="/admin/analnewmember" method="post">
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
                   <input class="btn btn-default btn-block anal_search_btn" type="submit" value="검색">
                 </div>
              </div>
            </form>
        </div>
        <h2>New Member Chart</h2>
        <div class="admin_content">
        
          <div id="chart_div"></div>
          
        </div>
        <h2>New Member Table</h2>
        <div class="admin_content">
          <div class="row">
              <div class="col-sm-3 col-sm-offset-9">
              	<form action="/exceldown" method="post">
              	 <input type="hidden" name="search" value="${tochar }">
                 <input type="submit" class="btn btn-default btn-lg btn-block" value="Excel Download">
              	</form>
              </div>
          </div>
            <table class="Analysistable table table-striped">
              <thead class="membertable">
                  <tr>
                      <th class="th_one">가입일</th>
                      <th class="th_two">신규가입자 수</th>
                  </tr>
              </thead>
              <tbody>
                <c:forEach var="i" items="${list }">
                  <tr>
                      <td class="joinday_data"><c:out value="${i.join_date }"/></td>
                      <td class="joincount_data"><c:out value="${i.join_count }"/></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
        </div>
        <span id="getjsondata" data-chartvalue="${chart }"></span>
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

var jsondata = $('#getjsondata').data("chartvalue");

google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {
	    
      var data = new google.visualization.DataTable();
      data.addColumn('number', 'X');
      data.addColumn('number', 'New Member');
      
      data.addRows(jsondata);
/*       data.addRows([
        [0, 10],  [1, 10],  [2, 23],  [3, 17],  [4, 18],  [5, 9],
        [6, 11],  [7, 27],  [8, 33],  [9, 40],  [10, 32], [11, 35],
        [12, 30], [13, 30], [14, 42], [15, 47], [16, 44], [17, 48],
        [18, 52], [19, 54], [20, 42], [21, 55], [22, 56], [23, 57],
        [24, 60], [25, 50], [26, 52], [27, 51], [28, 49], [29, 53],
        [30, 55], [31, 60]
      ]); */

      var options = {
        hAxis: {
          title: 'Date'
        },
        vAxis: {
          title: 'Join'
        },
        width: 1000,
        height: 300,
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
</script>
</body>
</html>