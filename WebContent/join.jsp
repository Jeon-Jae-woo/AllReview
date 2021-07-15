<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style type="text/css">
	#join_div{
  		  width:770px;
		  height:600px;
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/js/userform.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	//이메일 체크
	function validCheckEmail(){
		var email_regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		var email = document.join_form.email.value.replace(/\s/g, "");
		
		if (email_regex.test(email) == false) {
	        alert("이메일 형식이 올바르지 않습니다");
	        return false;
		}else{
			$.ajax({
				url:"userController?command=emailchk&email="+email,
				method:"get",
				success:function(result){
					window.open("emailCheckForm.jsp?email="+email+"&result="+result, "중복체크", "width=400, height=400");
				},
				error:function(){
					console.log("join 통신 실패");
				}
			});
		}
	}
	//별명 체크
	function validCheckNickname(){
		var nickname = document.join_form.nickname.value.replace(/\s/g, "");
		
		if(nickname.length<3 || nickname == "" || nickname == null){
			alert("닉네임은 3글자 이상으로 지어주세요");
			return false;
		}else{
			$.ajax({
				url:"userController?command=nicknamechk&nickname="+nickname,
				method:"get",
				success:function(result){
					window.open("nicknameCheckForm.jsp?nickname="+nickname+"&result="+result,"중복체크", "width=400, height=400");
				},
				error:function(){
					console.log("nickname 체크 통신 실패");
				}
				
			});
		}	
	}	
	
	function joinCheck2(){
		var form = document.join_form;
		
		//이메일 체크
		var email = form.email.value.replace(/\s/g, "");
		var emailchk = form.checkemail.value;
		if(email==null || email=="" || emailchk == "false"){
			alert("이메일 중복체크 해주세요");
			form.email.focus();
			return false;
		}
		
		//비밀번호 체크
		var password = form.password.value;
		
		//8자리 이상, 숫자 포함, 영대 문자 포함, 영소 문자 포함, 특수문자 포함
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		if(reg.test(password) == false){
			alert("비밀번호는 8자리 이상, 숫자/대문자/특수 문자를 포함해야 합니다");
			form.password.focus();
			return false;
		}
		//비밀번호 일치 체크
		var password2 = form.password2.value;
		if(password != password2){
			alert("비밀번호가 일치하지 않습니다");
			form.password.focus();
			return false;
		}
		
		//이름 체크
		var name = form.name.value.replace(/\s/g, "");
		if(name==null || name==""){
			alert("이름을 입력해 주세요");
			form.name.focus();
			return false;
		}
		
		//날짜
		var birth1 = form.birth1.value.replace(/\s/g, "");
		var birth2 = form.birth2.value.replace(/\s/g, "");
		var birth3 = form.birth3.value.replace(/\s/g, "");
		
		var birth = birth1+"-"+birth2+"-"+birth3;
		
		
		try {
		    var date = birth.split("-");
		    var y = parseInt(date[0], 10),
		        m = parseInt(date[1], 10),
		        d = parseInt(date[2], 10);
		    
		    var dateRegex = /^(?=\d)(?:(?:31(?!.(?:0?[2469]|11))|(?:30|29)(?!.0?2)|29(?=.0?2.(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))(?:\x20|$))|(?:2[0-8]|1\d|0?[1-9]))([-.\/])(?:1[012]|0?[1-9])\1(?:1[6-9]|[2-9]\d)?\d\d(?:(?=\x20\d)\x20|$))?(((0?[1-9]|1[012])(:[0-5]\d){0,2}(\x20[AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2})?$/;
		    if(dateRegex.test(d+'-'+m+'-'+y) == false){
				alert("날짜를 잘못 입력하였습니다");
				form.birth1.focus();
				return false;
			};
		} catch (err) {
			alert("날짜를 잘못 입력하였습니다");
			return false;
		}    
	    
		if(form.gender1.checked == false && form.gender2.checked == false){
			alert("성별을 체크해 주세요");
			return false;
		}
		
		
		//별명 체크
		var nickname = form.nickname.value.replace(/\s/g, "");
		var checknickname = form.checknickname.value;
		if(nickname==null || nickname=="" || checknickname == "false"){
			alert("별명 중복체크 해주세요");
			form.nickname.focus();
			return false;
		}
		
		//주소 체크
		var address1 = form.address1.value;
		var address2 = form.address2.value;
		
		if(address1==null || address1=="" || address2==null || address2=="" ){
			alert("주소를 입력해 주세요");
			form.address2.focus();
			return false;
		}
		
		form.submit();
		
	}
</script>
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
		<form class="form-horizontal" id="join_form" name="join_form" action="userController" method="post">
		<input type="hidden" name="command" value="join">
		  	<div class="form-group">
		    	<label for="email" class="col-sm-2 control-label">이메일*</label>
		    	<div class="col-sm-8">
		      		<input type="email" class="form-control" id="email" placeholder="이메일" aria-describedby="sizing-addon2" name="email">
		    	</div>
		    	<input type="button" class="btn btn-default" onclick="validCheckEmail();" value="중복체크">
		    	<input type="hidden" id="checkemail" value="false">
		  	</div>
		  	<div class="form-group">
		    	<label for="password" class="col-sm-2 control-label">비밀번호*</label>
		    	<div class="col-sm-8">
		      		<input type="password" class="form-control" id="password" placeholder="비밀번호" name="password">
		    	</div>
		  	</div>
		  	<div class="form-group">
		    	<label for="password" class="col-sm-2 control-label">비밀번호 확인*</label>
		    	<div class="col-sm-8">
		      		<input type="password" class="form-control" id="password2" placeholder="비밀번호 재입력" name="password2">
		    	</div>
		  	</div>
		  	<div class="form-group">
		    	<label for="name" class="col-sm-2 control-label">이름*</label>
		    	<div class="col-sm-8">
		      		<input type="text" class="form-control" id="name" placeholder="이름" name="name">
		    	</div>
		  	</div>
		  	<div class="form-group">
		  		<!-- 년, 월, 일 세부적으로 나눠서 받아야함 -->
		    	<label for="birth" class="col-sm-2 control-label">생년월일*</label>
		    	<div class="row">
		    	<div class="col-sm-2">
		      		<input type="text" class="form-control" id="birth1" placeholder="년(4자)" name="birth1">
		    	</div>
		    	<div class="col-sm-2">
		      		<input type="text" class="form-control" id="birth2" placeholder="월" name="birth2">
		    	</div>
		    	<div class="col-sm-2">
		      		<input type="text" class="form-control" id="birth3" placeholder="일" name="birth3">
		    	</div>
		    	</div>
		  	</div>
		  	<div class="form-group">
		  	<label for="gender" class="col-sm-2 control-label">성별*</label>
		  	<div class="form-check form-check-inline" style="text-align:left;">
  				<input class="form-check-input" type="radio" name="gender" id="gender1" value="남자" style="margin-left:40px;">
  				<label class="form-check-label" for="inlineRadio1" style="margin-right:40px;">남</label>
  				<input class="form-check-input" type="radio" name="gender" id="gender2" value="여자">
  				<label class="form-check-label" for="inlineRadio2">여</label>
  			</div>
			</div>
			
		  	<div class="form-group">
		    	<label for="nickname" class="col-sm-2 control-label">별명*</label>
		    	<div class="col-sm-8">
		      		<input type="text" class="form-control" id="nickname" placeholder="별명" name="nickname">
		    	</div>
		    	<input type="button" class="btn btn-default" onclick="validCheckNickname();" value="중복체크">
		    	<input type="hidden" id="checknickname" value="false">
		  	</div>
		  	<div class="form-group">
		    	<label for="address" class="col-sm-2 control-label">주소*</label>
		    	<div class="col-sm-8">
		      		<input type="text" class="form-control" id="address1" name="address1" readonly="readonly">
		    	</div>
		    	<input type="button" class="btn btn-default" onclick="addressForm();" value="주소찾기">
		    </div>
		    <div class="form-group">
		    	<label for="address2" class="col-sm-2 control-label"></label>
		    	<div class="col-sm-8">
		      		<input type="text" class="form-control" id="address2" placeholder="상세주소" name="address2">
		    	</div>
		    </div>
		  	<div class="form-group">
		    	<div class="col-sm-offset-2 col-sm-8">
		      		<input type="button" class="btn btn-primary btn-lg btn-block" onclick="joinCheck2();" value="회원가입">
		    	</div>
		  	</div>
		</form>
	</div>
	</section>

<%@ include file="../Fix/footer.jsp" %>

</body>
</html>