package com.user.dao;

import java.util.List;

import com.user.dto.userDto;

public interface adminDao {
	//유저 전체 조회
	//이메일, 별명, 가입일
	String userAllList = "SELECT RNUM, EMAIL, NICKNAME, CREATE_AT FROM( SELECT ROWNUM AS RNUM, EMAIL, NICKNAME, CREATE_AT FROM (SELECT EMAIL, NICKNAME, CREATE_AT FROM MEMBER ORDER BY CREATE_AT DESC) WHERE ROWNUM<?) WHERE RNUM>=?";
	String userAllCount = "SELECT COUNT(*) FROM MEMBER";
	
	
	
	public List<userDto> allUserList(int pageNum);
	public int totaluserCount();
	
}
