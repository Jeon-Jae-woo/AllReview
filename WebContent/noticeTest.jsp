<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<form class="form-horizontal" action="noticeController?command=noticeWrite" method="post" enctype="multipart/form-data">
					<div class="row" style="margin-top:20px;">
						<div class="container col-sm-12" style="height:100px;">
							<!-- 제목, 카테고리 -->
		  					<div class="form-group" style="margin-top:25px;">
		    					<label for="inputEmail" class="col-sm-2 control-label">제목</label>
		    						<div class="col-sm-4">
		      							<input type="text" class="form-control" id="inputEmail" name="title" aria-describedby="sizing-addon2">
		    						</div>
		
						  	</div>
						</div>
						<!-- 업로드  -->
						<div class="container col-sm-12" style="height:60px;">
							<div class="form-group" style="margin-top:10px;">
								<label for="" class="col-sm-2 control-label">업로드</label>
							  	<div class="col-sm-3">
							  		<div class="form-group">
  										<input type="file" id="ex_file" name="file1"> 
									</div>
		    					</div>
		    				</div>
						</div>
						<div class="container col-sm-12" style="height:60px;">
							<div class="form-group" style="margin-top:10px;">
								<label for="" class="col-sm-2 control-label">업로드2</label>
							  	<div class="col-sm-3">
							  		<div class="form-group">
  										<input type="file" id="ex_file" name="file2"> 
									</div>
		    					</div>
		    				</div>
						</div>
						<!-- 제출 -->
						<div class="container col-sm-12" style="height:100px; margin-top:40px;">
							<div class="form-group" style="margin-top:10px;">
								<button type="submit" class="btn btn-primary" style="margin-right:20px;">글작성 </button>
								<button type="submit" class="btn btn-primary">취소 </button>
							</div>
						</div>
					</div>
				</form>
</body>
</html>