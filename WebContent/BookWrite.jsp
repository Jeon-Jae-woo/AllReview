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
	color:white;
	font-weight: bold;
	text-shadow: 1px 1px 1px gray;
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
.side_table{
	/* border: 1px dashed red; */
	float: right;
	position: absolute;
	right: 30px;
	height: 600px;
	top: 550px;
	
}

#reco_tb{
	width: 300px;
	text-align: center;
	height: 200px;
	color: black;
	font-weight: bold;
 	/* text-shadow: 1px 1px 1px gray; */
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );
	

}
#view_tb{
	top:350px;
	width: 300px;
	text-align: center;
	height: 200px;
	color: black;
	font-weight: bold;
 	/* text-shadow: 1px 1px 1px gray; */
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );
}
body{
	background-image: url("./resources/Image/forest1.jpg");
	background-repeat: no-repeat;
	background-position: left top;
	background-size: cover;

}

	
	
</style>
</head>
<body onload="LoadPage();">

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
		<h3> 도서 리뷰 작성</h3>
	</div>
	
	<!-- 리뷰 게시글 작성 -->
	<div>
		<div class="totalbox">
			<form action="bookController?command=reviewWrite" method="post" enctype="multipart/form-data">
 				<input type="hidden" name="command" value="reviewWrite">
 				<input type="hidden" name="book_id" value="${book_id }">
				<div class="titlebox">
					<input type="text" name="title" id="reviewtitle" placeholder="리뷰 제목을 입력하세요">
				</div>
				<div class="contentbox">
					<textarea rows="25" cols="104" id="content" placeholder="내용을 작성 하세요" name="content"></textarea>
				</div>
				<div class="bottonmbox">
				<br>
				<br>
					<div class="imgupload">
						이미지 첨부: <input type="file" id="ex_file" name="uploadImg">
					</div>
					<div class="reciptupload">
						영수증 첨부: <input type="file" id="ex_file" name="receipt">
					</div>
					<div class="bookgrade">
						영화평점: <input type="radio" name="bookgrade" value="5">
						<input type="radio" name="bookgrade" value="4">
						<input type="radio" name="bookgrade" value="3">
						<input type="radio" name="bookgrade" value="2">
						<input type="radio" name="bookgrade" value="1">
					</div>
					<div class="bottonbutton">
						<input class="reviewwrite" type="submit" value="등록">
						<input class="reviewcancel" type="button" value="취소" onclick="javascript:history.back(-1)">
					</div>
				
				</div>	
		
			</form>
		</div>
		
			
	</div>
				
	<%@ include file="BookTop6.jsp" %>	
	
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	<%@ include file="Fix/footer.jsp" %>

	
</body>
</html>