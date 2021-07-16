<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

#login_div{
	position: relative;
	top:80px;
	width:500px;
	height:400px;
	padding: 30px, 20px;
	text-align:center;
	border-radius: 15px;
	border: 2px black solid;
	margin-top:100px;
	color: black;
	text-shadow: 1px 1px 1px gray;
	background-color: white;
	background-color: rgba( 255, 255, 255, 0.8 );	
}

#login_form{
	position: relative;
	top: 40px;
	margin-top:70px;
	margin-left:10px;
}
	
body{
	background-image: url("./resources/Image/forest1.jpg");
	background-repeat: no-repeat;
	background-position: left top;
	background-size: cover;
}
#loginbutton{
	position: relative;
	top: 40px;
}
#logintitle{
	position: relative;
	top: 30px;

}
</style>

</head>
<body>
	<%@ include file="../Fix/header.jsp" %>
	
	<!-- 로그인  , 현재 세션은 없음-->
	<div class="container px-4 px-lg-5 mt-5" id="login_div">
		<div class="col-md-12 text-center" id="logintitle" style="margin-bottom:20px;">
				<h2>비밀번호 찾기</h2>
				<p>찾으시고자 하는 이메일과 등록한 닉네임을 입력해주세요</p>
		</div>
		<!-- 추가 작업 필요  -->
		<form class="form-horizontal" id="login_form" action="userController" method="post">
			<input type="hidden" name="command" value="passwordFind">
		  	<div class="form-group">
		    	<label for="email" class="col-sm-2 control-label">Email</label>
		    	<div class="col-sm-8">
		      		<input type="email" class="form-control" id="email" name="email" placeholder="이메일" aria-describedby="sizing-addon2">
		    	</div>
		  	</div>
		  	<div class="form-group">
		    	<label for="password" class="col-sm-2 control-label">닉네임</label>
		    	<div class="col-sm-8">
		      		<input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임">
		    	</div>
		  	</div>
		  	<div class="form-group" id="loginbutton">
		    	<div class="col-sm-offset-2 col-sm-8">
		    		<input type="submit" class="btn btn-primary btn-lg btn-block" value="이메일 보내기">
		    	</div>
		  	</div>
		</form>
	</div>
	
	<br><br><br><br><br><br><br><br><br><br>
	<%@ include file="../Fix/footer.jsp" %>
</body>
</html>