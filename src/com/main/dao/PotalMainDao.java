package com.main.dao;

import java.util.List;

import com.main.dto.PotalMainDto;

public interface PotalMainDao {

	//영화 
	String movieReviewAll = "SELECT REVIEW_ID, NICKNAME, REVIEW_TITLE, REVIEW_IMG, REVIEW_V_NUM FROM MOVIE_REVIEW WHERE STATUS_NO=1 AND DELETE_N=0;";
	
	
	//리스트 clear
	public void ClearList();
	
	//영화 리스트
	public void MovieList();
	
	//리스트 반환
	public List<PotalMainDto> getAllList();
}
