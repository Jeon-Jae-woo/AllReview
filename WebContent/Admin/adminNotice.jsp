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
	
	<div class="container" style="text-align:center;">
		<h1>게시판 공지사항</h1>
	</div>
	<div class="row">
		<!-- 좌측 nav -->
		<div class="container col-sm-2" id="adminpage_div">
			<div class="row flex-nowrap">
    			<div class="col-3 bd-sidebar text-center">
    			<br>
    			<h4>회원 관리</h4>
      				<ul class="nav">
				        <li class="side"><a href="adminUserlist.jsp">회원 목록</a></li>
				        <li class="side"><a href="adminList.jsp">관리자 목록</a></li>
      				</ul>
      		
      			<h4>게시판 글 처리</h4>
      			     <ul class="nav">
				        <li class="side"><a href="adminWaitboard.jsp">승인 대기중인 글</a></li>
				        <li class="side"><a href="adminRefusalboard.jsp">승인 거절된 글</a></li>
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
	
		<div class="container col-sm-6 text-center" id="adminpage_div2">
			<!-- 카테고리를 선택하여 검색 가능  -->
			<form class="navbar-form text-center" role="search">
        		<div class="form-group">
          			<select class="form-control">
          				<option>전체</option>
    					<option>온라인 쇼핑</option>
    					<option>매장</option>
    					<option>영화</option>
    					<option>책</option>
  					</select>
        		</div>
        		<button type="submit" class="btn btn-default">검색</button>
      		</form>
      		<!-- 공지사항 리스트 게시판 -->
      		<table class="table text-center table-hover" id="adminpage_board">
				<thead>
					<tr>
						<th class="active text-center" style="width:200px">카테고리</th>
						<th class="active text-center" style="width:400px">제목</th>
						<th class="active text-center" style="width:200px">작성일</th>
					</tr>
				</thead>
				<tbody>
				<!-- 기능 구현시에 수정 -->
					<tr>
						<td>온라인 쇼핑</td>
						<td><a>공지사항1</a></td>
						<td>2021-5-12</td>
					</tr>
					<tr>
						<td>온라인 쇼핑</td>
						<td><a>공지사항1</a></td>
						<td>2021-5-12</td>
					</tr>
					<tr>
						<td>온라인 쇼핑</td>
						<td><a>공지사항1</a></td>
						<td>2021-5-12</td>
					</tr>
				</tbody>
			</table>
			<hr>
			<div class="container" style="width:600px; margin-left:300px;">
			<div class="row">
				<div class="col-md-6">
					<!-- pagination 처리 필요  -->
					<nav>
			  		<ul class="pagination">
			    	<li>
			      		<a href="#" aria-label="Previous">
			        		<span aria-hidden="true">&laquo;</span>
			      		</a>
			    	</li>
				    <li><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
			    	<li>
			      		<a href="#" aria-label="Next">
			      	  	<span aria-hidden="true">&raquo;</span>
			      		</a>
			    	</li>
			  		</ul>
					</nav>
				</div>
				<!-- 글쓰기 버튼, 글쓰기 페이지로 넘어감  -->
				<div class="col-md-3" style="margin-top:19px; margin-left:20px;">
					<button type="button" class="btn btn-default" onclick="location.href='adminNoticeWrite.jsp'">글쓰기</button>
				</div>
			</div>
			</div>
		</div>
		</div>

	<%@ include file="../Fix/footer.jsp" %>
</body>
</html>