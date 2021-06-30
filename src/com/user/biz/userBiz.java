package com.user.biz;

import com.user.dto.userDto;

public interface userBiz {
	
	/*
	 * 기능
	 */
	
	//회원가입
	public int joinService(userDto userdto);
	//이메일 체크
	public int emailChkService(String email);
	//별명 중복 체크
	public int nicknameChkService(String nickname);
	//로그인 체크
	public userDto loginChkService(String email, String password);
	
	//admin 권한 부여
	public int adminLevelUpdateService(String email, int levelNo);
	
	
}
