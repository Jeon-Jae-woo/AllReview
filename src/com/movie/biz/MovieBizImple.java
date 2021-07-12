package com.movie.biz;

import java.sql.Connection;
import java.util.List;
import static common.JDBCTemplate.*;

import com.movie.dao.MovieBoardDao;
import com.movie.dao.MovieBoardDaoImpl;
import com.movie.dao.MovieCategoryDao;
import com.movie.dao.MovieCategoryDaoImpl;
import com.movie.dto.MovieBoardDto;
import com.movie.dto.MovieCategoryDto;
import com.movie.dto.MovieReviewDto;
import com.user.dto.pagingDto;

public class MovieBizImple implements movieBiz{
	
	private MovieBoardDao movievBoardDao = new MovieBoardDaoImpl();
	private MovieCategoryDao movievCategoryDao = new MovieCategoryDaoImpl();

	
	@Override
	public List<MovieCategoryDto> categoryselectAll() {
		
		Connection con = getConnection();
		
		List<MovieCategoryDto> moiveListCate = movievCategoryDao.categoryselectAll(con);
		
		close(con);
		
		return moiveListCate;
	}
	
	//카테고리별 영화 목록
	@Override
	public List<MovieBoardDto> movieselectAll(int category, int pageNum) {
		
		Connection con = getConnection();
		
		List<MovieBoardDto> list = movievBoardDao.movieselectAll(con, category, pageNum);
		
		close(con);
		
		return list;
	}
	
	@Override
	public boolean movieinsert(MovieBoardDto dto) {
		Connection con = getConnection();
		
		boolean res = movievBoardDao.movieinsert(con, dto);
		
		if(res) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
					
		return res;
	}


	@Override
	public MovieBoardDto movieselectOne(int movie_id) {
		
		Connection con = getConnection();
		
		MovieBoardDto dto = movievBoardDao.movieselectOne(con, movie_id);
		
		close(con);
		
		return dto;
	}

	
	
	//목록 조회 페이징
	@Override
	public pagingDto movieListPaging(int pageNum, int category) {
		pagingDto paging = new pagingDto();
		paging.setPageNum(pageNum);
		paging.setItemCount(8);
		int size = 0;
		size = movievBoardDao.MovieRowCount(category);
		
		paging.setTotalCount(size);
		paging.pagination();
		
		return paging;
	}

	//리뷰 리스트
	@Override
	public List<MovieReviewDto> reviewListService(int movie_id, int pageNum) {
		Connection con = getConnection();
		List<MovieReviewDto> list = movievBoardDao.reviewList(con, movie_id, pageNum);
		close(con);
		return list;
	}

	//리뷰 리스트 페이징
	@Override
	public pagingDto movieReviewPaging(int pageNum, int movie_id) {
		pagingDto paging = new pagingDto();
		paging.setPageNum(pageNum);
		paging.setItemCount(5);
		int size = 0;
		size = movievBoardDao.MovieRowCount(movie_id);

		paging.setTotalCount(size);
		paging.pagination();
		
		return paging;
		
	}

	//리뷰 등록
	@Override
	public int ReviewInsertService(MovieReviewDto dto) {
		Connection con = getConnection();
		int result = movievBoardDao.reviewInsert(con, dto);
		
		return result;
	}

	//리뷰 조회
	@Override
	public MovieReviewDto reviewSelectService(int review_id) {
		Connection con = getConnection();
		MovieReviewDto dto = movievBoardDao.reviewSelect(con, review_id);
		close(con);
		return dto;
	}

	//리뷰 수정
	@Override
	public int reviewUpdateService(MovieReviewDto dto) {
		Connection con = getConnection();
		int result = movievBoardDao.reviewUpdate(con, dto);
		close(con);
		return result;
	}

	//리뷰 삭제
	@Override
	public int reviewDeleteService(String nickname, int review_id) {
		Connection con = getConnection();
		int result = movievBoardDao.reviewDelete(con, nickname, review_id);
		close(con);
		return result;
	}

}
