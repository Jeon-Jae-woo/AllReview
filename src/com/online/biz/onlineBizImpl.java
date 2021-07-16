package com.online.biz;

import static common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.List;

import com.online.dao.onlineDao;
import com.online.dao.onlineDaoImpl;
import com.online.dto.onlineDto;
import com.user.dto.pagingDto;


public class onlineBizImpl implements onlineBiz {

	private onlineDao dao = new onlineDaoImpl(); 
	

	//카테고리별 리스트 조회
	@Override
	public List<onlineDto> selectListCateService(int category_id, int pageNum) {
		Connection con = getConnection();
		List<onlineDto> list = dao.selectListCate(con, category_id, pageNum);
		
		// category id, pageNum은 잘 받아옴 , 리스트만 못받음
		System.out.println("bizimpl 리스트값 : " + list);
		
		close(con);
		return list;
	}

	//카테고리별 리스트 페이징
	@Override
	public pagingDto OnlineListPaging(int pageNum, int category) {
		pagingDto paging = new pagingDto();
		paging.setPageNum(pageNum);
		int size = 0;
		size = dao.OnlineRowCount(category);
		
		paging.setTotalCount(size);
		paging.pagination();
		
		return paging;
	}

	@Override
	public onlineDto selectOnlineService(int board_id) {
		Connection con = getConnection();
		onlineDto dto = dao.selectOneBoard(con, board_id);
		close(con);
		return dto;
	}

	@Override
	public int updateOnlineService(onlineDto dto) {
		Connection con = getConnection();
		int result = dao.updateOnlineBoard(con, dto);
		close(con);
		return result;
	}

	//삭제
	@Override
	public int deleteOnlineService(int board_id, String nickname) {
		Connection con =getConnection();
		int result = dao.deleteOnlineBoard(con, board_id, nickname);
		close(con);
		return result;
	}

	//글쓰기
	@Override
	public int insertOnlineService(onlineDto dto) {
		Connection con = getConnection();
		int result = dao.insertOnlineBoard(con, dto);
		return result;
	}

	@Override
	public String categoryNameService(int category_id) {
		  String category_name = dao.findCategoryName(category_id);
	      return category_name;
	   }
}
