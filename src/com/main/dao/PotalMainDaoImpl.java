package com.main.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.main.dto.PotalMainDto;
import static common.JDBCTemplate.*;

public class PotalMainDaoImpl implements PotalMainDao {

	private static List<PotalMainDto> allList = new ArrayList<PotalMainDto>();
	
	@Override
	public void MovieList() {
		Connection con = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		PotalMainDto dto = null;
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(movieReviewAll);
			//REVIEW_ID, NICKNAME, REVIEW_TITLE, REVIEW_IMG, REVIEW_V_NUM 
			while(rs.next()) {
				dto = new PotalMainDto();
				dto.setBigCategory("영화");
				dto.setBoardNo(rs.getInt(1));
				dto.setNickname(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setReviewImg(rs.getString(4));
				dto.setView(rs.getInt(5));
				
				allList.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(con);
		}
		
	}

	@Override
	public void ClearList() {
		allList.clear();
		return;
	}

	
	@Override
	public List<PotalMainDto> getAllList() {
		return allList;
	}

	
	
}
