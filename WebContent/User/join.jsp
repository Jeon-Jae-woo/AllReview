<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style type="text/css">
	#join_div{
  		  width:600px;
		  height:550px;
		  padding: 30px, 20px;
		  text-align:center;
		  border-radius: 15px;
		  border: 2px black solid;
		  margin-top:100px;
	}
	#join_form{
		margin-top:70px;
		margin-left:10px;
		margin-right:10px;
	}
</style>

<!-- 구현안됨 -->
<script type="text/javascript">
	function emailChk(){
		var checked = document.getElementById("inputEmail").title;
		if(checked == "false"){
			alert("이메일 중복체크를 하지 않았습니다");
			return false;
		}
	}

</script>


</head>
<body>
	<%@ include file="../Fix/header.jsp" %>
	<section class="py-5">
		
	<!-- 회원가입  -->
	<!-- 이메일 인증 추가해야함  -->
	<div class="container px-4 px-lg-5 mt-5" id="join_div">
		<div class="col-md-12 text-center" style="margin-bottom:20px;">
			<h1>Join</h1>
		</div>
		<!-- 기능 구현 해야함 -->
		<form class="form-horizontal" id="join_form" action="" method="post">
		  	<div class="form-group">
		    	<label for="email" class="col-sm-2 control-label">이메일*</label>
		    	<div class="col-sm-8">
		      		<input type="email" class="form-control" id="email" placeholder="이메일" aria-describedby="sizing-addon2" title="true">
		    	</div>
		    	<button class="btn btn-default" onclick="">중복체크</button>
		  	</div>
		  	<div class="form-group">
		    	<label for="password" class="col-sm-2 control-label">비밀번호*</label>
		    	<div class="col-sm-8">
		      		<input type="password" class="form-control" id="password" placeholder="비밀번호">
		    	</div>
		  	</div>
		  	<div class="form-group">
		    	<label for="name" class="col-sm-2 control-label">이름*</label>
		    	<div class="col-sm-8">
		      		<input type="text" class="form-control" id="name" placeholder="이름">
		    	</div>
		  	</div>
		  	<div class="form-group">
		  		<!-- 년, 월, 일 세부적으로 나눠서 받아야함 -->
		    	<label for="birth" class="col-sm-2 control-label">생년월일*</label>
		    	<div class="row">
		    	<div class="col-sm-2">
		      		<input type="text" class="form-control" id="birth1" placeholder="년(4자)">
		    	</div>
		    	<div class="col-sm-2">
		      		<input type="text" class="form-control" id="birth2" placeholder="월">
		    	</div>
		    	<div class="col-sm-2">
		      		<input type="text" class="form-control" id="birth3" placeholder="일">
		    	</div>
		    	</div>
		  	</div>
		  	<div class="form-group">
		    	<label for="nickname" class="col-sm-2 control-label">별명*</label>
		    	<div class="col-sm-8">
		      		<input type="text" class="form-control" id="nickname" placeholder="별명">
		    	</div>
		    	<button class="btn btn-default">중복체크</button>
		  	</div>
		  	<div class="form-group">
		    	<label for="address" class="col-sm-2 control-label">주소*</label>
		    	<div class="col-sm-8">
		      		<input type="text" class="form-control" id="address" placeholder="경기도 용인시">
		    	</div>
		    </div>
		    <div class="form-group">
		    	<label for="address2" class="col-sm-2 control-label"></label>
		    	<div class="col-sm-8">
		      		<input type="text" class="form-control" id="address2" placeholder="상세주소">
		    	</div>
		    </div>
		  	<div class="form-group">
		    	<div class="col-sm-offset-2 col-sm-8">
		      		<button type="submit" class="btn btn-primary btn-lg btn-block" onclick="">회원가입</button>
		    	</div>
		  	</div>
		</form>
	</div>
	</section>

<%@ include file="../Fix/footer.jsp" %>

</body>
</html>