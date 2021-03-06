package com.user.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.user.dto.totalBoardDto;

public class totalBoardDaoImpl implements totalBoardDao {

	//๋งค์ฅ
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

	
	//์ํ
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

	//์ฑ
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

	//์จ๋ผ์ธ
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
	

	//ROW ์ ๋ฐํ
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


	//์น์ธ ๋๊ธฐ์ค์ธ ๋งค์ฅ ๊ธ
	@Override
	public List<totalBoardDto> waitShopBoardList(int pageNum, int status) {
		List<totalBoardDto> totalBoardList = new ArrayList<totalBoardDto>();
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		totalBoardDto totalboard = null;
		
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		
		try {
			pstm = con.prepareStatement(offlineWaitQuery);
			pstm.setInt(1, status);
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


	//์ํ
	@Override
	public List<totalBoardDto> waitMovieBoardList(int pageNum, int status) {
		List<totalBoardDto> totalBoardList = new ArrayList<totalBoardDto>();
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		totalBoardDto totalboard = null;
		
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		
		try {
			pstm = con.prepareStatement(movieWaitQuery);
			pstm.setInt(1, status);
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


	//์ฑ
	@Override
	public List<totalBoardDto> waitBookBoardList(int pageNum, int status) {
		List<totalBoardDto> totalBoardList = new ArrayList<totalBoardDto>();
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		totalBoardDto totalboard = null;
		
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		
		try {
			pstm = con.prepareStatement(bookWaitQuery);
			pstm.setInt(1, status);
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


	@Override
	public List<totalBoardDto> waitOnlineBoardList(int pageNum, int status) {
		List<totalBoardDto> totalBoardList = new ArrayList<totalBoardDto>();
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		totalBoardDto totalboard = null;
		
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		
		try {
			pstm = con.prepareStatement(onlineWaitQuery);
			pstm.setInt(1, status);
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


	//๋งค์ฅ ๋๊ธฐ์ค ๊ธ ์นด์ดํธ
	@Override
	public int totalShopWaitCount(int status) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		int count = 0;
		try {
			pstm = con.prepareStatement(offlineWaitCount);
			pstm.setInt(1, status);
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
		
	

	//์ํ ๋๊ธฐ์ค์ธ ๊ธ ์นด์ดํธ
	@Override
	public int totalMovieWaitCount(int status) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		int count = 0;
		try {
			pstm = con.prepareStatement(movieWaitCount);
			pstm.setInt(1, status);
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
	public int totalBookWaitCount(int status) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		int count = 0;
		try {
			pstm = con.prepareStatement(bookWaitCount);
			pstm.setInt(1, status);
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
	public int totalOnlineWaitCount(int status) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		int count = 0;
		try {
			pstm = con.prepareStatement(onlineWaitCount);
			pstm.setInt(1, status);
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


	//์น์ธ ์ํ ์ฒ๋ฆฌ
	//๋งค์ฅ
	@Override
	public int OfflineStatusProcessing(int status, int review_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int result = 0;
		
		try {
			pstm = con.prepareStatement(offlineStatusPc);
			pstm.setInt(1, status);
			pstm.setInt(2, review_id);
			
			result = pstm.executeUpdate();
			
			if(result > 0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return result;
	}

	//์ํ ์ํ ์ฒ๋ฆฌ
	@Override
	public int MovieStatusProcessing(int status, int review_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int result = 0;
		
		try {
			pstm = con.prepareStatement(movieStatusPc);
			pstm.setInt(1, status);
			pstm.setInt(2, review_id);
			
			result = pstm.executeUpdate();
			
			if(result > 0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return result;
	}


	//์ฑ ์ํ ์ฒ๋ฆฌ
	@Override
	public int BookStatusProcessing(int status, int review_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int result = 0;
		
		try {
			pstm = con.prepareStatement(bookStatusPc);
			pstm.setInt(1, status);
			pstm.setInt(2, review_id);
			
			result = pstm.executeUpdate();
			
			if(result > 0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return result;
	}

	//์จ๋ผ์ธ ์ํ ์ฒ๋ฆฌ
	@Override
	public int OnlineStatusProcessing(int status, int review_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int result = 0;
		
		try {
			pstm = con.prepareStatement(onlineStatusPc);
			pstm.setInt(1, status);
			pstm.setInt(2, review_id);
			
			result = pstm.executeUpdate();
			
			if(result > 0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return result;
	}



}
