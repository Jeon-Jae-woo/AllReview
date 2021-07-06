<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>  

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 메인페이지</title>

<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#online").click(function(){
		$("#online_sub").toggle();
	});
	
	$("#moive").click(function(){
		$("#movie_sub").toggle();
	});
	
	$("#shop").click(function(){
		$("#shop_sub").toggle();
	});
	
	$("#book").click(function(){
		$("#book_sub").toggle();
	});
	
	
}); 

</script>

<style type="text/css">

/* 	#header{
	    border:1px dashed red;
		vertical-align: middle;
		left: 0px;
		right:0px;
		top: 0px;
		hegiht: 100px;
		padding: 1;
		margin:1;
		}
	.mainlogo{
		display: block;
		margin: auto;
	}
	#top{
		float: right;
		padding:1px;
		padding-right: 10px;
		margin: 1px;
	}
	#top input{
		font-size: 18px;
	}*/
	
.categorybox{
	border: 1px solid gray;
	height: 260px;
}
#nav{
	border: 1px dashed red;
	/* position: fixed; */
	left: 0px;
	right:0px;
	height: 100px;
	background-image: url('');
	background-repeat: no-repeat;
	background-position: left top;
	background-size: cover;
	}
#nav ul li{
	list-style: none;
	display: inline;
	position: relative;
	padding: 0;
	line-height:40px;
	text-align:center;
	float: left;
	left: 9%;
	width: 20%;
	}
#nav ul li a{
	border:1px dashed red;
	text-decoration: none;
	text-align: center;
	display: block;
	font-weight: bold;
	font-size: 15px;
	padding: 5px 10px;
	color: black;
	}
#nav ul li a:hover{
	color:blue;
	}
#subcategorybox{
	border:1px dashed red;
	height: 100px;
	position: relative;
	top: 20px;
}
#online_sub{
	display: none;
}
#movie_sub{
	display: none;
}
#shop_sub{
	display: none;
}
#book_sub{
	display: none;
}

#subcategory1 ul li{
	/* border: 1px dashed red; */
	list-style: none;
	position: relative;
	padding: 0;
	line-height:40px;
	text-align:center;
	float: left;
	left: 4%;
	width: 15%;
}

#subcategory1 ul li a{
	text-decoration: none;
	font-weight: bold;
	color: black;
	text-align: center;
}
#subcategory1 ul li a:hover{
	color:blue;
	}
	
.container{
	border: 1px dashed red;
	position: relative;
	left: 5%;
	top: 60px;
	padding: 5px;
	width: 70%;
	height: 900px;
}

.top{
	border: 1px dashed red;
	padding: 0px;
	margin: 0px;
	width: 100%;
	float: left;
	left: 100px;
	height: 80px;
}

h1{
	display: inline;
	position: relative;
	top: 25px;
}

#select{
	display:inline;
	position: relative;
	float: left;
	left: 250px;
	font-size: 20px;
	top: 40px;
}

.search{
	display:inline;
	position: relative;
	float: right;
	right: 50px;
	top: 35px;
}

.search > input, button{
	font-size: 20px;
}

#box{
	width: 100%;
	height: 800px;
	border: 1px solid gray;
	position: relative;
	top: 100px;

}
#wrap{
	border: 1px dotted red;
	position: relative;
	width: 90%;
	height: 660px;
	top: 50%;
	left: 50%;
	transform: translate(-50%,-50%);
}

#wrap > div {
	width: 200px;
	height: 250px;
	border: 1px solid gray;
	position: relative;
	bottom: 90px;
	left: 100px;
	float: left;
	margin: 45px;
	box-sizing: border-box;
	
}

#wrap > div:nth-child(5){
clear: both;

}

.moviecreate{
	position: relative;
	border: 1px dashed red;
	height: 30px;
	top: 50px;
}
#moviecreatebtn{
	position: relative;
	float: right;
	right: 6%;
	width: 110px;
	height: 30px;
	font-size: 18px;
}

/* .page_wrap {
	text-align:center;
	font-size:0;

 }
.page_nation {
	border: 1px dashed red;
	display:inline-block;
	position: relative;
	margin: auto;
	bottom: 30px;
	
}
.page_nation .none {
	display:none;
}
.page_nation a {
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
.page_nation .arrow {
	border:1px solid #ccc;
}
.page_nation .pprev {
	background:#f8f8f8 url('resources/Image/page_pprev.png') no-repeat center center;
	margin-left:0;
}
.page_nation .prev {
	background:#f8f8f8 url('resources/Image/page_prev.png') no-repeat center center;
	margin-right:7px;
}
.page_nation .next {
	background:#f8f8f8 url('resources/Image/page_next.png') no-repeat center center;
	margin-left:7px;
}
.page_nation .nnext {
	background:#f8f8f8 url('resources/Image/page_nnext.png') no-repeat center center;
	margin-right:0;
}
.page_nation a.active {
	background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
} */

</style>
</head>
<body>

<%-- 	<!-- header -->
	<%@ include file="../Fix/header.jsp" %> --%>
	
	<br><br><br><br><br><br><br><br><br>

	<div class="categorybox">
		<div id="nav">
			<ul>
            	<li><a id="online" href="">온라인 쇼핑</a></li>
            	<li><a id="moive" href="">영화</a></li>
            	<li><a id="shop" href="">매장</a></li>
            	<li><a id="book" href="">도서</a></li>
            </ul>
		</div>
		<div id="subcategorybox">
	       	<div id="subcategory1">
	       		<ul id="online_sub">
	       			<li><a href="">세부 카테고리1</a></li>
	       			<li><a href="">세부 카테고리2</a></li>
	       			<li><a href="">세부 카테고리3</a></li>
	       			<li><a href="">세부 카테고리4</a></li>
	       			<li><a href="">세부 카테고리5</a></li>
	       			<li><a href="">세부 카테고리6</a></li>
	       		</ul>
	       		<ul id="movie_sub">
	       			<li><a href="">액션</a></li>
	       			<li><a href="">공포/스릴러</a></li>
	       			<li><a href="">SF/판타지</a></li>
	       			<li><a href="">드라마/로맨스</a></li>
	       			<li><a href="">다큐멘터리</a></li>
	       			<li><a href="">애니메이션</a></li>
	       		</ul>
	       		<ul id="shop_sub">
	       			<li><a href="">세부 카테고리1</a></li>
	       			<li><a href="">세부 카테고리2</a></li>
	       			<li><a href="">세부 카테고리3</a></li>
	       			<li><a href="">세부 카테고리4</a></li>
	       			<li><a href="">세부 카테고리5</a></li>
	       			<li><a href="">세부 카테고리6</a></li>
	       		</ul>
	       		<ul id="book_sub">
	       			<li><a href="">세부 카테고리1</a></li>
	       			<li><a href="">세부 카테고리2</a></li>
	       			<li><a href="">세부 카테고리3</a></li>
	       			<li><a href="">세부 카테고리4</a></li>
	       			<li><a href="">세부 카테고리5</a></li>
	       			<li><a href="">세부 카테고리6</a></li>
	       		</ul>
	       	</div>
	    </div>
    </div>
	<br>
	
	<section>
		<div class="container">
			<form id="movieform" name="movieform" action="movieController" method="post">
				<!--  목록 페이지 상단 (카테고리명, 정렬, 검색) -->
				<div class="top">
					<!-- <form class="top_1"> -->
						<h1>액션</h1>
						<select id="select" onchange=>
							<option value="">제목순</option>
							<option value="">조회순</option>
							<option value="">추천순</option>					
						</select>
						<div class="search">
							<input type="text" class="" placeholder="제목을 입력하세요">
							<button type="submit" class="">검색</button>
						</div>
					<!-- </form> -->
				</div>
			</form>
				<!--  목록 페이지 중간 (영화포스터 바둑판 배열) -->
				<div id="box">
					<div id="wrap">
						
							<c:choose>
								<c:when test="${empty list }">
									<tr>
										<td colspan ="4">----작성된 글이 존재하지 않습니다----</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="dto" items="${list }">
									<div>
									<a href="MovieController?command=detail&movie_id=${dto.movie_id}">${dto.movie_img }</a>
									</div>
									
									</c:forEach>
								</c:otherwise>
							</c:choose>

					</div>
				</div>
				
				<!-- 영화등록버튼 -->
				<div class="moviecreate">
					<input type="button" id="moviecreatebtn" value="영화등록" onclick="location='MovieCreate.jsp'">
				</div>
			
		</div><!--container 끝 div  -->
	</section>
	

	
<!-- <div class="page_wrap">
			   <div class="page_nation">
			      <a class="arrow pprev" href="#"></a>
			      <a class="arrow prev" href="#"></a>
			      <a href="#" class="active">1</a>
			      <a href="#">2</a>
			      <a href="#">3</a>
			      <a href="#">4</a>
			      <a href="#">5</a>
			      <a class="arrow next" href="#"></a>
			      <a class="arrow nnext" href="#"></a>
			   </div>
			</div> -->
			
			
	<%@ include file="MovieTop5.jsp" %>
	<br><br><br><br><br><br><br>
	
	<%-- 	<!-- footer  -->
	<%@ include file="../Fix/footer.jsp" %> --%>

</body>
</html>