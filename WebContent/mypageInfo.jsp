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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

//주소 API (다음)
function addressForm() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수 

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            document.getElementById("address1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address2").focus();
        }
    }).open();
}

</script>
<script type="text/javascript">
function updateCheck(){
	console.log(password);
	var form = document.mypage_form;
	//비밀번호 체크
	var password = form.new_password.value;
	
	//8자리 이상, 숫자 포함, 영대 문자 포함, 영소 문자 포함, 특수문자 포함
	var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	if(password != ""){
		if(reg.test(password) == false){
			alert("비밀번호는 8자리 이상, 숫자/대문자/특수 문자를 포함해야 합니다");
			form.password.focus();
			return false;
		}
	}
	form.submit();
	
}
</script>
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
				        <li class="side"><a href="userController?command=mypageInfo">회원 정보</a></li>
				        <li class="side"><a href="userController?command=writelist">내가 쓴 게시글</a></li>
				        <li class="side"><a href="mypageLeave.jsp">회원 탈퇴</a></li>
      				</ul>
      			<br>
    			</div>
    		</div>
		</div>
	
		<!-- 우측, 유저 정보 form -->
		<div class="container col-sm-6" id="mypage_div2">
			<form class="form-horizontal" id="mypage_form" name="mypage_form" action="userController" method="post">
				<input type="hidden" name="command" value="info_update">
		  	<div class="form-group">
		    	<label for="email" class="col-sm-2 control-label">이메일</label>
		    	<div class="col-sm-5">
		      		<input type="email" class="form-control" id="email" aria-describedby="sizing-addon2" value="${userdetail.email }" readonly="readonly">
		    	</div>
		    	
		  	</div>
		  	<div class="form-group">
		    	<label for="password" class="col-sm-2 control-label">기존 비밀번호</label>
		    	<div class="col-sm-5">
		      		<input type="password" class="form-control" id="password" name="password" aria-describedby="sizing-addon2" value="" >
		    	</div>
		  	</div>
		  	<div class="form-group">
		    	<label for="email" class="col-sm-2 control-label">신규 비밀번호</label>
		    	<div class="col-sm-5">
		      		<input type="password" class="form-control" id="new_password" name="new_password" aria-describedby="sizing-addon2" value="" >
		    	</div>
		    </div>
		  	<div class="form-group">
		    	<label for="name" class="col-sm-2 control-label">이름</label>
		    	<div class="col-sm-5">
		      		<input type="text" class="form-control" id="name" value="${userdetail.name }" readonly="readonly">
		    	</div>
		  	</div>
		  	<div class="form-group">
		    	<label for="birth" class="col-sm-2 control-label">생년월일</label>
		    	<div class="row">
		    	<div class="col-sm-2">
		      		<input type="text" class="form-control" id="birth" value="${birth[0]}" readonly="readonly">
		    	</div>
		    	<div class="col-sm-1">
		      		<input type="text" class="form-control" id="birth" value="${birth[1]}" readonly="readonly">
		    	</div>
		    	<div class="col-sm-1">
		      		<input type="text" class="form-control" id="birth" value="${birth[2]}" readonly="readonly">
		    	</div>
		    	</div>
		  	</div>
		  	<!-- 별명을 변경한 경우, 변경 확인을 통해 진행해야 함 -->
		  	<div class="form-group">
		    	<label for="nickname" class="col-sm-2 control-label">별명</label>
		    	<div class="col-sm-5">
		      		<input type="text" class="form-control" id="nickname" value="${userdetail.nickName }" readonly="readonly">
		    	</div>
		    	<!--<button class="btn btn-default">변경</button>-->
		  	</div>
		  	<div class="form-group">
		    	<label for="address" class="col-sm-2 control-label">주소</label>
		    	<div class="col-sm-5">
		      		<input type="text" class="form-control" id="address1" name="address1" value="${userdetail.address }" readonly="readonly">
		    	</div>
		    	<input type="button" class="btn btn-default" onclick="addressForm();" value="주소찾기">
		    </div>
		    <div class="form-group">
		    	<label for="address" class="col-sm-2 control-label"></label>
		    	<div class="col-sm-5">
		      		<input type="text" class="form-control" id="address2" name="address2" value="${userdetail.address_detail }">
		    	</div>
		    </div>
		  	<div class="form-group">
		    	<div class="col-sm-offset-2 col-sm-2"> 
		      		<input type="button" class="btn btn-primary btn-block" onclick="updateCheck();" value="정보수정">
		    	</div>
		  	</div>
		</form>
		</div>
	</div>
	
	<%@ include file="../Fix/footer.jsp" %>
</body>
</html>