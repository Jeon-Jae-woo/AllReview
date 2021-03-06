<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; UTF-8"); %>  

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
	height: 260px;


}
#nav{
	left: 0px;
	right: 0px;
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

.category{
	position: absolute;
	float: left;
	top: 450px;
	left: 9%;
	color: white;
}

#box{
	width: 60%;
	height: 350px;
	border: 1px solid black;
	top: 180px;
	left: 9%;
	position: relative;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );
	
	
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
	top: 1030px;
	position: absolute;
	font-size: 15px;
	color: white;
}

.comment{
	float: left;
	left: 10%;
	top: 1000px;
	position: absolute;
	font-size: 15px;
	color: white;
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
            	<li id="online">????????? ??????</li>
	            <li id="moive" onclick="location.href='movieController?command=moiveListCate'">?????? </li>
	            <li id="shop" onclick="location.href='shop.do?command=shoplist'">??????</li>
	            <li id="book" onclick="location.href='bookController?command=bookListCate'">??????</li>
            </ul>
		</div>
		<div id="subcategorybox">
	       	<div id="subcategory1">
	       		<ul id="online_sub">
	       			<li><a href="">?????? ????????????1</a></li>
	       			<li><a href="">?????? ????????????2</a></li>
	       			<li><a href="">?????? ????????????3</a></li>
	       			<li><a href="">?????? ????????????4</a></li>
	       			<li><a href="">?????? ????????????5</a></li>
	       			<li><a href="">?????? ????????????6</a></li>
	       		</ul>
	       		<ul id="movie_sub">
	       			<li><a href="">?????? ????????????1</a></li>
	       			<li><a href="">?????? ????????????2</a></li>
	       			<li><a href="">?????? ????????????3</a></li>
	       			<li><a href="">?????? ????????????4</a></li>
	       			<li><a href="">?????? ????????????5</a></li>
	       			<li><a href="">?????? ????????????6</a></li>	
	       		</ul>
	       		<ul id="shop_sub">
	       			<li><a href="">?????? ????????????1</a></li>
	       			<li><a href="">?????? ????????????2</a></li>
	       			<li><a href="">?????? ????????????3</a></li>
	       			<li><a href="">?????? ????????????4</a></li>
	       			<li><a href="">?????? ????????????5</a></li>
	       			<li><a href="">?????? ????????????6</a></li>
	       		</ul>
	       		<ul id="book_sub">
					<c:choose>
						<c:when test="${empty categoryList }">
							<tr>
								<td colspan ="4">----????????? ?????? ???????????? ????????????----</td>
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
	<!-- ????????? ???????????? -->
	<div>
			<div class="category">
				<h1>${category_name}</h1>
			</div>
		
			<form action="bookController?command=bookupdate" method="post" enctype="multipart/form-data">
			<input type="hidden" name="category" value="${category }">
			<div id="box">
				<div id="wrap">
					<div class="poster">?????? ??????</div>
				</div>
			     <table class="list"  style="text-align: left">
		            <tr>
		                <th style="width:100px" >????????? : </th>
		                <td style="width:250px"><input type="text" name="book_title"></td>
		                
		            </tr>
		            <tr>
		                <th>???????????? : </th>
		                <td><input type="text" name="book_type_nm" value="${category_name}" readonly="readonly"></td>
		            </tr>
		             <tr>
		                <th>?????? : </th>
		                <td><input type="text" name="writer"></td>
		            </tr>
		             <tr>
		                <th>????????? : </th>
		                <td><input type="text" name="publisher"></td>
		            </tr>
		        </table>	
		        
			</div>
			
			
			<div class="comment">?????? ??????</div>
			<div class="attached_poster">
				<input type="file" id="ex_file" name="poster">
			</div>
			
			<div>
				<input class="create" type="submit" value="??????">
				<input class="cancel" type="button" value="??????" onclick="location.href='bookController?command=bookListCate'" >
			</div>
			</form>
			
			
		</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	<!-- ????????? ????????? Top5 ????????? -->		
	<%@ include file="BookTop6.jsp" %>
	<br><br><br><br><br><br><br>
	
	<!-- footer -->
	<%@ include file="../Fix/footer.jsp" %>	
</body>
</html>