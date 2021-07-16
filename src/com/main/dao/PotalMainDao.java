package com.main.dao;

import java.util.List;

import com.main.dto.PotalMainDto;

public interface PotalMainDao {

	//영화 
	String movieReviewAll = "SELECT REVIEW_ID, NICKNAME, REVIEW_TITLE, REVIEW_IMG, REVIEW_V_NUM FROM MOVIE_REVIEW WHERE STATUS_NO=1 AND DELETE_N=0";
	//매장
	String shopReviewAll = "SELECT SHOP_NO, NICKNAME, TITLE, UPLOAD_IMG, HIT FROM SHOP_TB WHERE DELETES=0 AND STATUS=1";
	//온라인
	String onlineReviewAll = "SELECT ONLINE_BOARD_ID, NICKNAME, ONLINE_TITLE, ADD_PRODUCT, HITS FROM ONLINE_BOARD WHERE STATUS=1 AND DELETE_N=0";
	//도서
	String bookReviewAll = "SELECT REVIEW_ID, NICKNAME, REVIEW_TITLE, REVIEW_IMG ,REVIEW_V_NUM FROM BOOK_REVIEW_BOARD WHERE STATUS=1 AND DELETE_N=0";
	
	
	//리스트 clear
	public void ClearList();
	//영화 리스트
	public void MovieList();
	//매장 리스트
	public void ShopList();
	//온라인 리스트
	public void OnlineList();
	//도서 리스트
	public void BookList();
	//리스트 반환
	public List<PotalMainDto> getAllList();
}
