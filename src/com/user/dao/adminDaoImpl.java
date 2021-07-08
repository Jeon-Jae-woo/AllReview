package com.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.user.dto.adminUserDto;
import com.user.dto.userDto;

import static common.JDBCTemplate.*;


public class adminDaoImpl implements adminDao {

	//회원 목록 조회
	@Override
	public List<userDto> allUserList(int pageNum) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<userDto> userList = new ArrayList<userDto>();
		userDto dto = null;
		
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		
		try {
			pstm = con.prepareStatement(userAllList);
			pstm.setInt(1, endRow);
			pstm.setInt(2, startRow);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				dto = new userDto();
				dto.setEmail(rs.getString(2));
				dto.setNickName(rs.getString(3));
				dto.setCreatedAt(rs.getDate(4));
				
				userList.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}

		return userList;
	}

	//회원 row 조회
	@Override
	public int totaluserCount() {
		Connection con = getConnection();
		Statement stmt = null;
		int count = 0;
		
		try {
			stmt = con.createStatement();
			count = stmt.executeUpdate(userAllCount);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(stmt);
			close(con);
		}
		return count;
	}

	//단일 유저 정보 조회
	@Override
	public adminUserDto userdetail(String email) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		adminUserDto userdto = null;
		
		try {
			pstm = con.prepareStatement(userDetailQuery);
			pstm.setString(1, email);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				userdto = new adminUserDto();
				userdto.setEmail(rs.getString(1));
				userdto.setNickname(rs.getString(2));
				userdto.setLevelNo(rs.getInt(3));
				userdto.setStatusNo(rs.getInt(4));
				userdto.setCreatedAt(rs.getDate(5));
				userdto.setLevelName(rs.getString(6));
				userdto.setStatusName(rs.getString(7));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		
		return userdto;
	}

	//유저 정보 업데이트
	@Override
	public int userUpdate(adminUserDto updateUser) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int result = 0;
		
		System.out.println(updateUser.getStatusNo());
		System.out.println(updateUser.getLevelNo());
		try {
			pstm = con.prepareStatement(userUpdateQuery);
			pstm.setInt(1, updateUser.getLevelNo());
			pstm.setInt(2, updateUser.getStatusNo());
			pstm.setString(3, updateUser.getEmail());
			
			result = pstm.executeUpdate();
			
			if(result>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		return result;
	}

	//admin user 리스트
	@Override
	public List<userDto> adminUserList(int pageNum) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<userDto> userList = new ArrayList<userDto>();
		userDto dto = null;
		
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		
		try {
			pstm = con.prepareStatement(adminAllList);
			pstm.setInt(1, endRow);
			pstm.setInt(2, startRow);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				dto = new userDto();
				dto.setEmail(rs.getString(2));
				dto.setNickName(rs.getString(3));
				dto.setCreatedAt(rs.getDate(4));
				
				userList.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}

		return userList;
	}

	//admin user count
	@Override
	public int totalAdminuserCount() {
		Connection con = getConnection();
		Statement stmt = null;
		int count = 0;
		
		try {
			stmt = con.createStatement();
			count = stmt.executeUpdate(userAllCount);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(stmt);
			close(con);
		}
		return count;
	}

}
