<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
    .pagination_block {
    	text-align: center;
    }
    .fortrpercent td {
    	width: 20%;
    }
</style>
</head>
<body>
        <div class="modal-header">
          <div class="row">
            <div class="col-sm-3">
	          <h5>Category</h5>
	        </div>
            <div class="col-sm-3">
	          <select class="form-control list_category" name="list_category" id="list_category">
	          	<option value="">Category</option>
	          	<option value="book">Book</option>
	          	<option value="accessary">Accessary</option>
	          	<option value="handmade">Handmade</option>
	          	<option value="table">Table</option>
	          	<option value="cup">Cup</option>
	          	<option value="anything">ETC</option>
	          </select>
	        </div>
          </div>
          <div class="row">
            <div class="col-sm-3">
          	  <h5>Product Name</h5>
            </div>
            <div class="col-sm-6">
          	  <input type="text" class="form-control list_product" name="list_product" id="list_product"
          	         placeholder="작품 이름을 입력하세요.">
            </div>
          </div>
          <div class="row">
            <div class="col-sm-3">
          	  <h5>Product Artist</h5>
            </div>
            <div class="col-sm-6">
          	  <input type="text" class="form-control list_artist" name="list_artist" id="list_artist"
          	         placeholder="작가 이름을 입력하세요.">
            </div>
          </div>
          <div class="row">
            <div class="col-sm-2">
            </div>
          </div>
          <div class="row">
            <div class="col-sm-2 col-sm-offset-10">
              <input type="hidden" class="main_view_no" value="${test.main_view_no }">
          	  <button class="btn btn-default btn-block submitbutton">검색</button>
            </div>
          </div>
        </div>
        
        <div class="modal-header">
          <h4 class="modal-title">Product List</h4>
        </div>
        <div class="modal-body">
          <div class="emptyforpaging">
            <table class="Producttable table table-striped">
              <thead class="membertable">
                  <tr>
                      <th class="th_one">No</th>
                      <th class="th_two">Category</th>
                      <th class="th_three">Name</th>
                      <th class="th_three">Artist</th>
                      <th class="th_three">Buy Count</th>
                  </tr>
              </thead>
              <tbody>
                <c:forEach var="i" items="${list }" varStatus="status">
                  <tr class="fortrpercent">
                      <td><c:out value="${status.count}"/></td>
                      <td><c:out value="${i.list_category}"/></td>
                      <td><a class="product_choice" data-dismiss="modal" data-product_pk="${i.list_no}"
                             data-main_view_no="${main_view_no }"><c:out value="${i.list_product}"/></a>
                      </td>
                      <td><c:out value="${i.list_artist}"/></td>
                      <td><c:out value="${i.buy_count}"/></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          
          <!-- Paging Block -->
          <div class="pagination_block">
			  	  <c:if test="${list != null }">
					<!-- 검색 값 -->
			 		<c:forEach var="test" items="${test }" varStatus="status">
			 		<c:if test="${test.value != null }">
			 			<input type="hidden" class="paging${test.key }" name="${test.key }" value="${test.value }">
			 		</c:if>
					</c:forEach>
							
					<c:if test="${paging.startblock > 1 }">
						<a href="#">◀</a>
					</c:if>
					<c:forEach var="i" begin="${paging.startblock }" end="${paging.endblock }">
						<c:if test="${i == paging.currpage }">
							<c:out value="${i }"></c:out>
						</c:if>
						<c:if test="${i != paging.currpage }">
							<button class="btn btn-default paging_btn" name="curr" value="${i }"><c:out value="${i }"/></button>
						</c:if>
					</c:forEach>
					<c:if test="${paging.endblock < paging.totalpage }">
						<a href="#">▶</a>
					</c:if>
				  </c:if>
		  </div>
		  
        </div>
	<script>

	//작품을 템플릿에 추가
	$('.product_choice').click(function(event) {
		if($(this).data('main_view_no') == 2) {
			var child_count = $('#template1_append').children('.product_children').length;
			if (child_count >= 3) {
				alert("전시 작품은 최대 3개까지 입니다.");
			} else {
				$('#template1_append').append('<span class="product_delete_span">' + $(this).text() + '<span class="product_delete_span_xbutton"> x </span></span>'); 
				$('#template1_append').append('<input type="hidden" class="product_children" name="main_view_product" value="' + $(this).data("product_pk") + '">');
			}
			console.log(child_count);
			console.log("??");
		}
		if($(this).data('main_view_no') == 4) {
			var child_count = $('#template2_append').children('.product_children').length;
			if (child_count >= 3) {
				alert("전시 작품은 최대 3개까지 입니다.");
			} else {
				$('#template2_append').append('<span class="product_delete_span">' + $(this).text() + '<span class="product_delete_span_xbutton"> x </span></span>'); 
				$('#template2_append').append('<input type="hidden" class="product_children" name="main_view_product" value="' + $(this).data("product_pk") + '">');
			}
		}
		if($(this).data('main_view_no') == 5) {
			var child_count = $('#template3_append').children('.product_children').length;
			if (child_count >= 3) {
				alert("전시 작품은 최대 3개까지 입니다.");
			} else {
				$('#template3_append').append('<span class="product_delete_span">' + $(this).text() + '<span class="product_delete_span_xbutton"> x </span></span>'); 
				$('#template3_append').append('<input type="hidden" class="product_children" name="main_view_product" value="' + $(this).data("product_pk") + '">');
			}
		}
	});
	
	// 작품 검색 검색
	$('.submitbutton').click(function(event) {
		event.preventDefault();
		
		//get으로 정보 보내려고 씹노가다
		var test = "main_view_no=" + $('.main_view_no').val();
		if($('.list_category').val() != '') {
		    test += "&list_category=" + $('.list_category').val();
		}
		if($('.list_product').val() != '') {
			test += "&list_product=" + $('.list_product').val();
		}
		if($('.list_artist').val() != '') {
			test += "&list_artist=" + $('.list_artist').val();
		}
 		$.ajax({
		    url      : "/admin/productmodal",
		    type     : "GET",
		    data     : test,
		    dataType : "html",
		    success  : function(data) {
		    			   $('#productsearch_append').empty();
		        	       $('#productsearch_append').append(data); 
		    		   },
		    error    : function(data) {
			  		       alert("error");
			           }
		}); 
	});
	</script>
</body>
</html>