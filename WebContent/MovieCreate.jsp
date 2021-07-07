<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; UTF-8"); %>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 기본정보 등록 </title>


<style type="text/css">

.category{
	position: absolute;
	float: left;
	top: 500px;
	left: 9%;
}

#box{
	width: 60%;
	height: 350px;
	border: 1px solid black;
	top: 480px;
	left: 9%;
	position: relative;
}

#wrap{
	border: 1px solid black;
	width: 280px;
	height: 330px;
	padding-top: 3px;
	position: relative;
  	top: 10px;
	left: 10px;
}

.poster{
	border: 1px dashed red;
	width: 270px;
	height: 320px;
	text-align: center;
	margin: auto;
	background: gray;
}

.list{
	position: relative;
	height: 320px;
	left: 28%;
	bottom: 315px;
	font-size: 18px;
	width: 800px;
	/* border: 1px solid; */
}

.list tr th{
text-align: center;
}

.attached_poster{
	float: left;
	left: 10%;
	top: 995px;
	position: absolute;
	font-size: 15px;
}

.comment{
	float: left;
	left: 10%;
	top: 965px;
	position: absolute;
	font-size: 15px;
}

.create{
	float: left;
	left: 32%;
	top: 1100px;
	position: absolute;
	font-size: 15px;
	width: 70px;
}
.cancel{
	float: left;
	left: 37%;
	top: 1100px;
	position: absolute;
	font-size: 15px;
	width: 70px;
}

</style>

</head>
<body>


	<!-- header -->
	<%@ include file="../Fix/header.jsp" %>
	
	
		<div>
			<div class="category">
				<h1> 액션 </h1>
			</div>
		
			<!-- 영화 기본 정보 -->
			<form action="MovieController" method="post">
			<input type="hidden" name="command" value="moviecreate">
			<div id="box">
				<div id="wrap">
					<div class="poster">영화포스터</div>
				</div>
			     <table class="list"  style="text-align: left">
		            <tr>
		                <th style="width:100px" >영화제목 : </th>
		                <td style="width:250px"><input type="text" name="movie_title"></td>
		                
		            </tr>
		            <tr>
		                <th>기본정보 : </th>
		                <td><input type="text" name="movie_type_nm"></td>
		            </tr>
		             <tr>
		                <th>감독 : </th>
		                <td><input type="text" name="director"></td>
		            </tr>
		             <tr>
		                <th>출연 : </th>
		                <td><input type="text" name="actor"></td>
		            </tr>
		             <tr>
		                <th>영화 평점 : </th>
		                <td><input type="text" name="movie_grade"></td>
		            </tr>
		        </table>	
		        
			</div>
			
			
			<div class="comment">영화 포스터를 첨부하세요</div>
			<div class="attached_poster">
				<input type="file" id="ex_file">
			</div>
			
			<div>
				<input class="create" type="submit" value="등록" onclick="location='MovieMain.jsp'" >
				<input class="cancel" type="button" value="취소" onclick="location='MovieMain.jsp'" >
			</div>
			</form>
			
			
		</div>
	


	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	<!-- footer -->
	<%@ include file="../Fix/footer.jsp" %>

</body>
</html>