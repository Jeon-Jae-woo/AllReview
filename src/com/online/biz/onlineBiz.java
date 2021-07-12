package com.online.biz;

import java.util.List;

import com.online.dto.onlineDto;
import com.user.dto.pagingDto;


public interface onlineBiz {
	

	//카테고리별 리스트 
	public List<onlineDto> selectListCateService(int category_id, int pageNum);
	public pagingDto OnlineListPaging(int pageNum, int category);

	//단일 게시글 조회
	public onlineDto selectOnlineService(int board_id);
	
	//게시글 수정
	public int updateOnlineService(onlineDto dto);
	
	//게시글 삭제
	public int deleteOnlineService(int board_id, String nickname);
	
	//글 쓰기
	public int insertOnlineService(onlineDto dto);
	
	//카테고리 이름 조회
	public String categoryNameService(int category_id);
	
	
}
