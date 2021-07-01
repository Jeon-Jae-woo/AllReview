package com.user.dao;

import com.user.dto.userDto;

public interface userDao{
	
	/*
	 * 쿼리문
	 */
	//회원가입
	//3 - 회원 , SYSDATE 가입날짜 및 수정날짜, 1 - 상태 활동중 
	//이메일, 닉네임, 레벨, 패스워드, 이름, 생일, 성별, 주소, 가입날짜, 수정날짜, 상태
	String joinQuery = "INSERT INTO MEMBER VALUES(?,?,3,?,?,?,?,?,SYSDATE,SYSDATE,1)";
	String joinMemberCheck = "SELECT EMAIL FROM MEMBER WHERE EMAIL=?";
	String nicknameCheck = "SELECT NICKNAME FROM MEMBER WHERE NICKNAME=?";
	String loginCheck = "SELECT * FROM MEMBER WHERE EMAIL=? AND PASSWORD=?";
	
	//권한 부여
	String levelUpdateQuery = "UPDATE MEMBER SET LEVEL_NO=? WHERE EMAIL=?";
	
	
	/*
	 * 기능
	 */
	public int join(userDto dto);
	public int emailChk(String email);
	public int nicknameChk(String nickname);
	public userDto loginChk(String email, String password);
	
	public int adminLevelupdate(String email, int levelNo);
	
}