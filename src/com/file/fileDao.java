package com.file;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class fileDao {

	public int fileInsert(fileDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int result = 0;
		
		String insertSQL = "INSERT INTO TEST_IMG VALUES(NOTICESEQ.NEXTVAL, ?,?,?)";
		
		try {
			pstm = con.prepareStatement(insertSQL);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getImgName());
			pstm.setString(3, dto.getImgName2());
			
			result = pstm.executeUpdate();
			
			if(result>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return result;
	}
	
	
}
