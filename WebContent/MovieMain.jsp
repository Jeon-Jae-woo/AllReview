<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>  

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 목록 메인 페이지</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
/* $(function(){
	$("#online").click(function(){
 		$("#online_sub").toggle()

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
});  */

</script>

<style type="text/css">
	
.categorybox{
	/* border: 1px solid gray; */
	height: 260px;
}
#nav{
	left: 0px;
	right:0px;
	height: 100px;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );	

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
	top: 25px;
	width: 20%;
	color: black;
	font-weight: bold;
	font-size: 15px;
	text-shadow: 1px 1px 1px gray;
	}

#nav ul li:hover{
	color:gray;
	}
#subcategorybox{
/* 	border:1px dashed red; */
	height: 100px;
	position: relative;
	top: 20px;
}
#online_sub{
	display: none;
}
#movie_sub{
	/* display: none; */
}
#shop_sub{
	display: none;
}
#book_sub{
	display: none;
}

#subcategory1 ul li{
	border-inline: 1px solid lightgray;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );
	list-style: none;
	position: relative;
	padding: 0;
	line-height:40px;
	text-align:center;
	font-weight: bold;
	color: black;
	float: left;
	top: 10px;
	left: 4%;
	width: 15%;
	text-shadow: 1px 1px 1px gray;

}

#subcategory1 ul li:hover{
	color:gray;
}
	
#container{
	/* border: 1px solid red; */
	position: relative;
	left: 5%;
	top: 60px;
	padding: 5px;
	width: 67%;
	height: 720px;
}

.top{
	/* border: 1px dashed red; */
	padding: 0px;
	margin: 0px;
	width: 100%;
	float: left;
	left: 100px;
	height: 80px;
	color: white;
	text-shadow: 1px 1px 1px gray;
}
h1{
	display: inline;
	position: relative;
	left: 5%;
	top: 5px;
	
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
	height: 600px;
	border: 1px solid gray;
	border-radius: 5px 5px 5px 5px;
	position: relative;
	top: 80px;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );

}
#wrap{
	/* border: 1px dotted red; */
	position: relative;
	width: 98%;
	height: 500px;
	top: 26%;
	left: 30%;
	transform: translate(-30%,-30%);
}

#wrap > div {
	width: 130px;
	height: 170px;
	border: 1px solid gray;
	position: relative;
	bottom: 80px;
	left: 5%;
	float: left;
	margin: 45px;
	box-sizing: border-box;
	/* background-color: gray; */
}

#wrap > div:nth-child(5){
	clear: both;
}
#movietitle{
	/* border: 1px dashed red; */
	position: absolute;
	width: 130px;
	text-align: center;
	top: 175px;
	color: black;
	font-weight: bold;
	/* text-shadow: 1px 1px 1px gray; */
}
.moviecreate{
	/* border: 1px dashed red; */
	position: relative;
	width:100%;
	height: 30px;
	top: 30px;
}
#moviecreatebtn{
	position: relative;
	float: right;
	right: 6%;
	width: 90px;
	height: 28px;
	line-height:27px;
	font-size: 15px;
	font-weight: bold;
}
.pull-bottom{
 /* border: 1px dashed red; */
	position: relative;
	text-align: center;
	width: 50%;
	left: 27%;
	bottom: 10px;
}
body{
	background-image: url("./resources/Image/forest1.jpg");
	background-repeat: no-repeat;
	background-position: left top;
	background-size: cover;

}
#movieposter{
	top: 1px;
	width: 127px;
	hegiht: 167px;
	object-fit:cover;
	border-radius: 5px 5px 5px 5px;

}

</style>
</head>
<body>

 	<!-- header -->
	<%@ include file="../Fix/header.jsp" %>
	<br>
	
	<!-- 카테고리 박스  -->
	<div class="categorybox">
		<div id="nav">
				<ul>
	            	<li id="online">온라인 쇼핑</li>
	            	<li id="moive" onclick="location.href='movieController?command=moiveListCate'">영화 </li>
	            	<li id="shop" onclick="location.href='shop.do?command=shoplist'">매장</li>
	            	<li id="book">도서</li>
	            </ul>
	    </div>
		<div id="subcategorybox">
	       	<div id="subcategory1">
	       		<ul id="online_sub">
	       			<li onclick="">세부 카테고리1</li>
	       			<li onclick="">세부 카테고리2</li>
	       			<li onclick="">세부 카테고리3</li>
	       			<li onclick="">세부 카테고리4</li>
	       			<li onclick="">세부 카테고리5</li>
	       			<li onclick="">세부 카테고리6</li>
	       		</ul>
	       		<ul id="movie_sub">
	       			<c:choose>
						<c:when test="${empty moiveListCate }">
							<tr>
								<td colspan ="4">----작성된 글이 존재하지 않습니다----</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="cate" items="${moiveListCate }">
	       					<li onclick="location.href='movieController?command=moiveListCate&category=${cate.movie_type}&pageNum=1'">${cate.movie_type_name }</li>
	       					</c:forEach>
						</c:otherwise>
					</c:choose>
	       			
	       		</ul>
	       		<ul id="shop_sub">
	    			<li onclick="">세부 카테고리1</li>
	       			<li onclick="">세부 카테고리2</li>
	       			<li onclick="">세부 카테고리3</li>
	       			<li onclick="">세부 카테고리4</li>
	       			<li onclick="">세부 카테고리5</li>
	       			<li onclick="">세부 카테고리6</li>
	       		</ul>
	       		<ul id="book_sub">
	    			<li onclick="">세부 카테고리1</li>
	       			<li onclick="">세부 카테고리2</li>
	       			<li onclick="">세부 카테고리3</li>
	       			<li onclick="">세부 카테고리4</li>
	       			<li onclick="">세부 카테고리5</li>
	       			<li onclick="">세부 카테고리6</li>
	       		</ul>
	       	</div>
	    </div>
    </div>
	<br>
	
	<section>
		<div id="container">
		<form id="movieform" name="movieform" action="movieController" method="post">
				<!--  목록 페이지 상단 (카테고리명, 정렬, 검색) -->
				<div class="top">
						<h1>${category_name}</h1>
					   <!-- <select id="select" onchange=>
							<option value="">제목순</option>
							<option value="">조회순</option>
							<option value="">추천순</option>					
						</select>
						<div class="search">
							<input type="text" class="" placeholder="제목을 입력하세요">
							<button type="submit" class="">검색</button>
						</div> -->
				</div>
			</form>
			
				<!--  영화 목록 페이지 (영화포스터 바둑판 배열) -->
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
									<div style="border-radius: 5px 5px 5px 5px;">
									<!-- 값 수정 -->
									
									<a href="movieController?command=detail&movie_id=${dto.movie_id}&category_name=${category_name}"><img id="movieposter" src="resources/uploadImage/${dto.movie_img}"></a>
									<div id="movietitle">${dto.movie_title}</div>
									</div>
									
									</c:forEach>
								</c:otherwise>
							</c:choose>
					</div>
				</div>
				
				<!-- 영화등록버튼 -->
				<div class="moviecreate">
					<input type="button" id="moviecreatebtn" value="영화등록" onclick="location.href='movieController?command=moviecreateForm&category=${category}&category_name=${category_name}'">
				</div>
				
				<!-- 페이징처리 -->
				<nav class="pull-bottom">
					<c:set var="pageNum" value="${paging.pageNum }"/>
					<c:set var="startPage" value="${paging.startPage}"/>
					<c:set var="endPage" value="${paging.endPage}"/>
					<c:set var="totalPage" value="${paging.totalPage}"/>
					<c:set var="itemCount" value="${paging.itemCount}"/>
					<ul class="pagination">
						<li>
				      		<a href="movieController?command=moiveListCate&category=${category}&pageNum=1" aria-label="Previous">
				        	<span aria-hidden="true">&laquo;</span>
				      		</a>
				    	</li>
						<c:forEach var="item" varStatus="status" begin="${ startPage }" end="${ endPage }" step="1">
	                		<c:if test="${ pageNum == item }">
	                    		<li><a href="movieController?command=moiveListCate&category=${category}&pageNum=1">${ item }</a></li>
	                		</c:if>
	                		<c:if test="${ pageNum != item }">
			 					<li><a href="movieController?command=moiveListCate&pageNum=${ item }&category=${category}">${ item }</a></li>
	                		</c:if>
	            		</c:forEach>
	            		<li>
				      		<a href="movieController?command=moiveListCate&pageNum=${totalPage}&category=${category}" aria-label="Next">
				        	<span aria-hidden="true">&raquo;</span>
				      		</a>
			    		</li>
					</ul>
				</nav>
				
		</div><!--container 끝 div  -->
	</section>
	
	<!-- 오른쪽 사이드 Top5 테아블 -->		
	<%@ include file="MovieTop5.jsp" %>
	<br><br><br><br><br><br><br>
	
	<!-- footer  -->
	<%@ include file="../Fix/footer.jsp" %>

</body>
</html>