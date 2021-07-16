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
});  */
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
	background-color: black;
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
.headtitle{
	position: absolute;
	float: left;
	top: 500px;
	left: 9%;
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

.contentbox{
	border: 1px solid gray;
	height: 550px;
	left: 1%;
	width: 98%;
	top: 20px;
	position: relative;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );
	
}

#reviewtitle{
	position: relative;
	top:11px;
	left: 15px;
	width: 40%;
	height: 35px;
}
#content{
	position: relative;
	top:11px;
	left: 15px
}

.bottombox{
	/* border: 1px dashed red; */
	position: relative;
	top: 20px;
}

.imgupload{
	position: relative ;
	top:20px;
	left: 25px;
	width: 250px;
	color: white;
}

.reciptupload{
	position: relative;	
	bottom: 24px;
	left: 260px;
	width: 250px; 
	color: white;
}

.bookgrade{
	position: relative;	
	bottom: 50px;
	left: 600px;
	width: 250px; 
	color: white;
}

.reviewwrite{
	position: relative;
	left: 340px;
	top: 30px;
	width: 80px;
}
.reviewcancel{
	position: relative;
	left: 370px;
	top: 30px;
	width: 80px;
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
	
	
	
	<div class="headtitle">
	 <h3>도서 리뷰 수정</h3>
	</div>
	
	<div>
	<div class="totalbox">
	<form action="bookController" method="post">
 		<input type="hidden" name="command" value="reviewUpdate">
 		<input type="hidden" name="review_id" value="${dto.review_id }">
		
		<div class="titlebox">
			<input type="text" name="reviewtitle" id="reviewtitle" value="${dto.review_title }">
		</div>
		<div class="contentbox">
			<textarea rows="25" cols="104" id="content" name="content">${dto.review_content }</textarea>
		</div>
		<div class="bottombox">
			<div class="imgupload">
				이미지 첨부: <input type="file" id="ex_file">
			</div>
			<div class="reciptupload">
				영수증 첨부: <input type="file" id="ex_file">
			</div>
			<div class="bookgrade">
				도서평점: <input type="radio" name="bookgrade" value="5">
				<input type="radio" name="bookgrade" value="4">
				<input type="radio" name="bookgrade" value="3">
				<input type="radio" name="bookgrade" value="2">
				<input type="radio" name="bookgrade" value="1">
			</div>
		</div>
			<div class="bottombutton">
				<input class="reviewwrite" type="submit" value="수정" onclick="location='bookController?command=bookdetail&book_id=${dto.book_id}'">
				<input class="reviewcancel" type="button" value="취소" onclick="location='bookController?command=bookdetail&book_id=${dto.book_id}'">
			</div>
		</form>
	</div>
	</div>	
		
		
	<%@ include file="BookTop6.jsp" %>	
	
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	<%@ include file="Fix/footer.jsp" %>

	
</body>
</html>