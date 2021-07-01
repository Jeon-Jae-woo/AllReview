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
	top: 530px;
	left: 9%;
}

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


</style>


</head>
<body>

	<!-- header -->
	<%@ include file="../Fix/header.jsp" %>
	
	<!-- 리뷰(게시글) 수정 -->
	<div class="headtitle">
		<h4>리뷰 수정</h4>
	</div>
	<div class="totalbox">
		<div class="titlebox">
				<form action="controller.do" method="post">
					<input type="hidden" name="command" value="boardupdate">
					<input type="hidden" name="seq" value="${dto.seq }">
					<table id="table">
						<tr id="reviewtitle" style="width: 400px;">
							<th >제목 </th>
							<td ><input type="text" name="title" value=<%-- "${dto.title }" --%>></td>
						</tr>
						<tr id="userid" style="width:100px;">
							<th style="text-align:center;">글쓴이</th>
							<td><%-- ${dto.writer } --%>KH</td>
						</tr>					
						<tr id="point">
							<th>영화평점</th>
							<td><%-- ${dto.writer } --%>★★★★☆ (9.5)</td>
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
		<div class="contentborder"></div>
		
		<div>
			<input class="reco_bu" type="submit" value="추천" onclick="" >
			<input class="report_bu" type="submit" value="신고" onclick="" >
		</div>
		
		<div class="bottom">
			<input class="update" type="submit" value="수정" onclick="location='MovieList.jsp'">
			<input class="cancel" type="button" value="취소" onclick="">
		</div>
	</div>

	<%@ include file="MovieTop5.jsp" %>

	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	<!-- footer -->
	<%@ include file="../Fix/footer.jsp" %>


</body>
</html>