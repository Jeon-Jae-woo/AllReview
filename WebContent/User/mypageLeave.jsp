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
	
	#leave_div{
		width:400px;
		height:300px;
		border:1px black solid;
		margin: 0 auto;
		margin-top: 140px;
	}
	
	
	div[title="leave_div"]{
		margin-top:20px;
	}
	
</style>
</head>
<body>
	<%@ include file="../Fix/header.jsp" %>
	
	<div class="container" style="text-align:center;">
		<h1>회원 탈퇴</h1>
	</div>
	<div class="row">
		<!-- 좌측 nav -->
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
		<!-- 우측, 회원 탈퇴  -->
		<div class="container col-sm-6 text-center" id="mypage_div2">
			<div class="container row" id="leave_div">
				<h3>비밀번호</h3>
				<!-- 추가 기능 구현 필요 -->
				<form action="" method="post">
				<div class="col-sm-offset-2 col-sm-8" title="leave_div">
		      		<input type="password" class="form-control" id="password" placeholder="비밀번호">
		    	</div>
		    	
		    	<div class="col-sm-offset-2 col-sm-8" title="leave_div">
		      		<button type="submit" class="btn btn-primary btn-lg btn-block">회원 탈퇴</button>
		    	</div>
		  		</form>
			</div>
		</div>
	</div>
	
	<%@ include file="../Fix/footer.jsp" %>
</body>
</html>