package com.main.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.main.dto.PotalMainDto;
import com.main.dto.dtoComparator;

import static common.JDBCTemplate.*;

public class PotalMainDaoImpl implements PotalMainDao {

	private static List<PotalMainDto> allList = new ArrayList<PotalMainDto>();
	
	@Override
	public void ClearList() {
		allList.clear();
		return;
	}

	@Override
	public List<PotalMainDto> getAllList() {
		this.ClearList();
		this.MovieList();
		this.ShopList();
		this.OnlineList();
		this.BookList();
		Collections.sort(allList, new dtoComparator());
		
		if(allList.size()<10) {
			return allList;
		}else {
			return allList.subList(0, 10);
		}
	}
	
	//영화 리스트
	@Override
	public void MovieList() {
		Connection con = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		PotalMainDto dto = null;
		//
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
	//매장
	@Override
	public void ShopList() {
		Connection con = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		PotalMainDto dto = null;
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(shopReviewAll);
			//REVIEW_ID, NICKNAME, REVIEW_TITLE, REVIEW_IMG, REVIEW_V_NUM 
			while(rs.next()) {
				dto = new PotalMainDto();
				dto.setBigCategory("매장");
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

	//온라인
	@Override
	public void OnlineList() {
		Connection con = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		PotalMainDto dto = null;
		//
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(onlineReviewAll);
			//REVIEW_ID, NICKNAME, REVIEW_TITLE, REVIEW_IMG, REVIEW_V_NUM 
			while(rs.next()) {
				dto = new PotalMainDto();
				dto.setBigCategory("온라인");
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
	//책 리스트
	@Override
	public void BookList() {
		Connection con = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		PotalMainDto dto = null;
		//
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(bookReviewAll);
			//REVIEW_ID, NICKNAME, REVIEW_TITLE, REVIEW_IMG, REVIEW_V_NUM 
			while(rs.next()) {
				dto = new PotalMainDto();
				dto.setBigCategory("도서");
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

	
	
}
