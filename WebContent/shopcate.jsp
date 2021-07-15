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



<link rel="stylesheet" type="text/css" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<style type="text/css">
.catetb{
	margin-right: 30%;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );
	font-weight: bold;
}

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
/* 	border:1px dashed red; */
	height: 100px;
	position: relative;
	top: 20px;
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
	background-color: white;
	text-shadow: 1px 1px 1px gray;
	background-color: rgba( 255, 255, 255, 0.8 );
}
#view_tb{
	top:350px;
	width: 300px;
	text-align: center;
	height: 200px;
	background-color: white;
	text-shadow: 1px 1px 1px gray;
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
<body>
	<header ><%@ include file="Fix/header.jsp" %></header>
	
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
	       			<li onclick="location.href='shop.do?command=shoplist&category_no=1'">식품</li>
	       			<li onclick="location.href='shop.do?command=shoplist&category_no=2'">운동</li>
	       			<li onclick="location.href='shop.do?command=shoplist&category_no=3'">의류</li>
	       			<li onclick="location.href='shop.do?command=shoplist&category_no=4'">여행</li>
	       			<li onclick="location.href='shop.do?command=shoplist&category_no=5'">의료</li>
	       			<li onclick="location.href='shop.do?command=shoplist&category_no=6'">기타</li>
	       		</ul>
			</div>
		</div>
	</div>
	

	<!-- <div align="center">
	<table>
		<tr>
		<th width="15%">
			<a href="shop.do?command=shoplist&category_no=1">식품</a>
		</th>
		<th width="15%">
			<a href="shop.do?command=shoplist&category_no=2">운동</a>
		</th>
		<th width="15%">
			<a href="shop.do?command=shoplist&category_no=3">의류</a>
		</th>
		<th width="15%">
			<a href="shop.do?command=shoplist&category_no=4">여행</a>
		</th>
		<th width="15%">
			<a href="shop.do?command=shoplist&category_no=5">의료</a>
		</th>
		<th width="15%">
			<a href="shop.do?command=shoplist&category_no=6">기타</a>
		</th>
		</tr>
	</table>
	</div> -->


	<div align="center">
	<form action="shop.do" method="post">
	<input type="hidden" name="command" value="shopsearch">
	<input type="hidden" name="category_no" value="${category_no }">
	<input type="text" class="form-inline" placeholder="검색" name="search">
	<input class="btn btn-default" type="submit" value="검색">
	</form>
	</div>
	<br>
	<div class="catetb">
	<c:set var="i" value="0" />
	<c:set var="j" value="4" />
	<c:set var="r" value="0" />
	<c:set var="r2" value="0" />
	<c:set var="img" value="img/SHOP.png" />
	<table class="table">
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td>---리뷰 없음---</td>
				</tr>
			</c:when>
			<c:otherwise>

				<c:forEach var="dto" items="${list }" >
				<c:if test="${i%j ==0 }">
				<tr>
				</c:if>
				<c:choose>
					<c:when test="${empty dto.upload_img}">
					<td>
						<img src="${img }" class="img-responsive" alt="Responsive image" onclick="location.href='shop.do?command=shopdetail&shopno=${dto.shopno }'">
						<a href="shop.do?command=shopdetail&shopno=${dto.shopno }">${dto.title }</a><br>
						<label>평점 ★:  </label>${Math.round((((dto.service)+(dto.clean)+(dto.traffic))/3)*100)/100.0 }<br>
						<label>조회수:${dto.hit } </label>
						<label>추천수:${dto.reco } </label>
						
						<div></div>
					</td>
					</c:when>
					<c:otherwise>
					<td>
						<img src="resources/uploadImage/${dto.upload_img }" class="img-responsive" alt="Responsive image" onclick="location.href='shop.do?command=shopdetail&shopno=${dto.shopno }'">
						<a href="shop.do?command=shopdetail&shopno=${dto.shopno }">${dto.title }</a><br>
						<label>평점 ★:  </label>${Math.round((((dto.service)+(dto.clean)+(dto.traffic))/3)*100)/100.0 }<br>
						<label>조회수:${dto.hit } </label>
						<label>추천수:${dto.reco } </label>
						
						<div></div>
					</td>
					</c:otherwise>
				</c:choose>
					
				<c:if test="${i%j == j-1 }">
				</tr>
				</c:if>
				<c:set var="i" value="${i+1 }"/>
			</c:forEach>
			</c:otherwise>
		
		
		</c:choose>
		
		
	</table>
	</div>
	
	<div class="side_table">
		<div class="side_title01">
			<h4 style="color:white; text-weight:bold;"> 영화 리뷰 추천수 상위 top5 </h4>
		</div>
			
		<div>
				<table id="reco_tb" border=1 >
					<thead>
						<tr >
							<th style="text-align:center;">No.</th>
							<th style="text-align:center;">제목</th>
							<th style="text-align:center;">추천수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list2 }">
								<tr>
									<td>---리뷰 없음---</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="dto2" items="${list2 }" end="4">
									<tr>
										<td>${r=r+1 }</td>
										<td><a href="shop.do?command=shopdetail&shopno=${dto2.shopno }">${dto2.title }</a></td>
										<td>${dto2.hit }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						
					</tbody>
					
				</table>
		</div>
		
		<br>
		<div class="side_title02">
			<h4 style="color:white; text-weight:bold;"> 영화 리뷰 조회수 상위 top5 </h4>
		</div>
		
		<div>
				<table id="view_tb" border=1 >
					<thead>
						<tr>
							<th style="text-align:center;">No.</th>
							<th style="text-align:center;">제목</th>
							<th style="text-align:center;">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty list3 }">
								<tr>
									<td>---리뷰 없음---</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="dto3" items="${list3 }" end="4">
									<tr>
										<td>${r2=r2+1 }</td>
										<td><a href="shop.do?command=shopdetail&shopno=${dto3.shopno }">${dto3.title }</a></td>
										<td>${dto3.hit }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
					
				</table>
		</div>
		
	</div>
	<br><br><br>
	
	
	
	<div align="center">
			<nav class="pull-bottom">
					<c:set var="pageNum" value="${paging.pageNum }"/>
					<c:set var="startPage" value="${paging.startPage}"/>
					<c:set var="endPage" value="${paging.endPage}"/>
					<c:set var="totalPage" value="${paging.totalPage}"/>
					<c:set var="itemCount" value="${paging.itemCount}"/>
					<ul class="pagination">
						<li>
				      		<a href="shop.do?command=shoplist&pageNum=1&category_no=${category_no }" aria-label="Previous">
				        	<span aria-hidden="true">&laquo;</span>
				      		</a>
				    	</li>
						<c:forEach var="item" varStatus="status" begin="${ startPage }" end="${ endPage }" step="1">
	                		<c:if test="${ pageNum == item }">
	                    		<li><a href="shop.do?command=shoplist&pageNum=1&category_no=${category_no }">${ item }</a></li>
	                		</c:if>
	                		<c:if test="${ pageNum != item }">
			 					<li><a href="shop.do?command=shoplist&pageNum=${ item }&category_no=${category_no }">${ item }</a></li>
	                		</c:if>
	            		</c:forEach>
	            		<li>
				      		<a href="shop.do?command=shoplist&pageNum=${totalPage}&category_no=${category_no }" aria-label="Next">
				        	<span aria-hidden="true">&raquo;</span>
				      		</a>
				    	</li>
					</ul>
					<input type="button" onclick="location.href='shop.do?command=shopwriteform'" value="리뷰 작성">
				</nav>
				
		<!-- <a href="shop.do?command=shopwriteform">글쓰기</a> -->
	</div>
	
	
	<footer ><%@ include file="Fix/footer.jsp" %></footer>
</body>
</html>