package com.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.book.dto.BookCategoryDto;
import com.movie.dto.MovieCategoryDto;

public class BookCategoryDaoImpl implements BookCategoryDao {
	
	public List<MovieCategoryDto> categoryselectAll(Connection con){
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<BookCategoryDto> res = new ArrayList<BookCategoryDto>();
		
		try {
			pstm = con.prepareStatement(categoryselectAllSql);
			System.out.println("03.query 준비: " + categoryselectAllSql);
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}
		
		return null;
	}

}
