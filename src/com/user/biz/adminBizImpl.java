package com.user.biz;

import java.util.List;

import com.user.dao.adminDao;
import com.user.dao.adminDaoImpl;
import com.user.dao.totalBoardDao;
import com.user.dao.totalBoardDaoImpl;
import com.user.dto.adminUserDto;
import com.user.dto.pagingDto;
import com.user.dto.totalBoardDto;
import com.user.dto.userDto;

public class adminBizImpl implements adminBiz {

	private adminDao admindao = new adminDaoImpl();
	private totalBoardDao boarddao = new totalBoardDaoImpl();
	
	//회원 목록 조회
	@Override
	public List<userDto> allUserListService(int pageNum) {
		List<userDto> userList = admindao.allUserList(pageNum);
		return userList;
	}

	//모든 회원 페이징
	@Override
	public pagingDto userListPaging(int pageNum) {
		pagingDto paging = new pagingDto();
		paging.setPageNum(pageNum);
		
		int size = admindao.totaluserCount();
		
		paging.setTotalCount(size);
		paging.pagination();
		
		return paging;
	}

	//단일 유저 정보 조회
	@Override
	public adminUserDto userdetailService(String email) {
		adminUserDto userdto = admindao.userdetail(email);
		
		return userdto;
	}

	//유저 정보 업데이트
	@Override
	public int userUpdateService(String email, int statusNo, int levelNo) {
		adminUserDto updateUser = new adminUserDto();
		updateUser.setEmail(email);
		updateUser.setStatusNo(statusNo);
		updateUser.setLevelNo(levelNo);

		int result = admindao.userUpdate(updateUser);
		return result;
	}

	//관리자 리스트 조회
	@Override
	public List<userDto> adminUserListService(int pageNum) {
		List<userDto> userList = admindao.adminUserList(pageNum);
		return userList;
	}

	//관리자 리스트 페이징
	@Override
	public pagingDto adminListPaging(int pageNum) {
		pagingDto paging = new pagingDto();
		paging.setPageNum(pageNum);
		
		int size = admindao.totalAdminuserCount();
		
		paging.setTotalCount(size);
		paging.pagination();
		
		return paging;
	}

	//승인 대기중인 글 목록
	@Override
	public List<totalBoardDto> waitListService(int pageNum, String category, int status) {
		
		List<totalBoardDto> waitList = null;
		if(category.equals("매장")) {
			waitList = boarddao.waitShopBoardList(pageNum,status);
		}else if(category.equals("영화")) {
			waitList = boarddao.waitMovieBoardList(pageNum,status);
		}else if(category.equals("책")) {
			waitList = boarddao.waitBookBoardList(pageNum,status);
		}else if(category.equals("온라인")) {
			waitList = boarddao.waitOnlineBoardList(pageNum,status);
		}
		
		return waitList;
	}

	@Override
	public pagingDto waitListPaging(int pageNum, String category, int status) {
		pagingDto paging = new pagingDto();
		paging.setPageNum(pageNum);
		int size = 0;
		//총 row 카운트
		if(category.equals("매장")) {
			size = boarddao.totalShopWaitCount(status);
		}else if(category.equals("영화")) {
			size = boarddao.totalMovieWaitCount(status);
		}else if(category.equals("온라인")) {
			size = boarddao.totalOnlineWaitCount(status);
		}else if(category.equals("책")) {
			size = boarddao.totalBookWaitCount(status);
		}
		
		paging.setTotalCount(size);
		paging.pagination();
		
		
		return paging;
	}

}
