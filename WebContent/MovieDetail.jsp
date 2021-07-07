<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; UTF-8"); %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰(게시글) 확인</title>

<style type="text/css">

/* .totalbox{
	border: 1px solid gray;
	top: 480px;
	left: 9%;
	width: 65%;
	height: 770px;
	position: relative;
}

.titlebox{
	border: 1px solid gray;
	height: 50px;
	padding: 10px;
	margin:10px;
}
.contentborder{
	border: 1px solid gray;
	top: 70px;
	position: absolute;
	left: 0.9%;
	width: 98%;
	height: 680px;
} 

#reviewtitle{
	border: 1px dashed red;
	top: 21px;
	
}
#userid{
	border: 1px dashed red;
	position: absolute;
	left: 43%;
	top: 21px;
}
#point{
	border: 1px dashed red;
	position: absolute;
	left: 51%;
	top: 21px;
}
#reco{
	border: 1px dashed red;
	position: absolute;
	left: 67%;
	top: 21px;
}

#check{
	border: 1px dashed red;
	position: absolute;
	left: 73%;
	top: 21px;
}
#report{
	border: 1px dashed red;
	position: absolute;
	left: 79%;
	top: 21px;
}
#content{
	border: 1px dashed red;
	position: absolute;
	top: 80px;
	width: 96%;
	height: 660px;
}
#date{
	border: 1px dashed red;
	position: absolute;
	left: 85%;
	top: 21px;
	width: 140px;
}
.reco_bu{
	float: left;
	left: 83%;
	top: 710px;
	position: absolute;
	font-size: 15px;
	width: 70px;
}
.report_bu{
	float: left;
	left: 90%;
	top: 710px;
	position: absolute;
	font-size: 15px;
	width: 70px;
}
.bottom{
	position: absolute;
	float: left;
	left: 42%;
	top: 800px;
}

.moklok{
	font-size: 15px;
	width: 100px;
}
.update{
	font-size: 15px;
	width: 100px;
}
.delete{
	font-size: 15px;
	width: 100px;
}
 */

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
#title{
	position: relative;
	left: 20px;
	top: 20px;
}
#nickname{
	position: relative;
	left: 38%;	
}
#moviegrade{
	position: relative;
	left: 56%;
	bottom: 20px;
}
#recommand{
	position: relative;
	left: 76%;
	bottom: 39px;
}
#view{
	position: relative;
	left: 83%;
	bottom: 59px;
}
#report{
	position: relative;
	left: 90%;
	bottom: 79px;
}
#date{
	position: relative;
	float: right;
	right: 20px;
	top: 14px;
}
.contentbox{
	border: 1px solid gray;
	height: 580px;
	left: 1%;
	width: 98%;
	top: 20px;
	position: relative
}
#content{
	position: relative;
	left: 5px;
	top: 30px;
}

.bottombox{
	position: relative;
	bottom: 25px;
}
#reco_button{
 	position: absolute;
	float:right;
	right: 120px;
	width: 80px;
}
#repo_button{
	position: absolute;
	float:right;
	right: 25px;
	width: 80px;
}
.lastbutton{
	position: relative;
	top: 40px;
}
#list{
	position: relative;
	width: 80px;
	left: 36%;
}
#update{
	position: relative;
	width: 80px;
	left: 38%;
} 
#delete{
	position: relative;
	width: 80px;
	left: 40%;
}
 
</style>

</head>
<body>

	<!-- header -->
	<%@ include file="../Fix/header.jsp" %>
	
	
	<div class="title">
		<h3>영화 리뷰 상세조회</h3>
	</div>

	<!-- 게시글 상세보기 -->
	<div>
		<!-- 전체박스 -->
		<div class="totalbox">
			<!-- 상단 제목 박스 -->
			<div class="titlebox">
				<div id="title">
					<div>${dto.review_title }</div>
				</div>
				<div id="nickname">
					<div>닉네임 ${dto.nickname }</div>
				</div>
				<div id="moviegrade">
					<div>영화평점 ${dto.movie_grade }</div>
				</div>
				<div id="recommand">
					<div>추천 ${dto.review_r_num }</div>
				</div>
				<div id="view">
					<div>조회 ${dto.review_v_num }</div>
				</div>
				
			</div>
			<!-- 내용박스 -->
			<div class="contentbox">
				<div id="date">
					<div>작성일 ${dto.creatat }</div>
				</div>
				<div id="content">
					<textarea rows="23" cols="118" readonly="readonly">${dto.review_content}</textarea>
				</div>
			</div>
			<div class="bottombox">
				<input id="reco_button" type="submit" value="추천">
				<input id="repo_button" type="submit" value="신고">
			</div>
			<div class="lastbutton">
				<input id="list" type="button" value="수정" onclick="location='movieController?command=reviewUpdateForm&review_id=${dto.review_id}'">
				<input id="update" type="button" value="목록" onclick="location='MovieList.jsp'">
				<input id="delete" type="button" value="삭제" onclick="location.href='movieController?command=reviewDelete&movie_id=${dto.movie_id}&review_id=${dto.review_id}'">
			</div>
		</div>
	</div>
	

	<!-- 게시글 상세보기 -->
<!-- 	<div class="totalbox">
		<div class="titlebox">
				<table id="table">
					<tr id="reviewtitle" style="width: 400px;">
						<th >제목 </th>
						<td >??</td>
					</tr>
					<tr id="userid" style="width:100px;">
						<th >글쓴이</th>
						<td>KH</td>
					</tr>					
					<tr id="point">
						<th>영화평점</th>
						<td>★★★★☆ (9.5)</td>
					</tr>
					<tr id="reco">
						<th>추천</th>
						<td>3</td>
					</tr>
					<tr id="check">
						<th>조회</th>
						<td>10</td>
					</tr>
					<tr id="report">
						<th>신고</th>
						<td>0</td>
					</tr>
					<tr id="date">
						<th>작성일</th>
						<td>2021.06.24</td>
					</tr>
					<tr id="content">
						<th></th>
						<td><textarea rows ="30" cols="100" readonly="readonly"> ??? </textarea></td>
					</tr>
				</table>
		</div>		
		<div>
			<input class="reco_bu" type="submit" value="추천" onclick="" >
			<input class="report_bu" type="submit" value="신고" onclick="" >
		</div>
		
		<div class="bottom">
			<input class="moklok" type="button" value="목록" onclick="location='MovieList.jsp'">
			<input class="delete" type="button" value="삭제" onclick="">
			<input class="update" type="submit" value="수정" onclick="location='MovieUpdate.jsp'">
		</div>
	</div> -->


	<%@ include file="MovieTop5.jsp" %>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	<!-- footer -->
	<%@ include file="../Fix/footer.jsp" %>

</body>
</html>