<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ALLREVIEW 메인페이지</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>

<style type="text/css">
	
.categorybox{
	border: 1px solid gray;
	height: 260px;
	background-image: url("./resources/Image/background02.jpg");
	background-repeat: no-repeat;
	background-position: left top;
	background-size: cover;
}
#nav{
	/* border: 1px dashed red; */
	left: 0px;
	right:0px;
	height: 100px;
	/* background-image: url('');
	background-repeat: no-repeat;
	background-position: left top;
	background-size: cover; */
	}
#nav ul li{
	/* border:1px dashed red; */
	list-style: none;
	display: inline;
	position: relative;
	padding: 0;
	line-height:40px;
	text-align:center;
	float: left;
	left: 9%;
	top: 25px;
	width: 20%;
	color: white;
	font-weight: bold;
	font-size: 18px;
	}

#nav ul li:hover{
	color:gray;
	}
#subcategorybox{
	/* border:1px dashed red; */
	height: 100px;
	position: relative;
	top: 20px;
}
#boxtitle{
	position: relative;
	/* border: 1px dashed red; */
	left: 6%;
	top:80px;
	width: 400px;
}
#box{
	border: 1px solid gray;
	border-radius: 5px 5px 5px 5px;
	position: relative;
	width: 95%;
	left: 2.5%;
	height: 750px;
	top: 90px;
}
#wrap{
	border: 1px dashed red;
	position: relative;
	width: 95%;
	height: 660px;
	top: 40%;
	left: 39%;
	transform: translate(-40%,-40%);
}

#wrap > div {
	width: 180px;
	height: 230px;
	border: 1px solid gray;
	position: relative;
	float: left;
	left: 3%;
	margin: 45px;
	box-sizing: border-box;
	border-radius: 5px 5px 5px 5px;
}
#wrap > div:nth-child(6){
clear: both;

}
#mainlistreviewtitle1{

text-align: center;
position: relative;
top: 95%;
}
#mainlistreviewtitle2{

text-align: center;
position: relative;
top: 95%;
}
#mainlistreviewtitle3{

text-align: center;
position: relative;
top: 95%;
}
#mainlistreviewtitle4{

text-align: center;
position: relative;
top: 95%;
}
#mainlistreviewtitle5{

text-align: center;
position: relative;
top: 95%;
}
#mainlistreviewtitle6{

text-align: center;
position: relative;
top: 95%;
}
#mainlistreviewtitle7{

text-align: center;
position: relative;
top: 95%;
}
#mainlistreviewtitle8{

text-align: center;
position: relative;
top: 95%;
}
#mainlistreviewtitle9{

text-align: center;
position: relative;
top: 95%;
}
#mainlistreviewtitle10{

text-align: center;
position: relative;
top: 95%;
}


</style>

</head>
<body>

	<!-- 임시 index -->
	<%@ include file="Fix/header.jsp" %>
	<br>
	
	<!-- 카테고리 박스  -->
	<div class="categorybox">
		<div id="nav">
				<ul>
	            	<li id="online" onclick="location.href='onlineController?command=list'">온라인 쇼핑</li>
	            	<li id="moive" onclick="location.href='movieController?command=moiveListCate'">영화 </li>
	            	<li id="shop" onclick="location.href='shop.do?command=shoplist'">매장</li>
	            	<li id="book">도서</li>
	            </ul>
	    </div>
	    <div id="subcategorybox">
			<div id="subcategory1">
			</div>
		</div>
	</div>
	<br>
	
	<!-- 중간 목록박스 타이틀 -->
	<div id="boxtitle">
		<h3> 전체 리뷰 베스트 TOP 10 </h3>
	</div>
	
	<!--  중간 목록박스  전체 리뷰  Top10 (조회순, 추천순 둘중 뭐로 할지 ?) -->
	<div id="box">
		<div id="wrap">
			<div>
				<div><a href="">1</a></div>
				<div id="mainlistreviewtitle1">리뷰제목</div>
			</div>
			<div>
				<div><a href="">2</a></div>
				<div id="mainlistreviewtitle2">리뷰제목</div>
			</div>
			<div>
				<div><a href="">3</a></div>
				<div id="mainlistreviewtitle3">리뷰제목</div>
			</div>
			<div>
				<div><a href="">4</a></div>
				<div id="mainlistreviewtitle4">리뷰제목</div>
			</div>
			<div>	
				<div><a href="">5</a></div>
				<div id="mainlistreviewtitle5">리뷰제목</div>
			</div>
			<div>
				<div><a href="">6</a></div>
				<div id="mainlistreviewtitle6">리뷰제목</div>
			</div>
			<div>
				<div><a href="">7</a></div>
				<div id="mainlistreviewtitle7">리뷰제목</div>
			</div>
			<div>
				<div><a href="">8</a></div>
				<div id="mainlistreviewtitle8">리뷰제목</div>
			</div>
			<div>
				<div><a href="">9</a></div>
				<div id="mainlistreviewtitle9">리뷰제목</div>
			</div>
			<div>
				<div><a href="">10</a></div>
				<div id="mainlistreviewtitle10">리뷰제목</div>
			</div>
		</div>
	</div>
	
	
	<br><br><br><br><br><br><br><br><br><br>
	<!-- admin 페이지 작업을 위해서 임시로 만들어놓은 form 입니다 -->	
	<form method="get" action="userController">
		<input type="hidden" name="email" value="jaewoo68@naver.com">
		<input type="hidden" name="levelNo" value="1">
		<input type="hidden" name="command" value="adminLevelUpdate">
		<input type="submit">
	</form>
	
	<%-- <h1><%= session.getAttribute("level")  %></h1> --%>

	<!-- footer -->
	<%@ include file="Fix/footer.jsp" %>
</body>
</html>