package com.online.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.online.dto.onlineDto;


public class onlineDaoImpl implements onlineDao {

	
	//카테고리별 게시판 리스트
	@Override
	public List<onlineDto> selectListCate(Connection con, int category_id, int pageNum) {
		PreparedStatement pstm = null;
		ResultSet res = null;
		List<onlineDto> list = new ArrayList<onlineDto>();
		onlineDto dto = null;
		
		System.out.println("page : " + pageNum);
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		
		System.out.println("startRow : " + startRow);
		System.out.println("end : " + endRow);
		
		try {
			pstm = con.prepareStatement(selectAllCate);
			pstm.setInt(1, category_id);
			pstm.setInt(2, endRow);
			pstm.setInt(3, startRow);
			
			res = pstm.executeQuery();
			
			if(res.next()) {
			while(res.next()) {
				dto = new onlineDto();
				dto.setOnline_board_id(res.getInt(2));
				dto.setNickname(res.getString(3));
				dto.setCategory_id(res.getInt(4));
				dto.setOnline_title(res.getString(5));
				dto.setPrice_sat(res.getDouble(6));
				dto.setProduct_sat(res.getDouble(7));
				dto.setSatavg();
				dto.setRecomd(res.getInt(8));
				dto.setHits(res.getInt(9));
				dto.setCategory_name(res.getString(10));
				
				list.add(dto);
			}
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(res);
			close(pstm);
		}
		

		return list;
	}

	@Override
	public int OnlineRowCount(int category) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		int count = 0;
		try {
			pstm = con.prepareStatement(onlineRowQuery);
			pstm.setInt(1, category);
			
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

	//단일 게시글 조회
	@Override
	public onlineDto selectOneBoard(Connection con, int board_id) {
		PreparedStatement pstm = null;
		onlineDto dto = null;
		ResultSet res = null;
		
		try {
			pstm = con.prepareStatement(onlineSelectQuery);
			pstm.setInt(1, board_id);
			
			res = pstm.executeQuery();
			
			//SELECT ONLINE_BOARD_ID, NICKNAME, OB.CATEGORY_ID, ONLINE_TITLE, ONLINE_CONTENT, 
			//PRICE_SAT,PRODUCT_SAT, ADD_RECEIPT, CREATEAT, STATUS, RECOMD,HITS ,CATEGORY_NAME
					
			while(res.next()) {
				dto = new onlineDto();
				dto.setOnline_board_id(res.getInt(1));
				dto.setNickname(res.getString(2));
				dto.setCategory_id(res.getInt(3));
				dto.setOnline_title(res.getString(4));
				dto.setOnline_content(res.getString(5));
				dto.setPrice_sat(res.getDouble(6));
				dto.setProduct_sat(res.getDouble(7));
				dto.setAdd_receipt(res.getInt(8)); //영수증
				dto.setCreateat(res.getDate(9));
				dto.setStatus(res.getInt(10));
				dto.setRecomd(res.getInt(11));
				dto.setHits(res.getInt(12));
				dto.setCategory_name(res.getString(13));
				dto.setAdd_product(res.getInt(14)); // 상품사진
				dto.setSatavg();
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(res);
			close(pstm);
		}
		
		return dto;
	}

	//게시글 수정
	@Override
	public int updateOnlineBoard(Connection con, onlineDto dto) {
		PreparedStatement pstm = null;
		int result = 0;
		
		try {
			pstm = con.prepareStatement(onlineUpdateQuery);
			
			//ONLINE_TITLE=?, ONLINE_CONTENT=?, PRICE_SAT=?, PRODUCT_SAT=?, 
			//		ADD_PRODUCT=?, UPDATEAT=SYSDATE WHERE ONLINE_BOARD_ID=? AND NICKNAME=?";
			pstm.setString(1, dto.getOnline_title());
			pstm.setString(2, dto.getOnline_content());
			pstm.setDouble(3, dto.getPrice_sat());
			pstm.setDouble(4, dto.getProduct_sat());
			pstm.setInt(5, dto.getAdd_product()); //첨부 사진
			pstm.setInt(6, dto.getOnline_board_id());
			pstm.setString(7, dto.getNickname());
			
			result = pstm.executeUpdate();
			
			if(result>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		return result;
	}

	//게시글 삭제
	@Override
	public int deleteOnlineBoard(Connection con, int board_id, String nickname) {
		PreparedStatement pstm= null;
		int result = 0;
		
		try {
			pstm = con.prepareStatement(onlineDeleteQuery);
			pstm.setInt(1, board_id);
			pstm.setString(2, nickname);
			
			result = pstm.executeUpdate();
			
			if(result>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		return result;
	}

	//글 등록
	@Override
	public int insertOnlineBoard(Connection con, onlineDto dto) {
		PreparedStatement pstm = null;
		int result = 0;
		
		try {
			pstm = con.prepareStatement(onlineWriteQuery);
			//"INSERT INTO ONLINE_BOARD VALUES(ONLINE_BOARD_ID.NEXTVAL, ?,?,?,?,?,?,?,?,SYSDATE,SYSDATE,0,0,0,0)";
			//--닉네임, 카테고리 번호, 제목, 내용, price, product, receipt, product add, 
			pstm.setString(1, dto.getNickname());
			pstm.setInt(2, dto.getCategory_id());
			pstm.setString(3, dto.getOnline_title());
			pstm.setString(4, dto.getOnline_content());
			pstm.setDouble(5, dto.getPrice_sat());
			pstm.setDouble(6, dto.getProduct_sat());
			pstm.setInt(7, dto.getAdd_receipt());
			pstm.setInt(8, dto.getAdd_product());
			
			result = pstm.executeUpdate();
			
			if(result>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		return result;
	}
	

}
