package com.movie.biz;

import java.sql.Connection;
import java.util.List;
import static common.JDBCTemplate.*;

import com.movie.dao.MovieBoardDao;
import com.movie.dao.MovieBoardDaoImpl;
import com.movie.dto.MovieBoardDto;

public class MovieBizImple implements MovieBiz{
	
	private MovieBoardDao dao = new MovieBoardDaoImpl();

	@Override
	public List<MovieBoardDto> movieselectAll() {
		
		Connection con = getConnection();
		
		List<MovieBoardDto> list = dao.movieselectAll(con);
		
		close(con);
		
		return list;
	}

	@Override
	public MovieBoardDto movieselectOne(int movie_id) {
		
		Connection con = getConnection();
		
		MovieBoardDto dto = dao.movieselectOne(con, movie_id);
		
		close(con);
		
		return dto;
	}

}
