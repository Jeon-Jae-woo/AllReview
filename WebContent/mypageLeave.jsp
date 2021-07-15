<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

h1{
	position: relative;
	top: 50px;
	left: 6%;
	text-shadow: 1px 1px 1px gray;
}
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
	text-shadow: 1px 1px 1px gray;
}

.side{
	margin-top:10px;
	margin-bottom:10px;
}

#leave_div{
	width:400px;
	height:300px;
	border:1px black solid;
	margin: 0 auto;
	margin-top: 140px;
	
}
#leave_div_sub{
	position: relative;
	top: 40px;
}

div[title="leave_div"]{
	margin-top:20px;
}
body{
	background-image: url("./resources/Image/forest1.jpg");
	background-repeat: no-repeat;
	background-position: left top;
	background-size: cover;
}
#sidenav{
	position: relative;
	top: 40px;
}

</style>
</head>
<body>
<%
	
%>

	<%@ include file="../Fix/header.jsp" %>
	
	<div class="container" style="text-align:center; color:white;">
		<h1>회원 탈퇴</h1>
	</div>
	<div class="row">
		<!-- 좌측 nav -->
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
		<!-- 우측, 회원 탈퇴  -->
		<div class="container col-sm-6 text-center" id="mypage_div2">
			<div class="container row" id="leave_div">
				<div id="leave_div_sub">
				<h3>비밀번호</h3>
				<form action="userController" method="post">
					<input type="hidden" name="command" value="userleave">
					<div class="col-sm-offset-2 col-sm-8" title="leave_div">
		      			<input type="password" name="password" class="form-control" id="password" placeholder="비밀번호">
		    		</div>
		    	
		    		<div class="col-sm-offset-2 col-sm-8" title="leave_div">
		      			<button type="submit" class="btn btn-primary btn-lg btn-block">회원 탈퇴</button>
		    		</div>
		  		</form>
		  		</div>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br><br>
	<%@ include file="../Fix/footer.jsp" %>
</body>
</html>