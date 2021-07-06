package com.movie.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.movie.dto.MovieBoardDto;
import static common.JDBCTemplate.*;

public class MovieBoardDaoImpl implements MovieBoardDao{

	@Override
	public List<MovieBoardDto> movieselectAll(Connection con) {
		
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MovieBoardDto> res = new ArrayList<MovieBoardDto>();
		
		try {
			
//			if(제목순) {
//				pstm = con.prepareStatement(selectAllSql1);
//				System.out.println("03.query 준비: " + selectAllSql);
//				
//				rs = pstm.executeQuery();
//				System.out.println("04.query 실행 및 리턴");
//			}
//			else if(추천순) {
//				pstm = con.prepareStatement(selectAllSql2);
//				System.out.println("03.query 준비: " + selectAllSql);
//				
//				rs = pstm.executeQuery();
//				System.out.println("04.query 실행 및 리턴");
//			}
//			else if(조회순) {
//				pstm = con.prepareStatement(selectAllSql3);
//				System.out.println("03.query 준비: " + selectAllSql);
//				
//				rs = pstm.executeQuery();
//				System.out.println("04.query 실행 및 리턴");
//			}
			
			pstm = con.prepareStatement(movieselectAllSql);
			System.out.println("03.query 준비: " + movieselectAllSql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			while(rs.next()) {
				MovieBoardDto mbd = new MovieBoardDto(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getInt(6),rs.getString(7),rs.getDate(8), rs.getDate(9));
				
				res.add(mbd);
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
	public MovieBoardDto movieselectOne(Connection con, int movie_id) {
		
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MovieBoardDto res = null;
		
		try {
			pstm = con.prepareStatement(movieselectOneSql);
			pstm.setInt(1, movie_id);
			System.out.println("03.query 준비: " + movieselectOneSql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			if(rs.next()) {
				res = new MovieBoardDto(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7),rs.getDate(8),rs.getDate(9));
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
	public boolean movieinsert(Connection con, MovieBoardDto dto) {
		
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(movieinsertSql);
			pstm.setInt(1, dto.getMovie_type());
			pstm.setString(2, dto.getMovie_title());
			pstm.setString(3, dto.getDirector());
			pstm.setString(4, dto.getActor());
			pstm.setInt(5, dto.getParticipant());
			pstm.setString(6, dto.getMovie_img());
			pstm.setDate(7, dto.getCreateat());
			pstm.setDate(8, dto.getUpdateat());
			System.out.println("03.query 준비: " + movieinsertSql);
			
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
	public boolean movieupdate(Connection con, MovieBoardDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(movieupdateSql);
			pstm.setString(2, dto.getMovie_title());
			pstm.setString(3, dto.getDirector());
			pstm.setString(4, dto.getActor());
			pstm.setInt(5, dto.getParticipant());
			System.out.println("03.query 준비:" + movieupdateSql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			System.out.println("05.db 종료\n");
		}
		return (res>0)?true:false;
	}

	@Override
	public boolean moviedelete(Connection con, int movie_id) {
		PreparedStatement pstm =null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(moviedeleteSql);
			pstm.setInt(1, movie_id);
			System.out.println("03.query 준비:" + moviedeleteSql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			System.out.println("05.db종료/n");
		}
		return (res>0)?true:false;
	}

}
