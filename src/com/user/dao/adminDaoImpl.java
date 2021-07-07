package com.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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

}
