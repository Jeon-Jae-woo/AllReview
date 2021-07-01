<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; UTF-8"); %>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰(게시글) 작성</title>

<script type="text/javascript">

	
</script>

<style type="text/css">

.title{
	position: absolute;
	float: left;
	left: 9%;
	top: 500px;

}

 #totalbox{
	border: 1px solid gray;
	height: 700px;
	left: 9%;
	top: 480px;

}

.form-group{
	left: 5px;
}

 
.star{
	position: absolute;
	float: left;
	left: 37%;
	top: 945px;
	
}


</style>

</head>
<body>
	
	<!-- header -->
	<%@ include file="../Fix/header.jsp" %>
	
	<div class="title">
		<h3>영화 리뷰 작성</h1>
	</div>
	
	<!-- 리뷰(게시글) 작성 -->
	
		<div class="container col-sm-6 text-center" id="totalbox">
		
		<!-- 업데이트 해야함 -->
				<form class="form-horizontal" action="" method="post">
					<div class="row" style="margin-top:20px; border:1px dashed red;">
						<!-- 제목, 카테고리 -->
		  					<div class="form-group" style="margin-top:25px;">
		    					<label for="inputEmail" class="col-sm-2 control-label">제목</label>
					    	<div class="col-sm-4">
					      		<input type="text" class="form-control" id="inputEmail" aria-describedby="sizing-addon2">
					    	</div>
								<label for="category" class="col-sm-2 control-label">카테고리</label>
							<div class="col-sm-3">
								<select class="form-control">
									<option>액션</option>
			    					<option>공포/스릴러</option>
			    					<option>SF/판타지</option>
			    					<option>드라마/로맨스</option>
			    					<option>다큐멘터리</option>
			    					<option>애니메이션</option>
								</select>
							</div>
					</div>
					<!-- 내용 -->
					<div class="container col-sm-12" style="height:250px;">
						<div class="form-group" style="margin-top:20px;">
					    	<label for="notice_content" class="col-sm-2 control-label">내용</label>
					    		<div class="col-sm-7">
					      			<textarea class="form-control" rows="9" cols="11" id="notice_content"></textarea>
					    		</div>	
						 </div>
					</div>
					<!-- 내용 파일 업로드  -->
					<div class="container col-sm-12" style="height:60px;">
						<div class="form-group" style="margin-top:10px;">
							<label for="" class="col-sm-2 control-label">파일 업로드</label>
								<div class="col-sm-3">
									<div class="form-group">
			  							<input type="file" id="ex_file"> 
									</div>
					    		</div>
					 	</div>
					</div>
					<!-- 영수증 파일 업로드 -->
					<div class="container col-sm-12" style="height:60px;">
						<div class="form-group" style="margin-top:10px;">
							<label for="" class="col-sm-2 control-label">관람 인증 업로드</label>
								<div class="col-sm-3">
									<div class="form-group">
			  							<input type="file" id="ex_file"> 
									</div>
					    		</div>
					 	</div>
					</div>

					
					
					<!-- 제출 -->
					<div class="container col-sm-12" style="height:100px; margin-top:40px;">
						<div class="form-group" style="margin-top:10px;">
							<button type="submit" class="btn btn-primary" style="margin-right:20px;" onclick="location='MovieDetail.jsp'">글작성 </button>
							<button type="submit" class="btn btn-primary" onclick="location='MovieList.jsp'">취소 </button>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<!-- 별점주기  -->
		<div class="star">
			<label>영화 평점: ★★★★★</label>
		</div>
					
					
					
					
					

	<%@ include file="MovieTop5.jsp" %>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	
	
	<!-- footer -->
	<%@ include file="../Fix/footer.jsp" %>


</body>
</html>