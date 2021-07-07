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
			<form action="movieController" method="post">
				<input type="hidden" name="command" value="reviewWrite">
				<input type="hidden" name="movie_id" value="${movie_id }">
				<div class="titlebox">
					<input type="text" name="reviewtitle" id="reviewtitle" placeholder="리뷰 제복을 입력하세요">
				</div>
				<div class="contentbox">
					<textarea rows="25" cols="104" id="content" placeholder="내용을 작성 하세요" name="content"></textarea>
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
					<input class="reviewwrite" type="submit" value="등록">
					<input class="reviewcancel" type="button" value="취소" onclick="location='MovieList.jsp'">
				</div>
					
			</form>
		</div>
	</div>
	
		
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