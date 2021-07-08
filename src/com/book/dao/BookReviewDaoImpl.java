package com.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.book.dto.BookBoardDto;
import com.book.dto.BookReviewDto;
import com.movie.dto.MovieReviewDto;

public class BookReviewDaoImpl implements BookReviewDao{
	
	public List<MovieReviewDto> reviewselectAll(Connection con){
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<BookReviewDto> res = new ArrayList<BookReviewDto>();
		try {
			pstm = con.prepareStatement(reviewselectAll);
			System.out.println("03.query 준비: " + reviewselectAll);
		
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return null;
		
	}
	public BookReviewDto reviewselectOne(Connection con, int review_id) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		BookBoardDto res = null;
		
		try {
			pstm = con.prepareStatement(reviewselectOneSql);
			pstm.setInt(1, review_id);
			System.out.println("03.query 준비: "+ reviewselectOneSql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}
	public boolean reviewinsert(Connection con,BookReviewDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		try {
			pstm = con.prepareStatement(reviewinsertSql);
			pstm.setInt(1, dto.getReview_id());
			pstm.setString(2,dto.getNickname());
			pstm.setInt(3, dto.getBook_id());
			pstm.setString(4, dto.getReview_title());
			pstm.setString(5, dto.getReview_content());
			pstm.setInt(6, dto.getBook_grade());
			pstm.setInt(7, dto.getReview_r_num());
			pstm.setInt(8, dto.getReview_v_num());
			pstm.setString(9,dto.getReview_img());
	//		pstm.setDate(10, dto.getRcreateat());
	//		pstm.setDate(11,dto.getRupdateat());
			pstm.setInt(12,dto.getRdelete());
			pstm.setInt(13, dto.getStatus());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	public boolean reviewupdate(Connection con,BookReviewDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm=con.prepareStatement(reviewupdateSql);
			pstm.setString(1, dto.getReview_title());
			pstm.setString(2, dto.getReview_content());
			pstm.setInt(3, dto.getBook_id());
			System.out.println("03.query 준비: "+ reviewupdateSql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}
		
		return (res>0);
	}
	public boolean reviewdelete(Connection con, int review_id ) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(reviewdeleteSql);
			pstm.setInt(1, review_id);
			System.out.println("03.query 준비: " +reviewdeleteSql);
		
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}
		return (res>0)?true:false;
		
		
	}

}
