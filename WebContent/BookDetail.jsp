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
	/*border: 1px solid gray;*/
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
	/*display: none;*/
}

#subcategory1 ul li{
	border-inline: 1px solid lightgray;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.4 );
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
	color: white;
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
#bookgrade{
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
	       					<li><a href="bookController?command=bookList&category=${cate.book_type}&pageNum=1">${cate.book_type_name }</a></li>
	       					</c:forEach>
						</c:otherwise>
					</c:choose>
	       		</ul>
	       </div>
	    </div>
    </div>
	<br>
	
	<div class="title">
		<h3>리뷰글 상세보기</h3>
	</div>
	
	<div>
		<div class="totalbox">
		 <div class="titlebox">
			<div id="title">
				<div>${dto.review_title }</div>
			</div>
			<div id="nickname">
				<div>닉네임: ${dto.nickname }</div>
			</div>
			<div id="bookgrade">
				<div>도서평점: ${dto.book_grade }</div>
			</div>
			<div id="recommand">
				<div>추천: ${dto.review_r_num }</div>
			</div>
			<div id="view">
				<div>조회: ${dto.review_v_num }</div>
			</div>
	
		</div>
		<!-- 내용부분 -->
		<div class="contentbox">
			<div id="date">
				<div>작성일: ${dto.rcreateat }</div>
			</div>
			<div id="content">
				<textarea rows="23" cols="118" readonly="readonly">${dto.review_content }</textarea>
				<img alt="" src="resources/uploadImage/${dto.review_img}" width="200" height="200">
			</div>
		</div>
		<div class="bottombox">
				<input id="reco_button" type="submit" value="추천">
				<input id="repo_button" type="submit" value="신고">
			</div>
			<div class="lastbutton">
				<input id="list" type="button" value="수정" onclick="location='bookController?command=reviewUpdateForm&review_id=${dto.review_id}'">
				<input id="update" type="button" value="목록" onclick="location='BookImfo.jsp'">
				<input id="delete" type="button" value="삭제" onclick="location.href='bookController?command=reviewDelete&book_id=${dto.book_id}&review_id=${dto.review_id}'">
			</div>
			<c:set var="level" value="${level}"/>
		<c:set var="status" value="${dto.status}"/>
		<br><br>
			<!-- 관리자만 보이도록 설정  -->
			<c:choose>
				<c:when test="${status eq '0'}">
					<c:choose>
						<c:when test="${level eq '1' || level eq '2'}">
							<input id="list" type="button" value="승인" onclick="location='adminController?command=approval&review_id=${dto.review_id}&bigCate=${bigCate}&status=1'">
							<input id="list" type="button" value="거절" onclick="location='adminController?command=approval&review_id=${dto.review_id}&bigCate=${bigCate}&status=2'">
						</c:when>
					</c:choose>
				</c:when>
			</c:choose>
			
				
					<c:choose>
						<c:when test="${level eq '1' || level eq '2'}">
							<img alt="" src="resources/uploadImage/${dto.receipt}" width="200" height="200">
						</c:when>
					</c:choose>
			
		</div>
	</div>
	
	
	
	<%@ include file="BookTop6.jsp" %>
	
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	<%@ include file="Fix/footer.jsp" %>
	

</body>
</html>