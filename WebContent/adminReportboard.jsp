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
	font-weight: bold;
	text-align:center;
	position: relative;
	top: 50px;
	
}

.side{
	margin-top:10px;
	margin-bottom:10px;
}

#mypage_form{
	margin-left:50px;
	margin-top:30px;
}
#mypage_board{
	width:800px;
	margin-top:20px;
	margin-left:auto;
	margin-bottom:20px;
	margin-right:auto;
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
#mypage_div2_sub{
	position: relative;
	top: 10px;
}

</style>
</head>
<body>
	<%@ include file="../Fix/header.jsp" %>
	
	<div class="container" style="text-align:center; color: white;">
		<h1>신고 목록</h1>
	</div>
	<div class="row">
		<div class="container col-sm-2" id="mypage_div">
			<div class="row flex-nowrap">
    			<div class="col-3 bd-sidebar text-center">
    			<br>
    			<h4>회원 관리</h4>
      				<ul class="nav" id="sidenav">
				        <li class="side"><a href="adminController?command=userList">회원 목록</a></li>
				        <li class="side"><a href="adminController?command=userList&adminCheck=true">관리자 목록</a></li>
      				</ul>
      		
      			<h4>게시판 글 처리</h4>
      			     <ul class="nav" id="sidenav">
				        <li class="side"><a href="adminController?command=waitList&status=0">승인 대기중인 글</a></li>
				        <li class="side"><a href="adminController?command=waitList&status=2">승인 거절된 글</a></li>
      				</ul>
      			
      			<h4>공지사항</h4>
      		      	<ul class="nav" id="sidenav">
				        <li class="side"><a href="adminNotice.jsp">게시판 공지사항</a></li>
      				</ul>
    			
    			<h4>신고 관리</h4>
    			    <ul class="nav" id="sidenav">
				        <li class="side"><a href="adminReportboard.jsp">신고 목록</a></li>
      				</ul>
      			</div>
    		</div>
		</div>
	
		<div class="container col-sm-6 text-center" id="mypage_div2">
		      <form class="navbar-form text-center" id="mypage_div2_sub" role="search">
        		<div class="form-group">
          			<input type="text" class="form-control" placeholder="User email">
        		</div>
        		<button type="submit" class="btn btn-default">검색</button>
      		</form>
      					<table class="table text-center table-hover" id="mypage_board">
				<thead>
					<tr>
						<th class="active text-center" style="width:200px">신고한 유저</th>
						<th class="active text-center" style="width:200px">신고유저</th>
						<th class="active text-center" style="width:400px">게시글</th>
						<th class="active text-center" style="width:200px">신고사유</th>
						<th class="active text-center" style="width:200px">신고날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>jaewoo@google.com</td>
						<td><a href="adminUserdetail.jsp">asd@asdasdasdasdasd</a></td>
						<td>글글입니다글글입니다</td>
						<td>광고 </td>
						<td>2021-5-12</td>
					</tr>
										<tr>
						<td>jaewoo@google.com</td>
						<td><a href="adminUserdetail.jsp">asd@asdasdasdasdasd</a></td>
						<td>글글입니다글글입니다</td>
						<td>광고 </td>
						<td>2021-5-12</td>
					</tr>
										<tr>
						<td>jaewoo@google.com</td>
						<td><a href="adminUserdetail.jsp">asd@asdasdasdasdasd</a></td>
						<td>글글입니다글글입니다</td>
						<td>광고 </td>
						<td>2021-5-12</td>
					</tr>
										<tr>
						<td>jaewoo@google.com</td>
						<td><a href="adminUserdetail.jsp">asd@asdasdasdasdasd</a></td>
						<td>글글입니다글글입니다</td>
						<td>광고 </td>
						<td>2021-5-12</td>
					</tr>
				
					
				</tbody>
			</table>
			<hr>
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

	<br><br><br><br><br><br><br><br><br>
	<%@ include file="../Fix/footer.jsp" %>
</body>
</html>