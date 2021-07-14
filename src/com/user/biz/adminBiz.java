package com.user.biz;

import java.util.List;

import com.user.dto.adminUserDto;
import com.user.dto.pagingDto;
import com.user.dto.totalBoardDto;
import com.user.dto.userDto;

public interface adminBiz {

	//회원 목록 조회
	public List<userDto> allUserListService(int pageNum);
	
	//페이징 처리
	public pagingDto userListPaging(int pageNum);
	
	//관리자 목록 조회
	public List<userDto> adminUserListService(int pageNum);
	//관리자 리스트 페이징
	public pagingDto adminListPaging(int pageNum);
	
	//단일 회원 조회
	public adminUserDto userdetailService(String email);
	
	//유저 정보 업데이트
	public int userUpdateService(String email, int statusNo, int levelNo);
	
	//승인 대기중인 글 리스트(카테고리 구분)
	public List<totalBoardDto> waitListService(int pageNum, String category, int status);
	public pagingDto waitListPaging(int pageNum, String category, int status);
	
	//글 승인 및 거절 처리(카테고리 구분)
	public int approvalService(int status, String bigCate, int review_id);
	
	
}
