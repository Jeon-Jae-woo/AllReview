<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; UTF-8"); %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰(게시글) 수정</title>


<style type="text/css">

.headtitle{
	position: absolute;
	float: left;
	top: 520px;
	left: 9%;
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
	/* border: 1px dashed red; */
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

/* 
.totalbox{
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
	position: absolute;
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

.cancel{
	font-size: 15px;
	width: 100px;
}
.update{
	font-size: 15px;
	width: 100px;
}
 */

</style>


</head>
<body>

	<!-- header -->
	<%@ include file="../Fix/header.jsp" %>
	
	
	<div class="headtitle">
		<h3>영화 리뷰 수정</h3>
	</div>
	
	<!-- 리뷰(게시글) 수정 -->
	<div>
		<div class="totalbox">
			<form action="" method="post">
				<input type="hidden" name="command" value="">
				<input type="hidden" name="seq" value="">
				
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
					<input class="reviewwrite" type="button" value="수정">
					<input class="reviewcancel" type="button" value="취소" onclick="location='MovieList.jsp'">
				</div>
					
			</form>
		</div>
	</div>
	
	<!-- 리뷰(게시글) 수정 -->
<%-- 	<div>
		<div class="totalbox">
			<div class="titlebox">
					<form action="" method="post">
						<input type="hidden" name="command" value="">
						<input type="hidden" name="seq" value="">
						<table id="table">
							<tr id="reviewtitle" style="width: 400px;">
								<th >제목 </th>
								<td ><input type="text" name="title" value="${dto.title }"></td>
							</tr>
							<tr id="userid" style="width:100px;">
								<th style="text-align:center;">닉네임</th>
								<td>${dto.writer }KH</td>
							</tr>					
							<tr id="point">
								<th>영화평점</th>
								<td>${dto.writer }★★★★☆ (9.5)</td>
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
								<td><textarea rows ="30" cols="165" readonly="readonly"> ??? </textarea></td>
							</tr>	
						</table>
					</form>
			</div>
		</div>
		
		<div class="contentborder"></div>
		
		<div>
			<input class="reco_bu" type="submit" value="추천" onclick="" >
			<input class="report_bu" type="submit" value="신고" onclick="" >
		</div>
		
		<div class="bottom">
			<input class="update" type="submit" value="수정" onclick="location='MovieList.jsp'">
			<input class="cancel" type="button" value="취소" onclick="location='MovieList.jsp'">
		</div>
	</div> --%>

	<%@ include file="MovieTop5.jsp" %>

	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	<!-- footer -->
	<%@ include file="../Fix/footer.jsp" %>


</body>
</html>