function joinCheck(){
	console.log("회원가입 체크 로직 동작");
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
	console.log(password);
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
	console.log(password);
	console.log(password2);
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
	return false;
	form.submit();
	
}

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
	return false;
	form.submit();
	
}
