<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; UTF-8"); %>      

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 기본정보 및 리뷰 리스트 조회</title>

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

.category{
	position: absolute;
	float: left;
	top: 500px;
	left: 9%;
	color: white;
	font-weight: bold;
	text-shadow: 1px 1px 1px gray;
}
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
	/* border: 1px dashed red; */
	width: 270px;
	height: 357px;
	text-align: center;
	margin: auto;
	/* background: gray; */
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
	float: right;
	position: absolute;
	right: 31%;
	top: 1320px;
}

#writebutton{
	position: relative;
	font-size: 15px;
	height: 30px;
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
	       			<li onclick="">세부 카테고리1</li>
	       			<li onclick="">세부 카테고리2</li>
	       			<li onclick="">세부 카테고리3</li>
	       			<li onclick="">세부 카테고리4</li>
	       			<li onclick="">세부 카테고리5</li>
	       			<li onclick="">세부 카테고리6</li> 			
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

	
	<!-- 영화기본정보 + 리뷰리스트 조회 -->
	<div>
		<div class="category">
			<h2>${category_name}</h2>
		</div>
	
		<!-- 영화 기본 정보 -->
		<div id="box" style="border-radius: 5px 5px 5px 5px;">
			<div id="wrap" style="border-radius: 5px 5px 5px 5px;">
				<div class="poster" style="border-radius: 5px 5px 5px 5px;"><img id="movieposter" src="resources/uploadImage/${dto.movie_img}"></div>
			</div>
		     <table class="list"  style="text-align: left">
				<tr>
		        	<th style="width:100px" >도서명 : </th>
		            <td style="width:250px">${dto.book_title }</td>
	            </tr>
	            <tr>
	                <th>기본정보 : </th>
	                <td>${dto.book_type_name}</td>
	            </tr>
	             <tr>
	                <th>작가 : </th>
	                <td>${dto.writer}</td>
	            </tr>
	             <tr>
	                <th>출판사 : </th>
	                <td>${dto.publisher}</td>
	            </tr>
	        </table>	
		</div>
	
		<!-- 영화 리뷰리스트  -->
		<div>
			<div class="listtitle">
				<h4>${dto.book_title }  Review List</h4>
			</div>
	
			<table class="table text-center table-hover" id="mypage_board">
				<thead>
					<tr>
						<th class="active text-center" style="width:250px; height:45px;">제목</th>
						<th class="active text-center" style="width:100px">닉네임</th>
						<th class="active text-center" style="width:100px">날짜</th>
						<th class="active text-center" style="width:100px">평점</th>
						<th class="active text-center" style="width:80px">추천</th>
						<th class="active text-center" style="width:80px">조회</th>
					</tr>
				</thead>
				<tbody >
					<c:choose>
						<c:when test="${empty totalList }">
							<tr>
								<td colspan="4">작성된 글이 존재하지 않습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="list" items="${totalList}">
								<tr>
									<td><a href="bookController?command=reviewDetail&review_id=${list.review_id}">${list.review_title}</a></td>
									<td>${list.nickname }</td>
									<td>${list.creatat}</td>
									<td>${list.book_grade}</td>
									<td>${list.review_r_num }</td>
									<td>${list.review_v_num }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		
			<!-- 게시글 작성 버튼  -->
			<div class="bottombutton">
				<input id="writebutton" type="button" value="리뷰 등록하기" onclick="location='bookController?command=reviewWriteForm&book_id=${book_id}'">
			</div>
			
			<!-- 페이징처리 -->
			<div class="page_wrap">
			   <div class="page_nation">
			     			<!-- 페이징처리 -->
			<nav class="pull-bottom">
			<c:set var="pageNum" value="${paging.pageNum }"/>
			<c:set var="startPage" value="${paging.startPage}"/>
			<c:set var="endPage" value="${paging.endPage}"/>
			<c:set var="totalPage" value="${paging.totalPage}"/>
			<c:set var="itemCount" value="${paging.itemCount}"/>
				<ul class="pagination">
					
					<li>
			      		<a href="movieController?command=detail&movie_id=${movie_id}&pageNum=1" aria-label="Previous">
			        	<span aria-hidden="true">&laquo;</span>
			      		</a>
			    	</li>
					<c:forEach var="item" varStatus="status" begin="${ startPage }" end="${ endPage }" step="1">
                		<c:if test="${ pageNum == item }">
                    		<li><a href="bookController?command=detail&book_id=${book_id}&pageNum=1">${ item }</a></li>
                		</c:if>
                		<c:if test="${ pageNum != item }">
		 					<li><a href="bookController?command=detail&pageNum=${ item }&movie_id=${book_id}">${ item }</a></li>
                		</c:if>
            		</c:forEach>
            		<li>
			      		<a href="bookController?command=detail&pageNum=${totalPage}&book_id=${book_id}" aria-label="Next">
			        	<span aria-hidden="true">&raquo;</span>
			      		</a>
			    	</li>
				</ul>
				
			
			</nav>
			   </div>
			</div>
			
		</div>
	
	
	</div>
	<!-- 추천수 조회수 top5 -->
	<%@ include file="BookTop6.jsp" %>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br>
			
	<!-- footer  -->
	<%@ include file="../Fix/footer.jsp" %>


</body>
</html>