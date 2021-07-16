package com.user.dao;

import com.user.dto.userDto;

public interface userDao{
	
	/*
	 * 쿼리문
	 */
	//회원가입
	//3 - 회원 , SYSDATE 가입날짜 및 수정날짜, 1 - 상태 활동중 
	//이메일, 닉네임, 레벨, 패스워드, 이름, 생일, 성별, 주소, 가입날짜, 수정날짜, 상태, 이메일 해시
	String joinQuery = "INSERT INTO MEMBER VALUES(?,?,3,?,?,?,?,?,?,SYSDATE,SYSDATE,4,?)";
	String joinMemberCheck = "SELECT EMAIL FROM MEMBER WHERE EMAIL=?";
	String nicknameCheck = "SELECT NICKNAME FROM MEMBER WHERE NICKNAME=?";
	String loginCheck = "SELECT EMAIL,NICKNAME,LEVEL_NO,STATUS_NO FROM MEMBER WHERE EMAIL=? AND PASSWORD=?";
	
	//단일 유저 정보 조회
	String selectOneUser = "SELECT * FROM MEMBER WHERE EMAIL=? AND (STATUS_NO=1 OR STATUS_NO=2)";
	//회원 정보 수정
	String updateUserQuery = "UPDATE MEMBER SET PASSWORD=?, ADDRESS=?, ADDRESS_DETAIL=? WHERE EMAIL=?";
	//회원 탈퇴
	String leaveUserQuery = "UPDATE MEMBER SET STATUS_NO=3 WHERE EMAIL=? AND PASSWORD=?";
	
	//이메일 인증
	String EmailAuthentication = "UPDATE MEMBER SET STATUS_NO=1 WHERE EMAIL=? AND EMAIL_HASH=?";
	//유저 상태 조회
	String userStatusQuery = "SELECT EMAIL, STATUS_NO FROM MEMBER WHERE EMAIL=?";
	
	//유저 비밀번호 찾기(이메일, 닉네임으로 검사)
	String userFindEmailandPassowrd = "SELECT EMAIL FROM MEMBER WHERE EMAIL=? AND NICKNAME=? AND STATUS_NO=1";
	//비밀번호 세팅
	String updateTempPassword = "UPDATE MEMBER SET PASSWORD=? WHERE EMAIL=? AND STATUS_NO=1";
	
	
	/*
	 * 기능
	 */
	public int join(userDto dto);
	public int emailChk(String email);
	public int nicknameChk(String nickname);
	public userDto loginChk(String email, String password);
	//마이페이지 - 회원 정보 조회
	public userDto mypageInfo(String email);
	//마이페이지 - 회원 정보 수정
	public int mypageInfoUpdate(userDto userUpdate);
	//회원탈퇴
	public int mypageLeave(String email, String password);
	
	//이메일 인증
	public int emailAuth(String email, String code);
	//유저 상태 조회
	public userDto userStatus(String email);
	
	//비밀번호 찾기 유저 검색
	public userDto userFindEN(String email, String nickname);
	//비밀번호 세팅
	public int updateTempPassword(String email, String tempPassword);
	
	
}