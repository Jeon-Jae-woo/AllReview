<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; UTF-8"); %>  

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 기본정보 등록 </title>

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
	border: 1px solid gray;
	height: 260px;
	background-image: url("./resources/Image/background02.jpg");
	background-repeat: no-repeat;
	background-position: left top;
	background-size: cover;
}
#nav{
	left: 0px;
	right:0px;
	height: 100px;
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
	color: white;
	font-weight: bold;
	font-size: 15px;
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
	/*display: none;*/
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
}

#subcategory1 ul li:hover{
	color:gray;
}

.category{
	position: absolute;
	float: left;
	top: 450px;
	left: 9%;
}

#box{
	width: 60%;
	height: 350px;
	border: 1px solid black;
	top: 180px;
	left: 9%;
	position: relative;
}

#wrap{
	border: 1px solid black;
	width: 280px;
	height: 330px;
	padding-top: 3px;
	position: relative;
  	top: 10px;
	left: 10px;
}

.poster{
	border: 1px dashed red;
	width: 270px;
	height: 320px;
	text-align: center;
	margin: auto;
	background: gray;
}

.list{
	position: relative;
	height: 320px;
	left: 28%;
	bottom: 315px;
	font-size: 18px;
	width: 800px;
	/* border: 1px solid; */
}

.list tr th{
text-align: center;
}

.attached_poster{
	float: left;
	left: 10%;
	top: 995px;
	position: absolute;
	font-size: 15px;
}

.comment{
	float: left;
	left: 10%;
	top: 965px;
	position: absolute;
	font-size: 15px;
}

.create{
	float: left;
	left: 32%;
	top: 1100px;
	position: absolute;
	font-size: 15px;
	width: 70px;
}
.cancel{
	float: left;
	left: 37%;
	top: 1100px;
	position: absolute;
	font-size: 15px;
	width: 70px;
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
            	<li id="moive" <%-- onclick="location.href='movieController?command=moiveListCate&movie_type=${dto.movie_type }'" --%>>영화</li>
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
	
		<!-- 영화 기본 정보 -->
		<div>
			<div class="category">
				<h1>${category_name}</h1>
			</div>
		
			<form action="movieController?command=moviecreate" method="post" enctype="multipart/form-data">
			<input type="hidden" name="category" value="${category }">
			<div id="box">
				<div id="wrap">
					<div class="poster">영화포스터</div>
				</div>
			     <table class="list"  style="text-align: left">
		            <tr>
		                <th style="width:100px" >영화제목 : </th>
		                <td style="width:250px"><input type="text" name="movie_title"></td>
		                
		            </tr>
		            <tr>
		                <th>기본정보 : </th>
		                <td><input type="text" name="movie_type_nm" value="${category_name}" readonly="readonly"></td>
		            </tr>
		             <tr>
		                <th>감독 : </th>
		                <td><input type="text" name="director"></td>
		            </tr>
		             <tr>
		                <th>출연 : </th>
		                <td><input type="text" name="actor"></td>
		            </tr>
		             <tr>
		                <th>participant : </th>
		                <td><input type="text" name="participant"></td>
		            </tr>
		        </table>	
		        
			</div>
			
			
			<div class="comment">영화 포스터를 첨부하세요</div>
			<div class="attached_poster">
				<input type="file" id="ex_file" name="poster">
			</div>
			
			<div>
				<input class="create" type="submit" value="등록">
				<input class="cancel" type="button" value="취소" onclick="location.href='movieController?command=moiveListCate'" >
			</div>
			</form>
			
			
		</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	<!-- 오른쪽 사이드 Top5 테아블 -->		
	<%@ include file="MovieTop5.jsp" %>
	<br><br><br><br><br><br><br>
	
	<!-- footer -->
	<%@ include file="../Fix/footer.jsp" %>

</body>
</html>