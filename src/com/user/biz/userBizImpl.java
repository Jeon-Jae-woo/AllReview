package com.user.biz;

import java.util.List;

import com.user.dao.totalBoardDao;
import com.user.dao.totalBoardDaoImpl;
import com.user.dao.userDao;
import com.user.dao.userDaoImpl;
import com.user.dto.pagingDto;
import com.user.dto.totalBoardDto;
import com.user.dto.userDto;

public class userBizImpl implements userBiz {

	private userDao userdao = new userDaoImpl();
	private totalBoardDao boarddao = new totalBoardDaoImpl();
	
	
	//회원가입 서비스
	@Override
	public int joinService(userDto userdto) {
		int result = userdao.join(userdto);
		
		return result;
	}

	//이메일 체크 서비스
	@Override
	public int emailChkService(String email) {
		int result = userdao.emailChk(email);
		return result;
	}

	//별명 중복 서비스
	@Override
	public int nicknameChkService(String nickname) {
		int result = userdao.nicknameChk(nickname);
		return result;
	}

	//로그인 서비스
	@Override
	public userDto loginChkService(String email, String password) {
		userDto user = userdao.loginChk(email, password);
		return user;
	}


	//마이페이지 - 회원 정보 조회
	@Override
	public userDto mypageInfoService(String email) {
		userDto userdetail = new userDto();
		userdetail = userdao.mypageInfo(email);
		
		return userdetail;
	}
	
	//마이페이지 - 회원 정보 수정
	@Override
	public int mypageInfoUpdateService(userDto userUpdate) {
		int result = userdao.mypageInfoUpdate(userUpdate);
		return result;
	}
	
	
	//마이페이지 - 회원 탈퇴
	@Override
	public int mypagaLeaveService(String email, String password) {
		int result = userdao.mypageLeave(email, password);
		return result;
	}

	//마이페이지 - 내가 쓴 글 조회
	@Override
	public List<totalBoardDto> userWriteListService(String nickname, int pageNum, String category) {
		List<totalBoardDto> utbd = null;
		//카테고리로 구분!
		if(category.equals("매장")) {
			utbd = boarddao.userShopBoardList(nickname, pageNum);
		}else if(category.equals("영화")) {
			utbd = boarddao.userMovieBoardList(nickname, pageNum);
		}else if(category.equals("온라인")) {
			utbd = boarddao.userOnlineBoardList(nickname, pageNum);
		}else if(category.equals("책")) {
			utbd = boarddao.userBookBoardList(nickname, pageNum);
		}
		
		return utbd;
	}

	@Override
	public pagingDto writeListPaging(String nickname, int pageNum, String category) {
		pagingDto paging = new pagingDto();
		paging.setPageNum(pageNum);
		int size = 0;
		//총 row 카운트
		if(category.equals("매장")) {
			size = boarddao.totalShopRowCount(nickname);
		}else if(category.equals("영화")) {
			size = boarddao.totalMovieRowCount(nickname);
		}else if(category.equals("온라인")) {
			size = boarddao.totalOnlineRowCount(nickname);
		}else if(category.equals("책")) {
			size = boarddao.totalBookRowCount(nickname);
		}
		
		paging.setTotalCount(size);
		paging.pagination();
		
		
		return paging;
	}

	//이메일 인증
	@Override
	public int emailAuthService(String email, String code) {
		int result = userdao.emailAuth(email, code);
		return result;
	}

	//유저 상태 조회
	@Override
	public userDto userStatusService(String email) {
		userDto dto = userdao.userStatus(email);
		return dto;
	}



	

	
	
}
