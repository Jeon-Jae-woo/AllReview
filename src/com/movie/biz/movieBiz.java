package com.movie.biz;

import java.sql.Connection;
import java.util.List;

import com.movie.dto.MovieBoardDto;
import com.movie.dto.MovieCategoryDto;
import com.movie.dto.MovieReviewDto;
import com.user.dto.pagingDto;

public interface movieBiz {
	
	// ------------------1페이지 영화메인--------------
	//카테고리 연결
	public List<MovieCategoryDto> categoryselectAll();
	
	//영화목록 조회
	public List<MovieBoardDto> movieselectAll(int category, int pageNum);
	
	//페이징
	public pagingDto movieListPaging(int pageNum, int category);
	
	//영화 리뷰 리스트
	public List<MovieReviewDto> reviewListService(int movie_id, int pageNum);
	public pagingDto movieReviewPaging(int pageNum, int movie_id);
	
	//영화등록 버튼 및 작성
	public boolean movieinsert(MovieBoardDto dto);
	//영화등록한거 삭제
	
	
	
	//-----------------2페이지 영화 기본정보및 리뷰리스트----------
	
	
	// 영화 기본정보조회
	public MovieBoardDto movieselectOne(int movie_id);
	
	
	//리뷰리스트 조회
	
	
	//리뷰작성 버튼 작성
	public int ReviewInsertService(MovieReviewDto dto);
	
	//-----------------3페이지 리뷰 상세조회-------------------
	
	//리뷰 상세조회
	public MovieReviewDto reviewSelectService(int review_id);
	
	//리뷰수정
	public int reviewUpdateService(MovieReviewDto dto);
	
	//리뷰 삭제
	public int reviewDeleteService(String nickname, int review_id);

}
