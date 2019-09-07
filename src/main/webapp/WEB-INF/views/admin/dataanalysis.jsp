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
	$(document).on('click', '#provSearcher', function(){
		var searchData = $('#search').val();
		$('#value').text(searchData);
		console.log(searchData);
		$.ajax({
			url:"/insertSearcher?searchData="+searchData
			, type:"GET"
			, dataType:"int"
			, success:function(data){
				if(data != 0){
					console.log("등록 성공!");
				}else{
					console.log("등록 실패!");
				}
				
			}
		});
	})
	
	$(function(){
		var dataarray = [['Year', '통합', '10대', '20대', '30대', '여성', '남성']];
		var today = ["오 늘"];
		var oweek = ["지난 주"];
		var tweek = ["2주 전"];
		var thweek = ["3주 전"];
		var searchText = "";
		var renewal_time = "";
		var nowText = "";
		$.ajax({
			url:"/getsearchTextData"
			, type:"GET"
			, dataType:"json"
			, success:function(data){
				
				$.each(data, function(index, value){
					console.log(value);
					console.log("index : " + index);
					today.push(value.today_data);
					$('td').eq(4*index).text(value.today_data);
					oweek.push(value.oweek_ago_data);
					$('td').eq(4*index+1).text(value.oweek_ago_data);
					tweek.push(value.tweek_ago_data);
					$('td').eq(4*index+2).text(value.tweek_ago_data);
					thweek.push(value.thweek_ago_data);
					$('td').eq(4*index+3).text(value.thweek_ago_data);
					searchText = value.search_text;
					renewal_time = value.renewal_time;
					nowText = value.now_text;
				});	
				dataarray.push(today);
				dataarray.push(oweek);
				dataarray.push(tweek);
				dataarray.push(thweek);
				
				function drawChart() {
			        var data = google.visualization.arrayToDataTable(dataarray);

			        var options = {
			          title: "갱신 시간 : " + renewal_time + " 검색된 데이터 : " + nowText,
			          legend: { position: 'right' },
			          width: 1000,
			        };

			        var chart = new google.visualization.LineChart(document.getElementById('data_chart'));

			        chart.draw(data, options);
				} 
				google.charts.load('current', {'packages':['corechart']});
			    google.charts.setOnLoadCallback(drawChart); 
			    $('#value').text(searchText);
			    
			}
		});
		 
	})
      
      
</script>
<title>Insert title here</title>
<style>
    body {
        background-color: #F0E5DE;
    }
    .admin_content {
        margin: 10px 0 50px;
        border-top: 1px solid #D9D4CF;
        border-bottom: 1px solid #D9D4CF;
        padding: 30px 15px;
    }
    .margin0 {
    	margin: 0;
    }
    #text {
    	width: 300px;
    }
</style>
</head>
<body>
	<h2>Search Analysis</h2>
    	<div class="admin_content">
    	  <div class="row">
    	  <div class="col-sm-4">
			<h3 class="margin0">Search</h3>
			<p>( <span>등록된 검색어 : </span><span id="value"></span> )</p>
		  </div>
    	  <div class="col-sm-4 col-sm-offset-4">
			<form class="form-inline" role="form" method="post">
				<input type="text" name="search" class="form-control" id="search" placeholder="검색어 등록">
				<input type="button" id="provSearcher" class="btn btn-default" value="등록">
			</form>
		  </div>
		  </div>
		<div>
			<div id="data_chart" style="width: 1200px; height: 500px"></div>
		</div>
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
</body>
</html>