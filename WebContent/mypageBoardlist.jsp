<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#mypage_div{
	border: 1px black solid;
	height:600px;
	margin-left:100px;
	margin-top:50px;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );
	border-radius: 10px 10px 10px 10px;
	font-weight: bold;
	text-align:center;
	position: relative;
	top: 50px;
}

#mypage_div2{
	border: 1px black solid;
	height:600px;
	margin-left:100px;
	margin-top:50px;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );
	border-radius: 10px 10px 10px 10px;
	color: black;
	font-weight: bold;
	position: relative;
	top: 50px;
}

.side{
	margin-top:10px;
	margin-bottom:10px;
}

#mypage_board{
	width:800px;
	margin-top:20px;
	margin-left:auto;
	margin-bottom:20px;
	margin-right:auto;
	position: relative;
	top: 40px;
}

body{
	background-image: url("./resources/Image/forest1.jpg");
	background-repeat: no-repeat;
	background-position: left top;
	background-size: cover;
}

h1{
	position: relative;
	top: 50px;
	left: 6%;
	text-shadow: 1px 1px 1px gray;
}
#sidenav{
	position: relative;
	top: 40px;
}
#mypage_div2_sub{
	position: relative;
	top: 40px;

}
.pull-bottom{
	position: relative;
	top: 40px;
}
#pull-bottom_line{
	position: relative;
	top: 40px;

}
	
	
</style>
<script type="text/javascript">
	window.onload = function(){
		var selectedData = '<c:out value="${category}"/>';
		console.log(selectedData);
		var selectBox = document.getElementById("category");
		for(var i=0; i<selectBox.length;i++){
			if(selectBox[i].value==selectedData){
				selectBox[i].selected=true;
			}
		}
	}
</script>

</head>
<body>

	<%@ include file="../Fix/header.jsp" %>
	
	<div class="container" style="text-align:center; color:white;">
		<h1>내가 쓴 게시글</h1>
	</div>
	
	<div class="row">
		<!-- 좌측 nav  -->
		<div class="container col-sm-2" id="mypage_div">
			<div class="row flex-nowrap">
    			<div class="col-3 bd-sidebar">
      				<ul class="nav" id="sidenav">
				        <li class="side"><a href="userController?command=mypageInfo">회원 정보</a></li>
				        <li class="side"><a href="userController?command=writelist">내가 쓴 게시글</a></li>
				        <li class="side"><a href="mypageLeave.jsp">회원 탈퇴</a></li>
      				</ul>
      			<br>
    			</div>
    		</div>
		</div>
		<!-- 우측 게시판 형태  -->
		<div class="container col-sm-6 text-center" id="mypage_div2">
		<form class="form-horizontal" action="userController" method="post">
			<input type="hidden" name="command" value="writelist">
			<div class="container" id="mypage_div2_sub" style="margin-top:10px">
				<div class="col-sm-2">
		      		<select class="form-control" name="category" id="category">
    					<option value="매장">매장</option>
    					<option value="온라인">온라인 쇼핑</option>
    					<option value="영화">영화</option>
    					<option value="책">책</option>
  					</select>
		    	</div>
		    <input type="submit" class="btn btn-primary" value="검색">	
		    </div>
		    </form>
			<table class="table text-center table-hover" id="mypage_board">
				<thead>
					<tr>
						<th class="active text-center" style="width:200px">카테고리</th>
						<th class="active text-center" style="width:400px">제목</th>
						<th class="active text-center" style="width:200px">작성일</th>
					</tr>
				</thead>
				<tbody>
				<!-- 기능 구현 때 바뀜  -->
					<c:set var="category_name" value="${category}"/>
					<c:choose>
						<c:when test="${empty totalList }">
							<tr>
								<td colspan="4">작성된 글이 존재하지 않습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${category_name eq '매장' }">
									<c:forEach var="list" items="${totalList}">
										<tr>
											<td>${list.categoryName }</td>
											<td><a href="shop.do?command=shopdetail&shopno=${list.boardNo}">${list.title }</a></td>
											<td>${list.createAt }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:when test="${category_name eq '온라인' }">
									<c:forEach var="list" items="${totalList}">
										<tr>
											<td>${list.categoryName }</td>
											<td><a href="onlineController?command=detail&board_id=${list.boardNo}">${list.title }</a></td>
											<td>${list.createAt }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:when test="${category_name eq '영화' }">
									<c:forEach var="list" items="${totalList}">
										<tr>
											<td>${list.categoryName }</td>
											<td><a href="movieController?command=reviewDetail&review_id=${list.boardNo}">${list.title }</a></td>
											<td>${list.createAt }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:when test="${category_name eq '책' }">
									<c:forEach var="list" items="${totalList}">
										<tr>
											<td>${list.categoryName }</td>
											<td><a href="bookController?command=reviewDetail&review_id=${list.boardNo}">${list.title }</a></td>
											<td>${list.createAt }</td>
										</tr>
									</c:forEach>
								</c:when>
								
							
							</c:choose>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>

			<hr id="pull-bottom_line">
			<nav class="pull-bottom">
			<c:set var="pageNum" value="${paging.pageNum }"/>
			<c:set var="startPage" value="${paging.startPage}"/>
			<c:set var="endPage" value="${paging.endPage}"/>
			<c:set var="totalPage" value="${paging.totalPage}"/>
			<c:set var="itemCount" value="${paging.itemCount}"/>
				<ul class="pagination">
					<li>
			      		<a href="userController?command=writelist&pageNum=1&category=${category}" aria-label="Previous">
			        	<span aria-hidden="true">&laquo;</span>
			      		</a>
			    	</li>
					<c:forEach var="item" varStatus="status" begin="${ startPage }" end="${ endPage }" step="1">
                		<c:if test="${ pageNum == item }">
                    		<li><a href="userController?command=writelist&pageNum=1&category=${category}">${ item }</a></li>
                		</c:if>
                		<c:if test="${ pageNum != item }">
		 					<li><a href="userController?command=writelist&pageNum=${ item }&category=${category}">${ item }</a></li>
                		</c:if>
            		</c:forEach>
            		<li>
			      		<a href="userController?command=writelist&pageNum=${totalPage}&category=${category}" aria-label="Next">
			        	<span aria-hidden="true">&raquo;</span>
			      		</a>
			    	</li>
				</ul>
			
			</nav>
			
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br><br>
	<%@ include file="../Fix/footer.jsp" %>
</body>
</html>
