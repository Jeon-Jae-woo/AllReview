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
	
	#mypage_form{
		margin-left:50px;
		margin-top:30px;
	}
	
</style>
</head>
<body>
	<%@ include file="../Fix/header.jsp" %>
	
	<div class="container" style="text-align:center;">
		<h1>마이페이지</h1>
	</div>
	
	<div class="row">
		<!-- 좌측 nav   -->
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
	
		<!-- 우측, 유저 정보 form -->
		<div class="container col-sm-6" id="mypage_div2">
			<form class="form-horizontal" id="mypage_form" action="" method="post">
		  	<div class="form-group">
		    	<label for="email" class="col-sm-2 control-label">이메일</label>
		    	<div class="col-sm-5">
		      		<input type="email" class="form-control" id="email" aria-describedby="sizing-addon2" value="example@naver.com" readonly="readonly">
		    	</div>
		    	
		  	</div>
		  	<div class="form-group">
		    	<label for="password" class="col-sm-2 control-label">비밀번호</label>
		    	<div class="col-sm-5">
		      		<button class="btn btn-default" id="password">변경</button>
		    	</div>
		  	</div>
		  	<div class="form-group">
		    	<label for="name" class="col-sm-2 control-label">이름</label>
		    	<div class="col-sm-5">
		      		<input type="text" class="form-control" id="name" value="테스트" readonly="readonly">
		    	</div>
		  	</div>
		  	<div class="form-group">
		    	<label for="birth" class="col-sm-2 control-label">생년월일</label>
		    	<div class="row">
		    	<div class="col-sm-2">
		      		<input type="text" class="form-control" id="birth" value="1111" readonly="readonly">
		    	</div>
		    	<div class="col-sm-1">
		      		<input type="text" class="form-control" id="birth" value="11" readonly="readonly">
		    	</div>
		    	<div class="col-sm-1">
		      		<input type="text" class="form-control" id="birth" value="11" readonly="readonly">
		    	</div>
		    	</div>
		  	</div>
		  	<!-- 별명을 변경한 경우, 변경 확인을 통해 진행해야 함 -->
		  	<div class="form-group">
		    	<label for="nickname" class="col-sm-2 control-label">별명</label>
		    	<div class="col-sm-5">
		      		<input type="text" class="form-control" id="nickname" value="별명입니다" readonly="readonly">
		    	</div>
		    	<button class="btn btn-default">변경</button>
		  	</div>
		  	<div class="form-group">
		    	<label for="address" class="col-sm-2 control-label">주소</label>
		    	<div class="col-sm-5">
		      		<input type="text" class="form-control" id="address" value="경기도 용인시 수지구">
		    	</div>
		    </div>
		    <div class="form-group">
		    	<label for="address" class="col-sm-2 control-label"></label>
		    	<div class="col-sm-5">
		      		<input type="text" class="form-control" id="address_detail" value="어딘가">
		    	</div>
		    </div>
		  	<div class="form-group">
		    	<div class="col-sm-offset-2 col-sm-2">
		      		<button type="submit" class="btn btn-primary btn-block" onclick="">정보 수정</button>
		    	</div>
		  	</div>
		</form>
		</div>
	</div>
	
	<%@ include file="../Fix/footer.jsp" %>
</body>
</html>