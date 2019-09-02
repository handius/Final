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
    .member_search_btn {
        padding: 20px 0 0;
        margin: 0;
    }
    .admin_content p {
        margin-bottom: 30px;
    }
    .product_delete_span {
    	margin-right: 20px;
    }
    .product_delete_span_xbutton {
    	cursor: pointer;
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
           <p>(최대 4장, 권장 사이즈 500*800)</p>
        <div class="admin_content mainsettemplate">
        
        	<!-- TEMPLATE 5 -->
            <form class="form-horizontal" action="/admin/template1" method="post" enctype="multipart/form-data"
                  name="template1">
            
              <!-- 첫번째 사진 -->
              <div class="form-group">
                <label class="col-sm-1 control-label" for="ex_filename">사진 1</label>
                <div class="col-sm-3">
                    <input type="file" name="imagefile" id="ex_filename" required="required"
                           nncheck="true" nnname="사진1을 업로드해주세요">
                </div>
                <label class="col-sm-1 control-label" for="img1Link">링크</label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" name="img_link" id="img1Link" class="img_link"
                           placeholder="연결할 링크를 입력하세요." nncheck="true" nnname="사진1의 링크를 입력해주세요">
                </div>
              </div>
              
              <!-- 두번째 사진 -->
              <div class="form-group">
                <label class="col-sm-1 control-label" for="img2">사진 2</label>
                <div class="col-sm-3">
                    <input type="file" name="imagefile" id="ex_filename" required="required"
                           nncheck="true" nnname="사진2을 업로드해주세요">
                </div>
                <label class="col-sm-1 control-label" for="img2Link">링크</label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" name="img_link" id="img2Link" class="img_link"
                           placeholder="연결할 링크를 입력하세요." nncheck="true" nnname="사진2의 링크를 입력해주세요">
                </div>
              </div>
              
              <!-- 세번째 사진 -->
              <div class="form-group">
                <label class="col-sm-1 control-label" for="img3">사진 3</label>
                <div class="col-sm-3">
                    <input type="file" name="imagefile" id="ex_filename"required="required"
                           nncheck="true" nnname="사진3을 업로드해주세요">
                </div>
                <label class="col-sm-1 control-label" for="img3Link">링크</label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" name="img_link" id="img3Link" class="img_link" placeholder="연결할 링크를 입력하세요."
                           placeholder="연결할 링크를 입력하세요." nncheck="true" nnname="사진3의 링크를 입력해주세요">
                </div>
              </div>
              
              <!-- 네번째 사진 -->
              <div class="form-group">
                <label class="col-sm-1 control-label" for="img4">사진 4</label>
                <div class="col-sm-3">
                    <input type="file" name="imagefile" id="ex_filename" required="required"
                           nncheck="true" nnname="사진4을 업로드해주세요">
                </div>
                <label class="col-sm-1 control-label" for="img4Link">링크</label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" name="img_link" id="img4Link" class="img_link" placeholder="연결할 링크를 입력하세요."
                           placeholder="연결할 링크를 입력하세요." nncheck="true" nnname="사진4의 링크를 입력해주세요">
                </div>
              </div>
              
              <!-- 버튼 -->
              <div class="form-group member_search_btn">
                 <div class="col-sm-1 col-sm-offset-1">
                   <button class="btn btn-default btn-block" id="template1-btn">저장</button>
                 </div>
              </div>
            </form>
            
          </div>
          
        <!-- TEMPLATE 3 -->
        <h4>Main Page Image</h4>
        <p>(최대 1장, 권장 사이즈 700*800)</p>
        <div class="admin_content mainsettemplate">
            <form class="form-horizontal" action="/admin/template1" method="post"
                  enctype="multipart/form-data" name="template3">
            
              <!-- 첫번째 사진 -->
              <div class="form-group">
                <label class="col-sm-1 control-label" for="img">사진 1</label>
                <div class="col-sm-3">
                    <input type="file" name="imagefile" id="ex_filename" required="required"
                           nncheck="true" nnname="사진을 업로드해주세요">
                </div>
                <label class="col-sm-1 control-label" for="imgLink">링크</label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" name="img_link" id="imgLink" class="img_link"
                           placeholder="연결할 링크를 입력하세요." nncheck="true" nnname="링크를 입력해주세요">
                </div>
              </div>
              <!-- 버튼 -->
              <div class="form-group member_search_btn">
                 <div class="col-sm-1 col-sm-offset-1">
                   <button class="btn btn-default btn-block" id="template3-btn">저장</button>
                 </div>
              </div>
            </form>
          </div>
	</div>
<script>
	
	$('.productsubmitbutton').click(function() {
		alert("템플릿 설정이 완료되었습니다.");
	});

	$(document).on("click", ".product_delete_span_xbutton", function() {
		$(this).parents('span').next().remove();
		$(this).parents('span').remove();
	});

	//템플릿 필수 항목 체크
	function value_check(fromName) {
		var formObj = $('form[name=' + fromName + ']');
		var objs = formObj.find('[nncheck]');
		
		for(let i = 0; i < objs.length; i++) {
			if(objs.eq(i).val() == '') {
				alert(objs.eq(i).attr("nnname"));
				objs.eq(i).focus();
				
				return false;
			}
		}
		return true;
	}

	//템플릿1 이미지 업로드
    $('#template1-btn').click(function(event) {
    	event.preventDefault();
    	if(value_check("template1")) {
    		// 사진
  	    	var file1 = $('input[name=imagefile]')[0].files[0];
	    	var file2 = $('input[name=imagefile]')[1].files[0];
	    	var file3 = $('input[name=imagefile]')[2].files[0];
	    	var file4 = $('input[name=imagefile]')[3].files[0];
	    	console.log(file1.name);
	    	console.log(file2.name);
	    	console.log(file3.name);
	    	console.log(file4.name);  
	    	// 링크
	    	var file1_link = $('#img1Link').val();
	    	var file2_link = $('#img2Link').val();
	    	var file3_link = $('#img3Link').val();
	    	var file4_link = $('#img4Link').val();
	    	console.log(file1_link);
	    	console.log(file2_link);
	    	console.log(file3_link);
	    	console.log(file4_link);
	    	// formData
	    	var formData = new FormData();
	    	formData.append("main_view_no", 23);
	    	formData.append("imagefile", file1);
	    	formData.append("imagefile", file2);
	    	formData.append("imagefile", file3);
	    	formData.append("imagefile", file4);
	    	formData.append("main_image_link", file1_link);
	    	formData.append("main_image_link", file2_link);
	    	formData.append("main_image_link", file3_link);
	    	formData.append("main_image_link", file4_link);

			// ajax upload
			$.ajax({
				type        : 'POST',
				enctype     : 'multipart/form-data',
				url         : "/admin/imgtemplate",
				data        : formData,
				processData : false,
				contentType : false,
				success     : function(data) {
								  alert("템플릿 설정이 완료되었습니다.");
							  },
				error       : function() {
								  alert("템플릿 설정에 실패했습니다.");
							  }
			});
			$('form[name=template1]').find('input').val('');
    	}
	});

	//템플릿3 이미지 업로드
    $('#template3-btn').click(function(event) {
    	event.preventDefault();
    	if(value_check("template3")) {
    		// 사진
  	    	var file = $('input[name=imagefile]')[4].files[0];
	    	console.log(file.name);
	    	// 링크
	    	var file_link = $('#imgLink').val();
	    	console.log(file_link);
	    	// formData
	    	var formData = new FormData();
	    	formData.append("main_view_no", 24);
	    	formData.append("imagefile", file);
	    	formData.append("main_image_link", file_link);

			// ajax upload
			$.ajax({
				type : 'POST',
				enctype : 'multipart/form-data',
				url : "/admin/imgtemplate",
				data : formData,
				processData : false,
				contentType : false,
				success : function(data) {
					alert("템플릿 설정이 완료되었습니다.");
				},
				error : function() {
					alert("템플릿 설정에 실패했습니다.");
				}
			});
			
			$('form[name=template3]').find('input').val('');
    	}
	});
	
</script>
</body>
</html>