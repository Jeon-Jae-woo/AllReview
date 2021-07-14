package com.user.dao;

import java.util.List;

import com.user.dto.totalBoardDto;

public interface totalBoardDao {
	//내가 쓴 글 전체 row 수
	String selectRowShopCount = "SELECT COUNT(*) FROM SHOP_TB WHERE NICKNAME=? AND DELETES=0";
	String selectRowMovieCount = "SELECT COUNT(*) FROM MOVIE_REVIEW WHERE NICKNAME=? AND DELETE_N=0";
	String selectRowBookCount = "SELECT COUNT(*) FROM book_review_board WHERE NICKNAME=?";
	String selectRowOnlineCount = "SELECT COUNT(*) FROM ONLINE_BOARD WHERE NICKNAME=? AND DELETE_N=0 ";
	
	//내가 쓴 게시글 조회
	//매장
	String offlineWriteQuery = "SELECT R.RNUM, R.SHOP_NO, R.CATEGORY_NO, R.CATEGORY_NAME, R.TITLE, R.CREATEAT "
			+ "FROM (SELECT ROWNUM AS RNUM, SH.SHOP_NO, SH.CATEGORY_NO, SH.CATEGORY_NAME, SH.TITLE, SH.CREATEAT "
			+ "FROM (SELECT SHOP_NO, CATEGORY_NO, CATEGORY_NAME, TITLE, CREATEAT FROM SHOP_TB "
			+ "LEFT JOIN SHOP_CATE ON(CATEGORY_NO=CATEGORY_ID) "
			+ "WHERE NICKNAME=? AND DELETES=0"
			+ "ORDER BY CREATEAT DESC) SH WHERE ROWNUM<?) R WHERE R.RNUM >=?";

	//영화
	String movieWriteQuery = "SELECT RNUM, REVIEW_ID, MOVIE_TYPE, MOVIE_TYPE_NAME, REVIEW_TITLE, CREATEAT "
			+ "FROM (SELECT ROWNUM AS RNUM, REVIEW_ID, MOVIE_TYPE, MOVIE_TYPE_NAME, REVIEW_TITLE, CREATEAT "
			+ "FROM (SELECT REVIEW_ID, MC.MOVIE_TYPE, MC.MOVIE_TYPE_NAME, MR.REVIEW_TITLE, MR.CREATEAT FROM MOVIE_REVIEW MR "
			+ "JOIN MOVIE_BOARD MB ON (MR.MOVIE_ID=MB.MOVIE_ID) JOIN MOVIE_CATEGORY MC ON (MB.MOVIE_TYPE=MC.MOVIE_TYPE) "
			+ "WHERE NICKNAME=? AND DELETE_N=0 ORDER BY MR.CREATEAT DESC)  "
			+ "WHERE ROWNUM<?) R WHERE RNUM >=?";
	

	//책
	String bookWriteQuery = "SELECT RNUM, REVIEW_ID, BOOK_TYPE, BOOK_TYPE_NAME, REVIEW_TITLE, CREATEAT "
			+ "FROM (SELECT ROWNUM AS RNUM, REVIEW_ID, BOOK_TYPE, BOOK_TYPE_NAME, REVIEW_TITLE, CREATEAT "
			+ "FROM (SELECT REVIEW_ID, bc.BOOK_TYPE, BOOK_TYPE_NAME, REVIEW_TITLE, brd.createAt "
			+ "FROM book_review_board brd JOIN book_board bb ON(brd.BOOK_ID=bb.BOOK_ID) "
			+ "JOIN book_category bc ON(bb.BOOK_TYPE=bc.BOOK_TYPE) "
			+ "WHERE NICKNAME=? AND STATUS=1 ORDER BY BRD.CREATEAT DESC) "
			+ "WHERE ROWNUM<?) WHERE RNUM >=?";
	
	
	//온라인
	String onlineWriteQuery = "SELECT RNUM, ONLINE_BOARD_ID, CATEGORY_ID, CATEGORY_NAME, ONLINE_TITLE ,CREATEAT "
			+ "FROM(SELECT ROWNUM AS RNUM,ONLINE_BOARD_ID, CATEGORY_ID, CATEGORY_NAME, ONLINE_TITLE ,CREATEAT "
			+ "FROM(SELECT ONLINE_BOARD_ID, OB.CATEGORY_ID, OC.CATEGORY_NAME, OB.ONLINE_TITLE ,OB.CREATEAT "
			+ "FROM ONLINE_BOARD OB JOIN ONLINE_CATEGORY OC ON(OB.CATEGORY_ID = OC.CATEGORY_ID) "
			+ "WHERE NICKNAME=? AND DELETE_N=0 ORDER BY OB.CREATEAT DESC) WHERE ROWNUM<?) WHERE RNUM >=?";
	
	
	//승인 대기중인 글 목록
	//전체 row
	String offlineWaitCount = "SELECT COUNT(*) FROM SHOP_TB WHERE STATUS=? AND DELETES=0";
	String movieWaitCount = "SELECT COUNT(*) FROM MOVIE_REVIEW WHERE STATUS_NO=? AND DELETE_N=0";
	String bookWaitCount = "SELECT COUNT(*) FROM book_review_board WHERE STATUS=?";
	String onlineWaitCount = "SELECT COUNT(*) FROM ONLINE_BOARD WHERE STATUS=?";
	
	//매장
	String offlineWaitQuery = "SELECT R.RNUM, R.SHOP_NO, R.CATEGORY_NO, R.CATEGORY_NAME, R.TITLE, R.CREATEAT "
			+ "FROM (SELECT ROWNUM AS RNUM, SH.SHOP_NO, SH.CATEGORY_NO, SH.CATEGORY_NAME, SH.TITLE, SH.CREATEAT "
			+ "FROM (SELECT SHOP_NO, CATEGORY_NO, CATEGORY_NAME, TITLE, CREATEAT FROM SHOP_TB "
			+ "LEFT JOIN SHOP_CATE ON(CATEGORY_NO=CATEGORY_ID) WHERE DELETES=0 AND STATUS=? ORDER BY CREATEAT DESC) SH "
			+ "WHERE ROWNUM<?) R WHERE R.RNUM >=?";
	
	//영화
	String movieWaitQuery = "SELECT RNUM, REVIEW_ID, MOVIE_TYPE, MOVIE_TYPE_NAME, REVIEW_TITLE, CREATEAT "
			+ "FROM (SELECT ROWNUM AS RNUM, REVIEW_ID, MOVIE_TYPE, MOVIE_TYPE_NAME, REVIEW_TITLE, CREATEAT "
			+ "FROM (SELECT REVIEW_ID, MC.MOVIE_TYPE, MC.MOVIE_TYPE_NAME, MR.REVIEW_TITLE, MR.CREATEAT "
			+ "FROM MOVIE_REVIEW MR JOIN MOVIE_BOARD MB ON (MR.MOVIE_ID=MB.MOVIE_ID) "
			+ "JOIN MOVIE_CATEGORY MC ON (MB.MOVIE_TYPE=MC.MOVIE_TYPE) "
			+ "WHERE STATUS_NO=? AND DELETE_N=0 ORDER BY MR.CREATEAT DESC) WHERE ROWNUM<?) R "
			+ "WHERE RNUM >=?";
	
	//책
	String bookWaitQuery = "SELECT RNUM, REVIEW_ID, BOOK_TYPE, BOOK_TYPE_NAME, REVIEW_TITLE, CREATEAT "
			+ "FROM (SELECT ROWNUM AS RNUM, REVIEW_ID, BOOK_TYPE, BOOK_TYPE_NAME, REVIEW_TITLE, CREATEAT "
			+ "FROM (SELECT REVIEW_ID, bc.BOOK_TYPE, BOOK_TYPE_NAME, REVIEW_TITLE, brd.createAt "
			+ "FROM book_review_board brd JOIN book_board bb ON(brd.BOOK_ID=bb.BOOK_ID) "
			+ "JOIN book_category bc ON(bb.BOOK_TYPE=bc.BOOK_TYPE) WHERE STATUS=? ORDER BY BRD.CREATEAT DESC) "
			+ "WHERE ROWNUM<?) WHERE RNUM >=?";
	
	
	//온라인
	String onlineWaitQuery = "SELECT RNUM, ONLINE_BOARD_ID, CATEGORY_ID, CATEGORY_NAME, ONLINE_TITLE ,CREATEAT "
			+ "FROM(SELECT ROWNUM AS RNUM,ONLINE_BOARD_ID, CATEGORY_ID, CATEGORY_NAME, ONLINE_TITLE ,CREATEAT "
			+ "FROM(SELECT ONLINE_BOARD_ID, OB.CATEGORY_ID, OC.CATEGORY_NAME, OB.ONLINE_TITLE ,OB.CREATEAT "
			+ "FROM ONLINE_BOARD OB JOIN ONLINE_CATEGORY OC ON(OB.CATEGORY_ID = OC.CATEGORY_ID) "
			+ "WHERE STATUS=? AND DELETE_N=0 ORDER BY OB.CREATEAT DESC) WHERE ROWNUM<?) WHERE RNUM >=?";
	
	//승인 및 거절 처리
	//매장
	String offlineStatusPc = "UPDATE SHOP_TB SET STATUS=? WHERE SHOP_NO=? AND DELETES=0";
	//영화 
	String movieStatusPc = "UPDATE MOVIE_REVIEW SET STATUS_NO=? WHERE REVIEW_ID=? AND DELETE_N=0";
	//책
	String bookStatusPc = "UPDATE REVIEW_BOARD SET STATUS=? WHERE REVIEW_ID=?";
	//온라인
	String onlineStatusPc = "UPDATE ONLINE_BOARD SET STATUS=? WHERE ONLINE_BOARD_ID=? AND DELETE_N=0";
	
	
	
	//DAO
	public List<totalBoardDto> userShopBoardList(String nickname, int pageNum); 
	public List<totalBoardDto> userBookBoardList(String nickname,int pageNum);
	public List<totalBoardDto> userMovieBoardList(String nickname,int pageNum);
	public List<totalBoardDto> userOnlineBoardList(String nickname,int pageNum);
	//페이징 처라 - 총 row 수
	public int totalShopRowCount(String nickname);
	public int totalMovieRowCount(String nickname);
	public int totalBookRowCount(String nickname);
	public int totalOnlineRowCount(String nickname);
	
	
	//승인대기중인 글 DAO
	public List<totalBoardDto> waitShopBoardList(int pageNum, int status);
	public List<totalBoardDto> waitMovieBoardList(int pageNum, int status);
	public List<totalBoardDto> waitBookBoardList(int pageNum, int status);
	public List<totalBoardDto> waitOnlineBoardList(int pageNum, int status);
	//페이정 처리 - 승인 대기중인 글 총 row
	public int totalShopWaitCount(int status);
	public int totalMovieWaitCount(int status);
	public int totalBookWaitCount(int status);
	public int totalOnlineWaitCount(int status);
	
	
	//승인 및 거절 처리
	public int OfflineStatusProcessing(int status, int review_id);
	public int MovieStatusProcessing(int status, int review_id);
	public int BookStatusProcessing(int status, int review_id);
	public int OnlineStatusProcessing(int status, int review_id);
	
}
