<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; UTF-8"); %>      

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리스트 조회</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">

.category{
	position: absolute;
	float: left;
	top: 500px;
	left: 9%;
}

#box{
	width: 60%;
	height: 350px;
	border: 1px solid black;
	top: 480px;
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

.listtitle{
	float: left;
	left: 9%;
	position: absolute;
	top: 1020px;
} 

.select{
	float: right;
	right: 31%;
	top: 1030px;
	position: absolute;
	font-size: 15px;
}

#mypage_board{
	/* border: 1px dashed red; */
	width:60%;
	margin-top:20px;
	margin-left:auto;
	margin-bottom:20px;
	margin-right:auto;
	position: relative;
	top: 600px;
	float: left;
	left: 9%;
}

.bottombutton{
	float: right;
	position: absolute;
	right: 31%;
	top: 1350px;
}

#writebutton{
	font-size: 15px;
	height: 30px;
}

.page_wrap {
	text-align:center;
	font-size:0;

 }
.page_nation {
	/* border: 1px dashed red; */
	position: absolute;
	float: left;
	left: 30%;
	top: 1400px;
	
}
.page_nation .none {
	display:none;
}
.page_nation a {
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
.page_nation .arrow {
	border:1px solid #ccc;
}
.page_nation .pprev {
/* 	background:#f8f8f8 url('Image/page_pprev.png') no-repeat center center;
 */	margin-left:0;
}
.page_nation .prev {
	/* background:#f8f8f8 url('Image/page_prev.png') no-repeat center center;
	 */margin-right:7px;
}
.page_nation .next {
/* 	background:#f8f8f8 url('Image/page_next.png') no-repeat center center;
 */	margin-left:7px;
}
.page_nation .nnext {
/* 	background:#f8f8f8 url('Image/page_nnext.png') no-repeat center center;
 */	margin-right:0;
}
.page_nation a.active {
	background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
}


</style>

</head>
<body>

	<!-- header -->
	<%@ include file="../Fix/header.jsp" %>
	
	<div>
		<div class="category">
			<h2>액션</h2>
		</div>
	
		<!-- 영화 기본 정보 -->
		<div id="box">
			<div id="wrap">
				<div class="poster">${dto.movie_img}</div>
			</div>
		     <table class="list"  style="text-align: left">
							<tr>
					        	<th style="width:100px" >영화제목 : </th>
					            <td style="width:250px">${dto.movie_title }</td>
				            </tr>
				            <tr>
				                <th>기본정보 : </th>
				                <td>${dto.movie_type_name}</td>
				            </tr>
				             <tr>
				                <th>감독 : </th>
				                <td>${dto.director}</td>
				            </tr>
				             <tr>
				                <th>출연 : </th>
				                <td>${dto.actor }</td>
				            </tr>
				           
		     	

	        </table>	
		</div>
	
		<!-- 리뷰리스트  -->
		<div>
			<div class="listtitle">
				<h4>${dto.movie_title }  Review List</h4>
			</div>
			<div class="select">
				<select style="width:100px; height: 25px;" onchange=>
					<option value="">제목순</option>
					<option value="">조회순</option>
					<option value="">추천순</option>					
				</select>
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
									<td><a href="movieController?command=reviewDetail&review_id=${list.review_id}">${list.review_title}</a></td>
									<td>${list.nickname }</td>
									<td>${list.creatat}</td>
									<td>${list.movie_grade}</td>
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
				<!-- <input id="writebutton" type="button" value="리뷰 등록하기" onclick="location='MovieWrite.jsp'">-->
				<input id="writebutton" type="button" value="리뷰 등록하기" onclick="location='movieController?command=reviewWriteForm&movie_id=${movie_id}'">
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
                    		<li><a href="movieController?command=detail&movie_id=${movie_id}&pageNum=1">${ item }</a></li>
                		</c:if>
                		<c:if test="${ pageNum != item }">
		 					<li><a href="movieController?command=detail&pageNum=${ item }&movie_id=${movie_id}">${ item }</a></li>
                		</c:if>
            		</c:forEach>
            		<li>
			      		<a href="movieController?command=detail&pageNum=${totalPage}&movie_id=${movie_id}" aria-label="Next">
			        	<span aria-hidden="true">&raquo;</span>
			      		</a>
			    	</li>
				</ul>
				
			
			</nav>
			   </div>
			</div>
			
			
		</div>
	
	
	</div>

	<%@ include file="MovieTop5.jsp" %>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br>
	
	<!-- footer  -->
	<%@ include file="../Fix/footer.jsp" %>


</body>
</html>