<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#adminpage_div{
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

#adminpage_div2{
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

.side{
	margin-top:10px;
	margin-bottom:10px;
}

#adminpage_board{
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
h4{
	position: relative;
	top: 40px;
}
#sidenav{
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
#adminpage_div2_sub{
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

	<c:set var="newStatus" value="${status}"/>
	<div class="container" style="text-align:center; color:white;">
	<c:choose>
		<c:when test="${newStatus eq '0'}">
			<h1>?????? ???????????? ???</h1>		
		</c:when>
		<c:otherwise>
			<h1>?????? ????????? ???</h1>
		</c:otherwise>
	</c:choose>
	
	</div>
	<!-- ?????? nav -->
	<div class="row">
		<div class="container col-sm-2" id="adminpage_div">
			<div class="row flex-nowrap">
    			<div class="col-3 bd-sidebar text-center">
    			<br>
    			<h4>?????? ??????</h4>
      				<ul class="nav" id="sidenav">
				        <li class="side"><a href="adminController?command=userList">?????? ??????</a></li>
				        <li class="side"><a href="adminController?command=userList&adminCheck=true">????????? ??????</a></li>
      				</ul>
      		
      			<h4>????????? ??? ??????</h4>
      			     <ul class="nav" id="sidenav">
				        <li class="side"><a href="adminController?command=waitList&status=0">?????? ???????????? ???</a></li>
				        <li class="side"><a href="adminController?command=waitList&status=2">?????? ????????? ???</a></li>
      				</ul>

      			</div>
    		</div>
		</div>
	
		<div class="container col-sm-6 text-center" id="adminpage_div2">
			<!-- ???????????? ??? ??????  -->
			<form class="navbar-form text-center" id="adminpage_div2_sub" role="search" action="adminController" method="post">
				<input type="hidden" name="command" value="waitList">
				<input type="hidden" name="status" value="${status}">
        		<div class="form-group">
          			<select class="form-control" name="category" id="category">
    					<option value="??????">??????</option>
    					<option value="?????????">????????? ??????</option>
    					<option value="??????">??????</option>
    					<option value="???">???</option>
  					</select>
        		</div>
        		<button type="submit" class="btn btn-default">??????</button>
      		</form>
      		<!-- ????????? ??? ?????????  -->
      		<table class="table text-center table-hover" id="adminpage_board">
				<thead>
					<tr>
						<th class="active text-center" style="width:200px">????????????</th>
						<th class="active text-center" style="width:400px">??????</th>
						<th class="active text-center" style="width:200px">?????????</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="category_name" value="${category}"/>
					<c:choose>
						<c:when test="${empty totalList }">
							<tr>
								<td colspan="4">????????? ?????? ???????????? ????????????</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${category_name eq '??????' }">
									<c:forEach var="list" items="${totalList}">
										<tr>
											<td>${list.categoryName }</td>
											<td><a href="shop.do?command=shopdetail&shopno=${list.boardNo}">${list.title }</a></td>
											<td>${list.createAt }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:when test="${category_name eq '?????????' }">
									<c:forEach var="list" items="${totalList}">
										<tr>
											<td>${list.categoryName }</td>
											<td><a href="onlineController?command=detail&board_id=${list.boardNo}">${list.title }</a></td>
											<td>${list.createAt }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:when test="${category_name eq '??????' }">
									<c:forEach var="list" items="${totalList}">
										<tr>
											<td>${list.categoryName }</td>
											<td><a href="movieController?command=reviewDetail&review_id=${list.boardNo}">${list.title }</a></td>
											<td>${list.createAt }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:when test="${category_name eq '???' }">
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
			<!-- pagination ?????? ??????  -->
			<nav class="pull-bottom">
			<c:set var="pageNum" value="${paging.pageNum }"/>
			<c:set var="startPage" value="${paging.startPage}"/>
			<c:set var="endPage" value="${paging.endPage}"/>
			<c:set var="totalPage" value="${paging.totalPage}"/>
			<c:set var="itemCount" value="${paging.itemCount}"/>
			
				<ul class="pagination">
					<li>
			      		<a href="adminController?command=waitList&pageNum=1&category=${category}&status=${newStatus}" aria-label="Previous">
			        	<span aria-hidden="true">&laquo;</span>
			      		</a>
			    	</li>
					<c:forEach var="item" varStatus="status" begin="${ startPage }" end="${ endPage }" step="1">
                		<c:if test="${ pageNum == item }">
                    		<li><a href="adminController?command=waitList&pageNum=1&category=${category}&status=${newStatus}">${ item }</a></li>
                		</c:if>
                		<c:if test="${ pageNum != item }">
		 					<li><a href="adminController?command=waitList&pageNum=${ item }&category=${category}&status=${newStatus}">${ item }</a></li>
                		</c:if>
            		</c:forEach>
            		<li>
			      		<a href="adminController?command=waitList&pageNum=${totalPage}&category=${category}&status=${newStatus}" aria-label="Next">
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