package com.online.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.online.dto.onlineDto;


public class onlineDaoImpl implements onlineDao {

	@Override
	public List<onlineDto> selectAll(Connection con) {
		
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<onlineDto> res = new ArrayList<onlineDto>();
		
		try {
			pstm = con.prepareStatement(selectAllSql);
			System.out.println("03.query 준비: " + selectAllSql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				onlineDto tmp = new onlineDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getDouble(7),rs.getDouble(8),
												rs.getInt(9),rs.getInt(10),rs.getDate(11),rs.getDate(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16));
				res.add(tmp);
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	@Override
	public onlineDto selectOne(Connection con, int online_board_id) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		onlineDto res = null;
		
		try {
			pstm = con.prepareStatement(selectOneSql);
			pstm.setInt(1, online_board_id);
			System.out.println("03. query 준비: " + selectOneSql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			if(rs.next()) {
				res = new onlineDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),
						rs.getString(6),rs.getDouble(7),rs.getDouble(8),rs.getInt(9),rs.getInt(10),
						rs.getDate(11),rs.getDate(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16));
			}
			
			
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}

	@Override
	public boolean insert(Connection con, onlineDto dto) {
		return false;
	}

	@Override
	public boolean update(Connection con, onlineDto dto) {
		return false;
	}

	@Override
	public boolean delete(Connection con, int online_board_id) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(deleteSql);
			pstm.setInt(1, online_board_id);
			System.out.println("03.query 준비: " + deleteSql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		return (res>0)?true:false;
	}
	
	
	
	////////////////////////여기부터 쭉 카테고리
	
	
	
	@Override
	public List<onlineDto> selectFashion(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<onlineDto> res = new ArrayList<onlineDto>();
		
		try {
			pstm = con.prepareStatement(selectfashionSql);
			System.out.println("03.query 준비: " + selectfashionSql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				onlineDto tmp = new onlineDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getDouble(7),rs.getDouble(8),
						rs.getInt(9),rs.getInt(10),rs.getDate(11),rs.getDate(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16));
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	@Override
	public List<onlineDto> selectBeauty(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<onlineDto> res = new ArrayList<onlineDto>();
		
		try {
			pstm = con.prepareStatement(selectbeautySql);
			System.out.println("03.query 준비: " + selectbeautySql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				onlineDto tmp = new onlineDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getDouble(7),rs.getDouble(8),
						rs.getInt(9),rs.getInt(10),rs.getDate(11),rs.getDate(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16));
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	@Override
	public List<onlineDto> selectFood(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<onlineDto> res = new ArrayList<onlineDto>();
		
		try {
			pstm = con.prepareStatement(selectfoodSql);
			System.out.println("03.query 준비: " + selectfoodSql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				onlineDto tmp = new onlineDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getDouble(7),rs.getDouble(8),
						rs.getInt(9),rs.getInt(10),rs.getDate(11),rs.getDate(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16));
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	@Override
	public List<onlineDto> selectHome(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<onlineDto> res = new ArrayList<onlineDto>();
		
		try {
			pstm = con.prepareStatement(selecthomeSql);
			System.out.println("03.query 준비: " + selecthomeSql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				onlineDto tmp = new onlineDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getDouble(7),rs.getDouble(8),
						rs.getInt(9),rs.getInt(10),rs.getDate(11),rs.getDate(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16));
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	@Override
	public List<onlineDto> selectDigital(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<onlineDto> res = new ArrayList<onlineDto>();
		
		try {
			pstm = con.prepareStatement(selectdigitalSql);
			System.out.println("03.query 준비: " + selectdigitalSql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				onlineDto tmp = new onlineDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getDouble(7),rs.getDouble(8),
						rs.getInt(9),rs.getInt(10),rs.getDate(11),rs.getDate(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16));
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	@Override
	public List<onlineDto> selectAppliances(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<onlineDto> res = new ArrayList<onlineDto>();
		
		try {
			pstm = con.prepareStatement(selectappliancesSql);
			System.out.println("03.query 준비: " + selectappliancesSql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				onlineDto tmp = new onlineDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getDouble(7),rs.getDouble(8),
						rs.getInt(9),rs.getInt(10),rs.getDate(11),rs.getDate(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16));
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	@Override
	public List<onlineDto> selectChildcare(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<onlineDto> res = new ArrayList<onlineDto>();
		
		try {
			pstm = con.prepareStatement(selectchildcareSql);
			System.out.println("03.query 준비: " + selectchildcareSql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				onlineDto tmp = new onlineDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getDouble(7),rs.getDouble(8),
						rs.getInt(9),rs.getInt(10),rs.getDate(11),rs.getDate(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16));
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	@Override
	public List<onlineDto> selectMedical(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<onlineDto> res = new ArrayList<onlineDto>();
		
		try {
			pstm = con.prepareStatement(selectmedicalSql);
			System.out.println("03.query 준비: " + selectmedicalSql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				onlineDto tmp = new onlineDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getDouble(7),rs.getDouble(8),
						rs.getInt(9),rs.getInt(10),rs.getDate(11),rs.getDate(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16));
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	@Override
	public List<onlineDto> selectHobby(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<onlineDto> res = new ArrayList<onlineDto>();
		
		try {
			pstm = con.prepareStatement(selecthobbySql);
			System.out.println("03.query 준비: " + selecthobbySql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				onlineDto tmp = new onlineDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getDouble(7),rs.getDouble(8),
						rs.getInt(9),rs.getInt(10),rs.getDate(11),rs.getDate(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16));
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	@Override
	public List<onlineDto> selectSports(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<onlineDto> res = new ArrayList<onlineDto>();
		
		try {
			pstm = con.prepareStatement(selectsportsSql);
			System.out.println("03.query 준비: " + selectsportsSql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				onlineDto tmp = new onlineDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getDouble(7),rs.getDouble(8),
						rs.getInt(9),rs.getInt(10),rs.getDate(11),rs.getDate(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16));
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	@Override
	public List<onlineDto> selectPet(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<onlineDto> res = new ArrayList<onlineDto>();
		
		try {
			pstm = con.prepareStatement(selectpetSql);
			System.out.println("03.query 준비: " + selectpetSql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				onlineDto tmp = new onlineDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getDouble(7),rs.getDouble(8),
						rs.getInt(9),rs.getInt(10),rs.getDate(11),rs.getDate(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16));
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	@Override
	public List<onlineDto> selectCar(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<onlineDto> res = new ArrayList<onlineDto>();
		
		try {
			pstm = con.prepareStatement(selectcarSql);
			System.out.println("03.query 준비: " + selectcarSql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				onlineDto tmp = new onlineDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getDouble(7),rs.getDouble(8),
						rs.getInt(9),rs.getInt(10),rs.getDate(11),rs.getDate(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16));
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	

}
