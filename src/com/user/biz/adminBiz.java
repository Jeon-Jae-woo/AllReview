package com.user.biz;

import java.util.List;

import com.user.dto.pagingDto;
import com.user.dto.userDto;

public interface adminBiz {

	//회원 목록 조회
	public List<userDto> allUserListService(int pageNum);
	
	//페이징 처리
	public pagingDto userListPaging(int pageNum);
}
