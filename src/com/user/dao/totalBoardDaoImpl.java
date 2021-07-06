package com.user.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.user.dto.totalBoardDto;

public class totalBoardDaoImpl implements totalBoardDao {

	//매장
	@Override
	public List<totalBoardDto> userShopBoardList(String nickname, int pageNum) {
		List<totalBoardDto> totalBoardList = new ArrayList<totalBoardDto>();
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		totalBoardDto totalboard = null;
		
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		
		try {
			pstm = con.prepareStatement(offlineWriteQuery);
			pstm.setString(1, nickname);
			pstm.setInt(2, endRow);
			pstm.setInt(3, startRow);
			rs = pstm.executeQuery();
			while(rs.next()) {
				totalboard = new totalBoardDto();
				totalboard.setBoardNo(rs.getInt(2));
				totalboard.setCategoryNo(rs.getInt(3));
				totalboard.setCategoryName(rs.getString(4));
				totalboard.setTitle(rs.getString(5));
				totalboard.setCreateAt(rs.getDate(6));
				
				totalBoardList.add(totalboard);
			}	
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		return totalBoardList;
	}

	
	//영화
	@Override
	public List<totalBoardDto> userMovieBoardList(String nickname, int pageNum) {
		List<totalBoardDto> totalBoardList = new ArrayList<totalBoardDto>();
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		totalBoardDto totalboard = null;
		
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		
		try {
			pstm = con.prepareStatement(movieWriteQuery);
			pstm.setString(1, nickname);
			pstm.setInt(2, endRow);
			pstm.setInt(3, startRow);
			rs = pstm.executeQuery();
			while(rs.next()) {
				totalboard = new totalBoardDto();
				totalboard.setBoardNo(rs.getInt(2));
				totalboard.setCategoryNo(rs.getInt(3));
				totalboard.setCategoryName(rs.getString(4));
				totalboard.setTitle(rs.getString(5));
				totalboard.setCreateAt(rs.getDate(6));
				
				totalBoardList.add(totalboard);
			}	
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		return totalBoardList;
	}

	//책
	@Override
	public List<totalBoardDto> userBookBoardList(String nickname, int pageNum) {
		List<totalBoardDto> totalBoardList = new ArrayList<totalBoardDto>();
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		totalBoardDto totalboard = null;
		
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		
		try {
			pstm = con.prepareStatement(bookWriteQuery);
			pstm.setString(1, nickname);
			pstm.setInt(2, endRow);
			pstm.setInt(3, startRow);
			rs = pstm.executeQuery();
			while(rs.next()) {
				totalboard = new totalBoardDto();
				totalboard.setBoardNo(rs.getInt(2));
				totalboard.setCategoryNo(rs.getInt(3));
				totalboard.setCategoryName(rs.getString(4));
				totalboard.setTitle(rs.getString(5));
				totalboard.setCreateAt(rs.getDate(6));
				
				totalBoardList.add(totalboard);
			}	
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		return totalBoardList;
	}

	//온라인
	@Override
	public List<totalBoardDto> userOnlineBoardList(String nickname, int pageNum) {
		List<totalBoardDto> totalBoardList = new ArrayList<totalBoardDto>();
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		totalBoardDto totalboard = null;
		
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		
		try {
			pstm = con.prepareStatement(onlineWriteQuery);
			pstm.setString(1, nickname);
			pstm.setInt(2, endRow);
			pstm.setInt(3, startRow);
			rs = pstm.executeQuery();
			while(rs.next()) {
				totalboard = new totalBoardDto();
				totalboard.setBoardNo(rs.getInt(2));
				totalboard.setCategoryNo(rs.getInt(3));
				totalboard.setCategoryName(rs.getString(4));
				totalboard.setTitle(rs.getString(5));
				totalboard.setCreateAt(rs.getDate(6));
				
				totalBoardList.add(totalboard);
			}	
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		return totalBoardList;
	}
	

	//ROW 수 반환
	@Override
	public int totalShopRowCount(String nickname) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		int count = 0;
		try {
			pstm = con.prepareStatement(selectRowShopCount);
			pstm.setString(1, nickname);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}

		return count;
	}


	@Override
	public int totalMovieRowCount(String nickname) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		int count = 0;
		try {
			pstm = con.prepareStatement(selectRowMovieCount);
			pstm.setString(1, nickname);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}

		return count;
	}


	@Override
	public int totalBookRowCount(String nickname) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		int count = 0;
		try {
			pstm = con.prepareStatement(selectRowBookCount);
			pstm.setString(1, nickname);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}

		return count;
	}



	@Override
	public int totalOnlineRowCount(String nickname) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		int count = 0;
		try {
			pstm = con.prepareStatement(selectRowOnlineCount);
			pstm.setString(1, nickname);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}

		return count;
	}



}
