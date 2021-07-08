package com.user.biz;

import java.util.List;

import com.user.dto.pagingDto;
import com.user.dto.totalBoardDto;
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
	
	//마이페이지 - 회원 정보
	public userDto mypageInfoService(String email);
	//마이페이지 - 회원 정보 수정
	public int mypageInfoUpdateService(userDto userUpdate);
	//마이페이지 - 회원 탈퇴
	public int mypagaLeaveService(String email, String password);
	//마이페이지 - 내가 쓴 글 조회
	public List<totalBoardDto> userWriteListService(String nickname, int pageNum,String category);
	
	//페이징 처리 - 내가 쓴 글 조회
	public pagingDto writeListPaging(String nickname, int pageNum, String category);

	
	
	
}
