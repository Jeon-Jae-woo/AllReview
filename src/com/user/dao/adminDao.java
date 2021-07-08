package com.user.dao;

import java.util.List;

import com.user.dto.adminUserDto;
import com.user.dto.userDto;

public interface adminDao {
	//유저 전체 조회
	//이메일, 별명, 가입일
	String userAllList = "SELECT RNUM, EMAIL, NICKNAME, CREATE_AT "
			+ "FROM( SELECT ROWNUM AS RNUM, EMAIL, NICKNAME, CREATE_AT "
			+ "FROM (SELECT EMAIL, NICKNAME, CREATE_AT FROM MEMBER ORDER BY CREATE_AT DESC) WHERE ROWNUM<?) "
			+ "WHERE RNUM>=?";
	
	String userAllCount = "SELECT COUNT(*) FROM MEMBER";
	
	//관리자 전체 조회
	String adminAllList = "SELECT RNUM, EMAIL, NICKNAME, CREATE_AT "
			+ "FROM( SELECT ROWNUM AS RNUM, EMAIL, NICKNAME, CREATE_AT "
			+ "FROM (SELECT EMAIL, NICKNAME, CREATE_AT FROM MEMBER WHERE LEVEL_NO<3 ORDER BY CREATE_AT DESC) WHERE ROWNUM<?) "
			+ "WHERE RNUM>=?";
	String adminAllCount = "SELECT COUNT(*) FROM MEMBER WHERE LEVEL_NO>3";
	
	//단일 유저 조회
	String userDetailQuery = "SELECT M.EMAIL, M.NICKNAME, M.LEVEL_NO, M.STATUS_NO, M.CREATE_AT, ML.LEVEL_NAME, MS.STATUS_NAME "
			+ "FROM MEMBER M "
			+ "JOIN MEMBER_LEVEL ML ON(M.LEVEL_NO= ML.LEVEL_NO) "
			+ "JOIN MEMBER_STATUS MS ON(M.STATUS_NO=MS.STATUS_NO) "
			+ "WHERE EMAIL=?";
	
	//유저 업데이트
	String userUpdateQuery = "UPDATE MEMBER SET LEVEL_NO=?, STATUS_NO=? WHERE EMAIL=?";

	//전체 유저 조회
	public List<userDto> allUserList(int pageNum);
	public int totaluserCount();
	
	public List<userDto> adminUserList(int pageNum);
	public int totalAdminuserCount();
	
	//유저 정보 조회
	public adminUserDto userdetail(String email);
	public int userUpdate(adminUserDto updateUser);
	
	
	
}
