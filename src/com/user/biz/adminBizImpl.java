package com.user.biz;

import java.util.List;

import com.user.dao.adminDao;
import com.user.dao.adminDaoImpl;
import com.user.dto.pagingDto;
import com.user.dto.userDto;

public class adminBizImpl implements adminBiz {

	private adminDao admindao = new adminDaoImpl();
	
	//회원 목록 조회
	@Override
	public List<userDto> allUserListService(int pageNum) {
		List<userDto> userList = admindao.allUserList(pageNum);
		return userList;
	}

	@Override
	public pagingDto userListPaging(int pageNum) {
		pagingDto paging = new pagingDto();
		paging.setPageNum(pageNum);
		
		int size = admindao.totaluserCount();
		
		paging.setTotalCount(size);
		paging.pagination();
		
		return paging;
	}

}
