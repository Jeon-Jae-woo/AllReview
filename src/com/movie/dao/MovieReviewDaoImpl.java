package com.movie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.movie.dto.MovieReviewDto;
import static common.JDBCTemplate.*;

public class MovieReviewDaoImpl implements MovieReviewDao{

	@Override
	public List<MovieReviewDto> reviewselectAll(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MovieReviewDto> res = new ArrayList<MovieReviewDto>();
		
		try {
			pstm = con.prepareStatement(reviewselectAllSql);
			System.out.println("03.query 준비: " + reviewselectAllSql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			while(rs.next()) {
				MovieReviewDto mrd = new MovieReviewDto(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getInt(11),rs.getDate(12),rs.getDate(13));
				
				res.add(mrd);
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

	@Override
	public MovieReviewDto reviewselectOne(Connection con, int review_id) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MovieReviewDto res = null;
		
		try {
			pstm = con.prepareStatement(reviewselectOneSql);
			pstm.setInt(1, review_id);
			System.out.println("03.query 준비: " + reviewselectOneSql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			if(rs.next()) {
				res = new MovieReviewDto(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getInt(11),rs.getDate(12),rs.getDate(13));
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

	@Override
	public boolean reviewinsert(Connection con, MovieReviewDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(reviewinsertSql);
			pstm.setString(1, dto.getReview_title());
			pstm.setInt(2, dto.getMovie_id());
			pstm.setString(3, dto.getReview_content());
			pstm.setString(4, dto.getReview_img());
			pstm.setInt(5, dto.getMovie_grade());
			System.out.println("03.query 준비: " + reviewinsertSql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			System.out.println("05.db종료\n");
		}
		return (res>0)?true:false;
	}
	
	@Override
	public boolean reviewupdate(Connection con, MovieReviewDto dto) {
	PreparedStatement pstm = null;
	int res = 0;
	
	try {
		pstm = con.prepareStatement(reviewupdateSql);
		pstm.setString(1, dto.getReview_title());
		pstm.setInt(2, dto.getMovie_id());
		pstm.setString(3, dto.getReview_content());
		pstm.setString(4, dto.getReview_img());
		pstm.setInt(5, dto.getMovie_grade());
		System.out.println("03.query 준비: " + reviewupdateSql);
		
		res = pstm.executeUpdate();
		System.out.println("04.query 실행 및 리턴");	
		
	} catch (SQLException e) {
		System.out.println("3/4단계 에러");
		e.printStackTrace();
	}finally {
		close(pstm);
		System.out.println("05.db종료\n");
		}
		return (res>0)?true:false;
	}


	@Override
	public boolean reviewdelete(Connection con, int review_id) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(reviewdeleteSql);
			pstm.setInt(1, review_id);
			System.out.println("03.query 준비: " + reviewdeleteSql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			System.out.println("05.db종료\n");
		}
		return (res>0)?true:false;
	}


}
