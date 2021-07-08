package com.book.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.book.dto.BookBoardDto;

import oracle.sql.DATE;

public class BookBoardDaoImpl implements BookBoardDao {
	public List<BookBoardDto> bookselectAll(Connection con){
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<BookBoardDto> res = new ArrayList<BookBoardDto>();
		
		try {
			pstm = con.prepareStatement(bookselectAllSql);
			System.out.println("03.query 준비: +");
			
			rs=pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				BookBoardDto bbd = 
						new BookBoardDto(rs.getInt(1),
								rs.getInt(2),
								rs.getString(3),
								rs.getString(4),
								rs.getString(5),
								rs.getString(6),
								rs.getDate(7),
								rs.getDate(8),
								rs.getInt(9));
				
				res.add(bbd);
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return res;
	}
	public boolean bookupdate(Connection con, BookBoardDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(bookupdateSql);
			pstm.setString(3, dto.getBook_title());
			pstm.setString(4, dto.getWriter());
			pstm.setString(5, dto.getPublisher());
			
			System.out.println("03. query 준비: + bookupdateSql");
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
			
		}
		
		
		return (res>0)?true:false;
	}
	public boolean bookdelete(Connection con, int book_id) {
		
		PreparedStatement pstm = null;
		int res = 0;
		try {
			pstm = con.prepareStatement(bookdeleteSql);
			pstm.setInt(1, book_id);
			System.out.println("03.query준비 : " + bookdeleteSql);
		
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		
		}
		return (res>0)?true:false;
		
		
		
		
			
	}

}
