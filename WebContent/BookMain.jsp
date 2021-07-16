<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
/* $(function(){
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
	
	
}); */ 

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
	display: none;
}
#shop_sub{
	display: none;
}
#book_sub{
	/* display: none; */
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
	left: 10%;
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
	height: 600px;
	border: 1px solid gray;
	border-radius: 5px 5px 5px 5px;
	position: relative;
	top: 100px;
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
	bottom: 90px;
	left: 5%;
	float: left;
	margin: 45px;
	box-sizing: border-box;
}

#wrap > div:nth-child(5){
clear: both;
}
#booktitle{
/* border: 1px dashed red; */
position: absolute;
width: 130px;
text-align: center;
top: 175px;
}
.bookcreate{
	/* border: 1px dashed red; */
	position: relative;
	width:100%;
	height: 30px;
	left: 85%;
	top: 30px;
}
#moviecreatebtn{
	position: relative;
	float: right;
	right: 6%;
	width: 80px;
	height: 28px;
	font-size: 15px;
}
.pull-bottom{
 /* 	border: 1px dashed red; */
	position: relative;
	text-align: center;
	width: 50%;
	left: 27%;
	top: 5px;
}
body{
	background-image: url("./resources/Image/forest1.jpg");
	background-repeat: no-repeat;
	background-position: left top;
	background-size: cover;

}
#bookposter{
	top: 1px;
	width: 127px;
	hegiht: 167px;
	object-fit:cover;
	border-radius: 5px 5px 5px 5px;

}

</style>
</head>

<body>
	<%@ include file="Fix/header.jsp" %>

	
	<br>
	<div class="categorybox">
		<div id="nav">
			<ul>
            	<li id="online">온라인 쇼핑</li>
	            <li id="moive" onclick="location.href='movieController?command=moiveListCate'">영화 </li>
	            <li id="shop" onclick="location.href='shop.do?command=shoplist'">매장</li>
	            <li id="book" onclick="location.href='bookController?command=bookListCate'">도서</li>
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
	       			<li><a href="">세부 카테고리1</a></li>
	       			<li><a href="">세부 카테고리2</a></li>
	       			<li><a href="">세부 카테고리3</a></li>
	       			<li><a href="">세부 카테고리4</a></li>
	       			<li><a href="">세부 카테고리5</a></li>
	       			<li><a href="">세부 카테고리6</a></li>	
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
					<c:choose>
						<c:when test="${empty categoryList }">
							<tr>
								<td colspan ="4">----작성된 글이 존재하지 않습니다----</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="cate" items="${categoryList }">
	       					<li onclick="location.href='bookController?command=bookList&category=${cate.book_type}&pageNum=1'">${cate.book_type_name }</li>
	       					</c:forEach>
						</c:otherwise>
					</c:choose>
	       		</ul>
	       	</div>
	    </div>
    </div>
	<br>
	
	
	
	
	
	
	<br>
	<br>
	<!-- book_type, book_type_name -->
	
	<section>
		<div id="container">
		<form id="bookform" name="bookform" action="bookController" method="post">
				<!--  목록 페이지 상단 (카테고리명, 정렬, 검색) -->
				<div class="top">
						<h1>${category_name}</h1>
					  
				</div>
		</form>

	<div id="box">
				<div id="wrap">
							<c:choose>
								<c:when test="${empty list }">
									<tr>
										<td colspan ="4">-------작성된글 x</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="dto" items="${list }">
									<div style="border-radius: 5px 5px 5px 5px;">
									
									<!-- 값 수정 -->
									<!--  <img src="${dto.book_img}">
									<div>${dto.book_title}</div> -->
									
              						<a href="bookController?command=bookDetail&book_id=${dto.book_id}&category_name=${category_name}"><img id="bookposter" src="resources/uploadImage/${dto.book_img}"></a>
									<div id="booktitle">${dto.book_title}</div>
									</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
					  </div>
					</div>
					<!-- 도서 등록 버튼 -->
					<div class="bookcreate">
					<input type="button" id="bookcreatebtn" value="도서등록" onclick="location.href='bookController?command=bookupdateform&category=${category}&category_name=${category_name}'">
					</div>
					<!-- 페이징 -->
					<nav class="pull-bottom">
				<c:set var="pageNum" value="${paging.pageNum }"/>
				<c:set var="startPage" value="${paging.startPage}"/>
				<c:set var="endPage" value="${paging.endPage}"/>
				<c:set var="totalPage" value="${paging.totalPage}"/>
				<c:set var="itemCount" value="${paging.itemCount}"/>
				<ul class="pagination">
					<li>
			      		<a href="bookController?command=bookList&category=${category}&pageNum=1" aria-label="Previous">
			        	<span aria-hidden="true">&laquo;</span>
			      		</a>
			    	</li>
					<c:forEach var="item" varStatus="status" begin="${ startPage }" end="${ endPage }" step="1">
                		<c:if test="${ pageNum == item }">
                    		<li><a href="bookController?command=bookList&category=${category}&pageNum=1">${ item }</a></li>
                		</c:if>
                		<c:if test="${ pageNum != item }">
		 					<li><a href="bookController?command=bookList&pageNum=${ item }&category=${category}">${ item }</a></li>
                		</c:if>
            		</c:forEach>
            		<li>
			      		<a href="bookController?command=bookList&pageNum=${totalPage}&category=${category}" aria-label="Next">
			        	<span aria-hidden="true">&raquo;</span>
			      		</a>
			    	</li>
				</ul>
			
			</nav>
					
		</div><!--container 끝 div  -->
	</section>
			
	
	
	<%@ include file="BookTop6.jsp" %>
	<br><br><br><br><br><br><br>
	
	<%@ include file="Fix/footer.jsp" %>
	
</body>

	
</html>