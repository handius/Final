<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', '통합', '10대', '20대', '30대', '여성', '남성'],
          ['2004',  100,    100,      80,     40,    50,    20],
          ['2005',  20,      70,      100,     20,    70,    30],
          ['2006',  40,      60,       90,     100,   80,    90],
          ['2007',  80,      30,      40,       30,   100,   100]
        ]);

        var options = {
          title: '검색어 분석 차트',
          legend: { position: 'right' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('data_chart'));

        chart.draw(data, options);
      }
</script>
<title>Insert title here</title>
<style>
	body{
		background-color: #F0E5DE;
	}
	h2{
		display: inline;
	}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6">
				<h2>검색어 분석</h2>
				<span>현재 검색어 : </span><span class="value">핸드 메이드</span>
			</div>
			<div class="col-md-offset-3 col-md-3">
				<form class="form-inline" role="form" method="post">
					<div class="form-group">
						<input type="text" name="search" class="form-control" id="search" placeholder="검색어 등록">
						<input type="button" class="btn btn-default" value="등록">
					</div>
				</form>
			</div>
		</div>
		<hr>
		<div class="row">
			<div id="data_chart" style="width: 1200px; height: 500px"></div>
		</div>
		<div class="row">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>검색어 관심도 검색</th>
						<th>오 늘</th>
						<th>지난 주</th>
						<th>2주 전</th>
						<th>3주 전</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>(통합)</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>10대</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>20대</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>30대</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>여성</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>남성</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<p>※위 데이터는 3주간 검색량을 비교하여 가장 큰 값을 100으로 산정하여 나타낸 상댓값을 표시합니다.</p>
		</div>
	</div>
</body>
</html>