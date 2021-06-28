<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#userdetail_div{
		border: 1px black solid;
		height:600px;
		margin-left:100px;
		margin-top:50px;
	}
	
	#userdetail_div2{
		border: 1px black solid;
		height:900px;
		margin-left:100px;
		margin-top:50px;
	}
	
	.side{
		margin-top:10px;
		margin-bottom:10px;
	}
	
	
	div[title="userdetail_div2"]{
		border: 1px black solid;
		height:300px;
	}
	
</style>
</head>
<body>
	<%@ include file="../Fix/header.jsp" %>
	
	<div class="container" style="text-align:center;">
		<h1>회원 조회</h1>
	</div>
	<div class="row">
		<!-- 좌측 nav  -->
		<div class="container col-sm-2" id="userdetail_div">
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
		<!-- 우측, 회원정보와 작성 글 목록  -->
		<div class="container col-sm-6" id="userdetail_div2">
			<div class="row">
				<!-- 회원 정보 -->
				<div class="container col-sm-12" title="userdetail_div2">
					<h4>회원 정보</h4>
					<!-- 추가 작업 필요함  -->
					<form class="form-horizontal" action="" method="post">
					<div class="row">
						<div class="container col-sm-12" style="height:100px;">
		  						<div class="form-group" style="margin-top:25px;">
		    						<label for="email" class="col-sm-2 control-label">이메일</label>
		    							<div class="col-sm-3">
		      								<input type="email" class="form-control" id="email" aria-describedby="sizing-addon2" value="example@naver.com" readonly="readonly">
		    							</div>
							  		<label for="createdAt" class="col-sm-2 control-label">가입일</label>
							  			<div class="col-sm-3">
		      								<input type="text" class="form-control" id="createdAt" aria-describedby="sizing-addon2" value="2021/5/5" readonly="readonly">
		    							</div>
							  	</div>
						</div>
						<div class="container col-sm-12" style="height:100px;">
							<div class="form-group" style="margin-top:20px;">
		    					<label for="nickname" class="col-sm-2 control-label">별명</label>
		    						<div class="col-sm-3">
		      							<input type="email" class="form-control" id="nickname" aria-describedby="sizing-addon2" value="별명1" readonly="readonly">
		    						</div>
							  	<label for="" class="col-sm-2 control-label">상태</label>
							  		<div class="col-sm-3">
		      					  		<select class="form-control">
    										<option>활동</option>
    										<option>정지</option>
  										</select>
		    						</div>
							 </div>
						</div>
						<div class="container col-sm-12" style="height:60px;">
							<div class="form-group" style="margin-top:10px;">
								<label for="" class="col-sm-2 control-label">직위</label>
							  		<div class="col-sm-3">
		      					  		<select class="form-control">
    										<option>회원</option>
    										<option>부관리자</option>
  										</select>
		    						</div>
							<button type="submit" class="btn btn-primary" style="margin-left:200px;">변경</button>
		    				</div>
						</div>
					</div>
					</form>
				</div>
			</div>
			<!-- 작성 글 목록  -->
			<div class="row">
				<div class="container col-sm-12" title="userdetail_div2" style="height:600px">
					<h4>작성 글 목록</h4>
					
					<table class="table text-center table-hover" id="" style="margin-top:20px;">
						<thead>
							<tr>
								<th class="active text-center" style="width:200px">카테고리</th>
								<th class="active text-center" style="width:400px">제목</th>
								<th class="active text-center" style="width:200px">작성일</th>
							</tr>
						</thead>
						<tbody>
						<!-- 기능 구현시에 변경됨  -->
							<tr>
								<td>온라인 쇼핑</td>
								<td><a>무언가를샀습니다</a></td>
								<td>2021-5-12</td>
							</tr>
							<tr>
								<td>온라인 쇼핑</td>
								<td><a>무언가를샀습니다</a></td>
								<td>2021-5-12</td>
							</tr>
							<tr>
								<td>온라인 쇼핑</td>
								<td><a>무언가를샀습니다</a></td>
								<td>2021-5-12</td>
							</tr>
							<tr>
								<td>온라인 쇼핑</td>
								<td><a>무언가를샀습니다</a></td>
								<td>2021-5-12</td>
							</tr>
							<tr>
								<td>온라인 쇼핑</td>
								<td><a>무언가를샀습니다</a></td>
								<td>2021-5-12</td>
							</tr>
							<tr>
								<td>온라인 쇼핑</td>
								<td><a>무언가를샀습니다</a></td>
								<td>2021-5-12</td>
							</tr>
							<tr>
								<td>온라인 쇼핑</td>
								<td><a>무언가를샀습니다</a></td>
								<td>2021-5-12</td>
							</tr>
							<tr>
								<td>온라인 쇼핑</td>
								<td><a>무언가를샀습니다</a></td>
								<td>2021-5-12</td>
							</tr>
						</tbody>
					</table>
					<hr>
					<!-- pagination 처리 필요함 -->
					<nav class="pull-bottom text-center">
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
			</div>			
		</div>

	</div>
	
	<%@ include file="../Fix/footer.jsp" %>
</body>
</html>