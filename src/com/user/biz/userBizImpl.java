package com.user.biz;

import com.user.dao.userDao;
import com.user.dao.userDaoImpl;
import com.user.dto.userDto;

public class userBizImpl implements userBiz {

	private userDao userdao = new userDaoImpl();

	//회원가입 서비스
	@Override
	public int joinService(userDto userdto) {
		int result = userdao.join(userdto);
		
		return result;
	}

	//이메일 체크 서비스
	@Override
	public int emailChkService(String email) {
		int result = userdao.emailChk(email);
		return result;
	}

	//별명 중복 서비스
	@Override
	public int nicknameChkService(String nickname) {
		int result = userdao.nicknameChk(nickname);
		return result;
	}

	//로그인 서비스
	@Override
	public userDto loginChkService(String email, String password) {
		userDto user = userdao.loginChk(email, password);
		return user;
	}

	//권한부여
	@Override
	public int adminLevelUpdateService(String email, int levelNo) {
		System.out.println("imple실행");
		int result = userdao.adminLevelupdate(email, levelNo);
		return result;
	}

	

	
	
}
