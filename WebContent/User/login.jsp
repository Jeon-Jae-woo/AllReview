<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#login_div{
  		  width:500px;
		  height:400px;
		  padding: 30px, 20px;
		  text-align:center;
		  border-radius: 15px;
		  border: 2px black solid;
		  margin-top:100px;
	}
	#login_form{
		margin-top:70px;
		margin-left:10px;
	}
</style>
</head>
<body>
	<%@ include file="../Fix/header.jsp" %>
	
	<!-- 로그인  , 현재 세션은 없음-->
	<div class="container px-4 px-lg-5 mt-5" id="login_div">
		<div class="col-md-12 text-center" style="margin-bottom:20px;">
				<h1>Login</h1>
		</div>
		<!-- 추가 작업 필요  -->
		<form class="form-horizontal" id="login_form" action="" method="post">
		  	<div class="form-group">
		    	<label for="email" class="col-sm-2 control-label">Email</label>
		    	<div class="col-sm-8">
		      		<input type="email" class="form-control" id="email" placeholder="이메일" aria-describedby="sizing-addon2">
		    	</div>
		  	</div>
		  	<div class="form-group">
		    	<label for="password" class="col-sm-2 control-label">Password</label>
		    	<div class="col-sm-8">
		      		<input type="password" class="form-control" id="password" placeholder="비밀번호">
		    	</div>
		  	</div>
		  	<div class="form-group">
		    	<div class="col-sm-offset-2 col-sm-8">
		      		<button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
		    	</div>
		  	</div>
		</form>
		
	</div>
	<%@ include file="../Fix/footer.jsp" %>
</body>
</html>