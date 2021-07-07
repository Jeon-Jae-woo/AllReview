package com.movie.dao;

import java.sql.Connection;
import java.util.List;

import com.movie.dto.MovieCategoryDto;

public interface MovieCategoryDao {
	//영화 카테고리
	String categoryselectAllSql = "SELECT * FROM MOVIE_CATEGORY ORDER BY MOVIE_TYPE ASC";
	
	public List<MovieCategoryDto> categoryselectAll(Connection con);
	

}
