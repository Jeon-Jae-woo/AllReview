<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
}); 
 */
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
	left: 4%;
	width: 15%;
	text-shadow: 1px 1px 1px gray;
}
#subcategory1 ul li:hover{
	color:gray;
}

/* .category{
	border: 1px dashed red;
	position: absolute;
	float: left;
	top: 500px;
	left: 9%;
} */


#box{
	width: 60%;
	height: 383px;
	border: 1px solid black;
	top: 140px;
	left: 9%;
	position: relative;
	color: black;
	font-weight: bold;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );
}

#wrap{
	border: 1px solid black;
	width: 280px;
	height: 364px;
	padding-top: 3px;
	position: relative;
  	top: 10px;
	left: 10px;
}



.poster{
	width: 270px;
	height: 357px;
	text-align: center;
	margin: auto;
}



.list{
	position: relative;
	height: 320px;
	left: 33%;
	bottom: 330px;
	font-size: 18px;
	width: 800px;
}

.list tr th{
text-align: center;
}

.listtitle{
	float: left;
	left: 9%;
	position: absolute;
	top: 1020px;
	color: white;
	font-weight: bold;
} 

#mypage_board{
	width:60%;
	margin-top:20px;
	margin-left:auto;
	margin-bottom:20px;
	margin-right:auto;
	position: relative;
	top: 240px;
	float: left;
	left: 9%;
	color: black;
	font-weight: bold;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );
}

.bottombutton{
	border: 1px dashed red;
	float: right;
	position: relative;
	right: 31%;
}

#writebutton{
	position: relative;
	font-size: 15px;
	height: 30px;
	top: 550px;
}
.pull-bottom{
	position: relative;
	width: 400px;
	height: 40px;
	top: 550px;
	float: right;
	right: 50%;

}
.pagination{
	position: relative;
	left: 40%;
	bottom: 19px;
}
body{
	background-image: url("./resources/Image/forest1.jpg");
	background-repeat: no-repeat;
	background-position: left top;
	background-size: cover;

}
h2{
	display: inline;
	position: relative;
	left: 5%;
	top: 5px;
	color: white;
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

#bookposter{
	top: 1px;
	width: 270px;
	hegiht: 290px;
	object-fit:cover;
	border-radius: 5px 5px 5px 5px;

	
}
</style>
</head>
<body>

	<%@ include file="Fix/header.jsp" %>
	<br>
	
	<div class="categorybox">
		<div id ="nav">
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
	       					<li onclick="location.href='bookController?command=bookList&category=${cate.book_type}&pageNum=1">${cate.book_type_name }</a></li>
	       					</c:forEach>
						</c:otherwise>
					</c:choose>
	       		</ul>
	       	</div>
	    </div>
    </div>
	<br>
	
	    
			<div class="category">
			<h2>${category_name}</h2>
			</div>
		
		<!-- 도서 기본 정보 -->
		<div id="box" style="border-radius: 5px 5px 5px 5px;">
			<div id="wrap"  style="border-radius: 5px 5px 5px 5px;">
				<div class="poster" style="border-radius: 5px 5px 5px 5px;"><img id="bookposter" src="resources/uploadImage/${bookInfo.book_img}">
				</div>
			</div>
			<table class="list" style="text-align: left">
				<tr>
					<th style="width:100px">도서명: </th>
					<td style="width:250px">${bookInfo.book_title }</td>
				</tr>
				<tr>
					<th>기본정보: </th>
					<td>${bookInfo.book_type_name}</td>
				</tr>
				<tr>
					<th>작가: </th>
					<td>${bookInfo.writer }</td>
				</tr>
				<tr>
					<th>출판사: </th>
					<td>${bookInfo.publisher}</td>
				</tr>
			</table>
		</div>
		<!-- 리뷰 리스트 보여주기 -->
		<div>
			<div class="listtitle">
				<h4>${bookInfo.book_title}</h4>
			</div>
			<table class="table text-center table=hover" id="mypage_board">
				<thead>
					<tr>
						<th class="active text-center" style="width:250px; height:45px;">제목</th>
						<th class="active text-center" style="width:100px">닉네임</th>
						<th class="active text-center" style="width:100px">날짜</th>
						<th class="active text-center" style="width:80px">평점</th>
						<th class="active text-center" style="width:80px">추천</th>
						<th class="active text-center" style="width:80px">조회</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty reviewList }">
							<tr>
								<td colspan="4">작성된 글이 존재하지 않습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="list" items="${reviewList}">
								<tr>
									<td><a href="bookController?command=reviewDetail&review_id=${list.review_id}">${list.review_title}</a></td>
									<td>${list.nickname }</td>
									<td>${list.rcreateat}</td>
									<td>${list.book_grade }
									<td>${list.review_r_num }</td>
									<td>${list.review_v_num }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					
				</tbody>
				
			</table>
		
			<div class="buttonbutton">
				<input id="writebutton" type="button" value="리뷰 등록하기" onclick="location.href='bookController?command=reviewWriteForm&book_id=${bookInfo.book_id}'">
			</div>
		
		
	
			<nav class="pull-bottom">
			<c:set var="pageNum" value="${paging.pageNum }"/>
			<c:set var="startPage" value="${paging.startPage}"/>
			<c:set var="endPage" value="${paging.endPage}"/>
			<c:set var="totalPage" value="${paging.totalPage}"/>
			<c:set var="itemCount" value="${paging.itemCount}"/>
				<ul class="pagination">
					<li>
			      		<a href="bookController?command=bookDetail&book_id=${book_id }&pageNum=1" aria-label="Previous">
			        	<span aria-hidden="true">&laquo;</span>
			      		</a>
			    	</li>
					<c:forEach var="item" varStatus="status" begin="${ startPage }" end="${ endPage }" step="1">
                		<c:if test="${ pageNum == item }">
                    		<li><a href="bookController?command=bookDetail&book_id=${book_id }&pageNum=1">${ item }</a></li>
                		</c:if>
                		<c:if test="${ pageNum != item }">
		 					<li><a href="bookController?command=bookDetail&pageNum=${ item }&book_id=${book_id }">${ item }</a></li>
                		</c:if>
            		</c:forEach>
            		<li>
			      		<a href="bookController?command=bookDetail&pageNum=${totalPage}&book_id=${book_id }" aria-label="Next">
			        	<span aria-hidden="true">&raquo;</span>
			      		</a>
			    	</li>
				</ul>
			
			</nav>
	</div>
	
	<%@ include file="BookTop6.jsp" %>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br>
	
	<%@ include file="Fix/footer.jsp" %>
</body>
</html>