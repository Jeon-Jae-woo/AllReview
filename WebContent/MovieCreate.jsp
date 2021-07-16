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
 
 function previewImage(targetObj, previewId) {
	 var preview = document.getElementById(previewId);  //div id   
	 var ua = window.navigator.userAgent; 
	 
	 if (ua.indexOf("MSIE") > -1) {  //ie일때
		 targetObj.select(); 
	 
	 try { var src = document.selection.createRange().text;   // get file full path 
	 var ie_preview_error = document .getElementById("ie_preview_error_" + previewId); 
	 
	 if (ie_preview_error) { preview.removeChild(ie_preview_error);   //error가 있으면 delete
	 } 
	 
	 var img = document.getElementById(previewId);    //이미지가 뿌려질 곳 
	 img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + src + "', sizingMethod='scale')";
	 //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
	
	 } catch (e) {
		 if (!document.getElementById("ie_preview_error_" + previewId)) { 
			 var info = document.createElement("<p>");
			 info.id = "ie_preview_error_" + previewId;
			 info.innerHTML = "a"; preview.insertBefore(info, null);
			 }
		 }
	 } else {   //ie가 아닐때
		 var files = targetObj.files;
	 for ( var i = 0; i < files.length; i++) { 
		
		 var file = files[i];
		 
		 var imageType = /image.*/;    //이미지 파일일경우만.. 뿌려준다.
		 if (!file.type.match(imageType)) 
			 continue; 
		 
		 var prevImg = document.getElementById("prev_" + previewId);      //이전에 미리보기가 있다면 삭제
		 if (prevImg) {
			 preview.removeChild(prevImg);
			 }
		 
		 var img = document.createElement("img"); //크롬은 div에 이미지가 뿌려지지 않는다. 그래서 자식Element를 만든다
		 img.id = "prev_" + previewId;
		 img.classList.add("obj");
		 img.file = file; 
		 img.style.width = '270px';      //기본설정된 div의 안에 뿌려지는 효과를 주기 위해서 div크기와 같은 크기를 지정해준다
		 img.style.height = '320px'; 
		 preview.appendChild(img); 
		 
		 if (window.FileReader) { 
		 var reader = new FileReader();
		 reader.onloadend = (function(aImg) {
			 return function(e) {
				 aImg.src = e.target.result;
				 };
				 })(img);
		 reader.readAsDataURL(file);
		 } else { 		 
		 if (!document.getElementById("sfr_preview_error_" + previewId)) {
			 var info = document.createElement("p");
			 info.id = "sfr_preview_error_" + previewId;
			 info.innerHTML = "not supported FileReader";
			 preview.insertBefore(info, null);
			 }
		 }
		 }
	 }
	 }
 

</script>



<style type="text/css">
	
.categorybox{
/* 	border: 1px solid gray; */
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
	font-size: 18px;
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
	top: 65%;
	left: 9%;
	color: white;
}
#box{
	width: 60%;
	height: 350px;
	border: 1px solid black;
	top: 160px;
	left: 9%;
	position: relative;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );
	border-radius: 5px 5px 5px 5px;
}
#wrap{
	border: 1px solid black;
	width: 280px;
	height: 330px;
	padding-top: 3px;
	position: relative;
  	top: 10px;
	left: 10px;
	border-radius: 5px 5px 5px 5px;
}
.poster{
	border-radius: 5px 5px 5px 5px;
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
	color: black;
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
	color: white;
}
.comment{
	float: left;
	left: 10%;
	top: 965px;
	position: absolute;
	font-size: 15px;
	color: white;
}
.create{
	float: left;
	left: 34%;
	top: 1050px;
	position: absolute;
	font-size: 15px;
	width: 70px;
}
.cancel{
	float: left;
	left: 40%;
	top: 1050px;
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

	<!-- header -->
	<%@ include file="../Fix/header.jsp" %>
	
	<!-- 카테고리 박스  -->
	<div class="categorybox">
		<div id="nav">
			<ul>
            	<li id="online" onclick="location.href='onlineController?command=list'">온라인 쇼핑</li>
            	<li id="moive" onclick="location.href='movieController?command=moiveListCate'">영화 </li>
            	<li id="shop" onclick="location.href='shop.do?command=shoplist'">매장</li>
            	<li id="book" onclick="location.href='bookController?command=bookList'">도서</li>
            </ul>
		</div>
		<div id="subcategorybox">
	       	<div id="subcategory1">
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
					<div class="poster">
						<div id='previewId' style='width: 270px; height: 320px; position: absolute; '></div>
					</div>
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
		             <tr style="display:none">
		                <th>participant : </th>
		                <td><input type="text" name="participant"></td>
		            </tr>
		        </table>	
		        
			</div>
			
			
			<div class="comment">영화 포스터를 첨부하세요</div>
			<div class="attached_poster">
				<input type="file" id="ex_file" name="poster" onchange="previewImage(this,'previewId')" >
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