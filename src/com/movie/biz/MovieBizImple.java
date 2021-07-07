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

public class MovieBizImple implements MovieBiz{
	
	private MovieBoardDao movievBoardDao = new MovieBoardDaoImpl();
	private MovieCategoryDao movievCategoryDao = new MovieCategoryDaoImpl();

	@Override
	public List<MovieCategoryDto> categoryselectAll() {
		
		Connection con = getConnection();
		
		List<MovieCategoryDto> moiveListCate = movievCategoryDao.categoryselectAll(con);
		
		close(con);
		
		return moiveListCate;
	}
	
	@Override
	public List<MovieBoardDto> movieselectAll() {
		
		Connection con = getConnection();
		
		List<MovieBoardDto> list = movievBoardDao.movieselectAll(con);
		
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



	
}
