<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; UTF-8"); %>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰(게시글) 작성</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

</script>

<style type="text/css">

.title{
	position: absolute;
	float: left;
	left: 9%;
	top: 520px;
}
 .totalbox{
	height: 800px;
	left: 9%;
	width: 60%;
	top: 480px;
	position: relative;
}
.titlebox{
	border: 1px solid gray;
	height: 60px;
	left: 1%;
	width: 98%;
	top: 10px;
	position: relative
}
.contentbox{
	border: 1px solid gray;
	height: 550px;
	left: 1%;
	width: 98%;
	top: 20px;
	position: relative
}
#reviewtitle{
	position: relative;
	top:11px;
	left: 15px;
	width: 40%;
	height: 35px;
}
#content{
	position: relative;
	top:11px;
	left: 15px
}
.bottombox{
	position: relative;
	top: 20px;
}
.imgupload{
	position: relative ;
	top:20px;
	left: 25px;
	width: 250px;
}
.reciptupload{
	position: relative;	
	bottom: 24px;
	left: 260px;
	width: 250px; 
}
.moviegrade{
	position: relative;	
	bottom: 50px;
	left: 600px;
	width: 250px; 
}
.reviewwrite{
	position: relative;
	left: 340px;
	top: 30px;
	width: 80px;
}
.reviewcancel{
	position: relative;
	left: 370px;
	top: 30px;
	width: 80px;
}

</style>

</head>
<body onload="LoadPage();">
	
	<!-- header -->
	<%@ include file="../Fix/header.jsp" %>
	
	<div class="title">
		<h3>영화 리뷰 작성</h3>
	</div>
	
	<!-- 리뷰(게시글) 작성 -->
	<div>
		<div class="totalbox">
			<form action="" method="post">
				<input type="hidden" name="command" value="">
				
				<div class="titlebox">
					<input type="text" name="reviewtitle" id="reviewtitle" placeholder="리뷰 제복을 입력하세요">
				</div>
				<div class="contentbox">
					<textarea rows="25" cols="104" id="content" placeholder="내용을 작성 하세요"></textarea>
				</div>
				<div class="bottombox">
					<div class="imgupload">
						이미지 첨부 : <input type="file" id="ex_file"> 
					</div>
					<div class="reciptupload">
						관람인증 첨부: <input type="file" id="ex_file"> 
					</div>
					<div class="moviegrade">
						영화평점 : <input type="radio" name="moviegrade" value="5">
						<input type="radio" name="moviegrade" value="4">
						<input type="radio" name="moviegrade" value="3">
						<input type="radio" name="moviegrade" value="2">
						<input type="radio" name="moviegrade" value="1">
					</div>
				</div>
				<div class="bottombutton">
					<input class="reviewwrite" type="button" value="등록" onclick="location='MovieList.jsp'">
					<input class="reviewcancel" type="button" value="취소" onclick="location='MovieList.jsp'">
				</div>
					
			</form>
		</div>
	</div>
	
	
	<!-- 리뷰(게시글) 작성 -->
	
		<!-- <div class="container col-sm-6 text-center" id="totalbox"> -->
		
		<!-- 업데이트 해야함 -->
				<!-- <form class="form-horizontal" action="" method="post">
					<div class="row" style="margin-top:20px; border:1px dashed red;">
						제목, 카테고리
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
					</div> -->
					<!-- 내용 -->
					<!-- <div class="container col-sm-12" style="height:250px;">
						<div class="form-group" style="margin-top:20px;">
					    	<label for="notice_content" class="col-sm-2 control-label">내용</label>
					    		<div class="col-sm-7">
					      			<textarea class="form-control" rows="9" cols="11" id="notice_content"></textarea>
					    		</div>	
						 </div>
					</div> -->
					<!-- 내용 파일 업로드  -->
					<!-- <div class="container col-sm-12" style="height:60px;">
						<div class="form-group" style="margin-top:10px;">
							<label for="" class="col-sm-2 control-label">파일 업로드</label>
								<div class="col-sm-3">
									<div class="form-group">
			  							<input type="file" id="ex_file"> 
									</div>
					    		</div>
					 	</div>
					</div> -->
					<!-- 영수증 파일 업로드 -->
					<!-- <div class="container col-sm-12" style="height:60px;">
						<div class="form-group" style="margin-top:10px;">
							<label for="" class="col-sm-2 control-label">관람 인증 업로드</label>
								<div class="col-sm-3">
									<div class="form-group">
			  							<input type="file" id="ex_file"> 
									</div>
					    		</div>
					 	</div>
					</div> -->

					
					
					<!-- 제출 -->
					<!-- <div class="container col-sm-12" style="height:100px; margin-top:40px;">
						<div class="form-group" style="margin-top:10px;">
							<button type="submit" class="btn btn-primary" style="margin-right:20px;" onclick="location='MovieDetail.jsp'">글작성 </button>
							<button type="submit" class="btn btn-primary" onclick="location='MovieList.jsp'">취소 </button>
						</div>
					</div>
					
				</div>
			</div>
		</div> -->
		
		<!-- 별점주기  -->
		<!-- <div class="star">
			<label>영화 평점: ★★★★★</label>
		</div> -->
					
					
				

	<%@ include file="MovieTop5.jsp" %>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	<!-- footer -->
	<%@ include file="../Fix/footer.jsp" %>


</body>
</html>