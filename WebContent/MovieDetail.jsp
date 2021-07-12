<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; UTF-8"); %>   

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰(게시글) 확인</title>

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

.title{
	position: absolute;
	float: left;
	left: 9%;
	top: 500px;
	color:white;
}
.totalbox{
	height: 800px;
	left: 9%;
	width: 60%;
	top: 140px;
	position: relative;
	
	
}
.titlebox{
	border: 1px solid gray;
	height: 60px;
	left: 1%;
	width: 98%;
	top: 10px;
	position: relative;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );
}
#title{
	position: relative;
	left: 20px;
	top: 20px;
	
	
}
#nickname{
	position: relative;
	left: 42%;	
	
}
#moviegrade{
	position: relative;
	left: 62%;
	bottom: 20px;
	
}
#recommand{
	position: relative;
	left: 80%;
	bottom: 39px;
	
}
#view{
	position: relative;
	left: 90%;
	bottom: 59px;
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
	position: relative;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );
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
body{
	background-image: url("./resources/Image/forest1.jpg");
	background-repeat: no-repeat;
	background-position: left top;
	background-size: cover;

}
 
</style>

</head>
<body>

	<!-- header -->
	<%@ include file="../Fix/header.jsp" %>
	
	<!-- 카테고리 박스  -->
	<div class="categorybox">
		<div id="nav">
			<ul>
            	<li id="online">온라인 쇼핑</li>
            	<li id="moive" <%-- onclick="location.href='movieController?command=moiveListCate&movie_type=${dto.movie_type } --%>'">영화</li>
            	<li id="shop">매장</li>
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
					<div>닉네임　 ${dto.nickname }</div>
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
				<input id="update" type="button" value="목록" onclick="location='movieController?command=detail&movie_id=${dto.movie_id}&category_name=${category_name}'">
				<input id="delete" type="button" value="삭제" onclick="location.href='movieController?command=reviewDelete&movie_id=${dto.movie_id}&review_id=${dto.review_id}'">
			</div>
		</div>
	</div>
	
	<!-- 조회순 추천순 top5 -->
	<%@ include file="MovieTop5.jsp" %>
	
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	<!-- footer -->
	<%@ include file="../Fix/footer.jsp" %>

</body>
</html>