<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#adminpage_div{
		border: 1px black solid;
		height:600px;
		margin-left:100px;
		margin-top:50px;
	}
	
	#adminpage_div2{
		border: 1px black solid;
		height:600px;
		margin-left:100px;
		margin-top:50px;
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
	}
	
</style>
</head>
<body>
	<%@ include file="../Fix/header.jsp" %>
	<c:set var="adminCheck" value="${adminCheck}"/>
	<div class="container" style="text-align:center;">
		<c:choose>
			<c:when test="${adminCheck != null }">
		    	<h1>관리자 목록</h1>
		    </c:when>
		    <c:otherwise>
		    	<h1>회원 목록</h1>
		    </c:otherwise>
		</c:choose>
	</div>
	<div class="row">
		<!-- 좌측 nav -->
		<div class="container col-sm-2" id="adminpage_div">
			<div class="row flex-nowrap">
    			<div class="col-3 bd-sidebar text-center">
    			<br>
    			<h4>회원 관리</h4>
      				<ul class="nav">
				        <li class="side"><a href="adminController?command=userList">회원 목록</a></li>
				        <li class="side"><a href="adminController?command=userList&adminCheck=true">관리자 목록</a></li>
      				</ul>
      		
      			<h4>게시판 글 처리</h4>
      			     <ul class="nav">
				        <li class="side"><a href="adminController?command=waitList&status=0">승인 대기중인 글</a></li>
				        <li class="side"><a href="adminController?command=waitList&status=2">승인 거절된 글</a></li>
      				</ul>
      			
      			<h4>공지사항</h4>
      		      	<ul class="nav">
				        <li class="side"><a href="adminNotice.jsp">게시판 공지사항</a></li>
      				</ul>
    			
    			<h4>신고 관리</h4>
    			    <ul class="nav">
				        <li class="side"><a href="adminReportboard.jsp">신고 목록</a></li>
      				</ul>
      			</div>
    		</div>
		</div>
		<!-- 우측, 회원 리스트 게시판  -->
		<div class="container col-sm-6 text-center" id="adminpage_div2">
			  <!-- 유저 검색  -->
			  
		     <form class="navbar-form text-center" role="search" action="adminController" method="post">
		     	<input type="hidden" name="command" value="userList">
		     	<c:choose>
		     		<c:when test="${adminCheck != null }">
		     			<input type="hidden" name="adminCheck" value="true">
		     		</c:when>
		     	</c:choose>
        		<div class="form-group">
          			<input type="text" class="form-control" placeholder="User email" name="searchEmail">
        		</div>
        		<button type="submit" class="btn btn-default">검색</button>
      		</form>
      		
      		<!-- table 형태 게시판  -->
      		<table class="table text-center table-hover" id="adminpage_board">
				<thead>
					<tr>
						<th class="active text-center" style="width:200px">이메일</th>
						<th class="active text-center" style="width:400px">별명</th>
						<th class="active text-center" style="width:200px">가입일</th>
					</tr>
				</thead>
				<tbody>
				<!-- 기능 구현에서 바뀜  -->
					<c:choose>
						<c:when test="${empty userlist }">
							<tr>
								<td colspan="4">가입한 회원이 존재하지 않습니다</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="list" items="${userlist}">
								<tr>
									<td><a href="adminController?command=userdetail&email=${list.email}">${list.email }</a></td>
									<td>${list.nickName }</td>
									<td>${list.createdAt }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<hr>
			
			<nav class="pull-bottom">
			<c:set var="pageNum" value="${paging.pageNum }"/>
			<c:set var="startPage" value="${paging.startPage}"/>
			<c:set var="endPage" value="${paging.endPage}"/>
			<c:set var="totalPage" value="${paging.totalPage}"/>
			<c:set var="itemCount" value="${paging.itemCount}"/>
				<ul class="pagination">
					<li>
			      		<a href="adminController?command=userList&pageNum=1" aria-label="Previous">
			        	<span aria-hidden="true">&laquo;</span>
			      		</a>
			    	</li>
					<c:forEach var="item" varStatus="status" begin="${ startPage }" end="${ endPage }" step="1">
                		<c:if test="${ pageNum == item }">
                    		<li><a href="adminController?command=userList&pageNum=1">${ item }</a></li>
                		</c:if>
                		<c:if test="${ pageNum != item }">
		 					<li><a href="adminController?command=userList&pageNum=${ item }">${ item }</a></li>
                		</c:if>
            		</c:forEach>
            		<li>
			      		<a href="adminController?command=userList&pageNum=${totalPage}" aria-label="Next">
			        	<span aria-hidden="true">&raquo;</span>
			      		</a>
			    	</li>
				</ul>
			
			</nav>
		</div>
		</div>

	<%@ include file="../Fix/footer.jsp" %>
</body>
</html>