package com.movie.dao;

import com.movie.dto.MovieCategoryDto;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MovieCategoryDaoImpl implements MovieCategoryDao{

	@Override
	public List<MovieCategoryDto> categoryselectAll(Connection con) {
		
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MovieCategoryDto> res = new ArrayList<MovieCategoryDto>();
		
		try {
			pstm = con.prepareStatement(categoryselectAllSql);
			System.out.println("03.query 준비: " + categoryselectAllSql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			while(rs.next()) {
				MovieCategoryDto mcd = new MovieCategoryDto(rs.getInt(1), rs.getString(2));
			
			res.add(mcd);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			System.out.println("05.db종료\n");
		}
		return res;
	}

}
