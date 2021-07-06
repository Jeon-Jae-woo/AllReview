package com.movie.biz;

import java.util.List;

import com.movie.dto.MovieBoardDto;

public interface MovieBiz {
	
	// ------------------1페이지 영화메인--------------
	
	//영화목록 조회
	public List<MovieBoardDto> movieselectAll();
	
	//영화등록 버튼 및 작성
	
	
	//영화등록한거 삭제
	
	
	//-----------------2페이지 영화 기본정보및 리뷰리스트----------
	
	
	// 영화 기본정보조회
	public MovieBoardDto movieselectOne(int movie_id);
	
	
	//리뷰리스트 조회
	
	
	//리뷰작성 버튼 작성
	
	
	//-----------------3페이지 리뷰 상세조회-------------------
	
	//리뷰 상세조회
	
	
	//리뷰수정
	
	//리뷰 삭제

}
