<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#mypage_div{
		border: 1px black solid;
		height:600px;
		margin-left:100px;
		margin-top:50px;
	}
	
	#mypage_div2{
		border: 1px black solid;
		height:600px;
		margin-left:100px;
		margin-top:50px;
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
	}
	
	
</style>
</head>
<body>
	<%@ include file="../Fix/header.jsp" %>
	
	<div class="container" style="text-align:center;">
		<h1>내가 쓴 게시글</h1>
	</div>
	
	<div class="row">
		<!-- 좌측 nav  -->
		<div class="container col-sm-2" id="mypage_div">
			<div class="row flex-nowrap">
    			<div class="col-3 bd-sidebar">
      				<ul class="nav">
				        <li class="side"><a href="mypageInfo.jsp">회원 정보</a></li>
				        <li class="side"><a href="mypageBoardlist.jsp">내가 쓴 게시글</a></li>
				        <li class="side"><a href="mypageLeave.jsp">회원 탈퇴</a></li>
      				</ul>
      			<br>
    			</div>
    		</div>
		</div>
		<!-- 우측 게시판 형태  -->
		<div class="container col-sm-6 text-center" id="mypage_div2">
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
			<!-- 기능 구현때 바뀜, pagination 필요  -->
			<nav class="pull-bottom">
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
	
	<%@ include file="../Fix/footer.jsp" %>
</body>
</html>
