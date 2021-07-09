package com.online.dao;

import java.sql.Connection;
import java.util.List;

import com.online.dto.onlineDto;


public interface onlineDao {
	
	//카테고리별 리스트 조회
	String selectAllCate = "SELECT RNUM, ONLINE_BOARD_ID, NICKNAME, CATEGORY_ID, ONLINE_TITLE, PRICE_SAT, "
			+ "PRODUCT_SAT, RECOMD, HITS, CATEGORY_NAME "
			+ "FROM( SELECT ROWNUM AS RNUM, ONLINE_BOARD_ID, NICKNAME, CATEGORY_ID, ONLINE_TITLE, PRICE_SAT, "
			+ "PRODUCT_SAT, RECOMD, HITS, CATEGORY_NAME FROM( "
			+ "SELECT ONLINE_BOARD_ID, NICKNAME, OB.CATEGORY_ID, ONLINE_TITLE, PRICE_SAT, PRODUCT_SAT, RECOMD, HITS, "
			+ "CATEGORY_NAME FROM ONLINE_BOARD OB JOIN ONLINE_CATEGORY OC ON(OB.CATEGORY_ID=OC.CATEGORY_ID) "
			+ "WHERE OB.CATEGORY_ID=? AND DELETE_N=0 AND STATUS=1)WHERE ROWNUM<?) WHERE RNUM>=?";
	String onlineRowQuery = "SELECT COUNT(*) FROM ONLINE_BOARD WHERE CATEGORY_ID=?";
	
	//단일 게시글 조회
	String onlineSelectQuery = "SELECT ONLINE_BOARD_ID, NICKNAME, OB.CATEGORY_ID, ONLINE_TITLE, ONLINE_CONTENT, PRICE_SAT,PRODUCT_SAT, ADD_RECEIPT, CREATEAT, STATUS, RECOMD,HITS,CATEGORY_NAME,ADD_PRODUCT FROM ONLINE_BOARD OB JOIN ONLINE_CATEGORY OC ON(OB.CATEGORY_ID = OC.CATEGORY_ID) WHERE ONLINE_BOARD_ID=? AND DELETE_N=0 AND STATUS=1";
	
	//글 수정
	String onlineUpdateQuery = "UPDATE ONLINE_BOARD SET ONLINE_TITLE=?, ONLINE_CONTENT=?, PRICE_SAT=?, PRODUCT_SAT=?, ADD_PRODUCT=?, UPDATEAT=SYSDATE WHERE ONLINE_BOARD_ID=? AND NICKNAME=?";
	
	//글 삭제
	String onlineDeleteQuery ="UPDATE ONLINE_BOARD SET DELETE_N=1 WHERE ONLINE_BOARD_ID=? AND NICKNAME=?";
	
	//글 쓰기
	String onlineWriteQuery ="INSERT INTO ONLINE_BOARD VALUES(ONLINE_BOARD_ID.NEXTVAL, ?,?,?,?,?,?,?,?,SYSDATE,SYSDATE,0,0,0,0)";
	
	//카테고리 이름 조회
	String cateogryNameQuery = "SELECT CATEGORY_NAME FROM ONLINE_CATEGORY WHERE CATEGORY_ID=?";
	
	//카테고리별 리스트 조회
	public List<onlineDto> selectListCate(Connection con, int category_id, int pageNum);
	public int OnlineRowCount(int category);
	
	//단일 게시글 조회
	public onlineDto selectOneBoard(Connection con, int board_id);
	
	//게시글 수정
	public int updateOnlineBoard(Connection con, onlineDto dto);
	
	//게시글 삭제
	public int deleteOnlineBoard(Connection con, int board_id, String nickname);
	
	//글 쓰기
	public int insertOnlineBoard(Connection con, onlineDto dto);
	
	
	//카테고리 이름 조회 
	public String findCategoryName(int category_id);

}
