package com.shop.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shop.dto.ShopCateDto;
import com.shop.dto.ShopDto;
import com.shop.dto.ShopGroupDto;

public class ShopDao {

	public List<ShopDto> selectAll(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ShopDto> res = new ArrayList<ShopDto>();

		String sql = " SELECT * FROM SHOP_TB ORDER BY SHOP_NO DESC ";

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");

			while (rs.next()) {
				ShopDto tmp = new ShopDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),
										  rs.getString(5),rs.getString(6),rs.getDouble(7),rs.getDouble(8),
										  rs.getDouble(9),rs.getString(10),rs.getInt(11),rs.getInt(12),
										  rs.getInt(13),rs.getInt(14),rs.getDate(15),rs.getDate(16),rs.getInt(17));

				res.add(tmp);
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
	

	public ShopDto selectOne(Connection con, int shopno) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ShopDto res = null;

		String sql = " SELECT * FROM SHOP_TB WHERE SHOP_NO=? AND STATUS=1 AND DELETES=0";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, shopno);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");

			if (rs.next()) {
				res = new ShopDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),
						  rs.getString(5),rs.getString(6),rs.getDouble(7),rs.getDouble(8),
						  rs.getDouble(9),rs.getString(10),rs.getInt(11),rs.getInt(12),
						  rs.getInt(13),rs.getInt(14),rs.getDate(15),rs.getDate(16),rs.getInt(17));

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

	public int insert(Connection con, ShopDto dto) {
		PreparedStatement pstm = null;
		int res = 0;

		String sql = " INSERT INTO SHOP_TB VALUES(SHOPSQ.NEXTVAL,?,?,?,?,?,?,?,?,?,0,0,0,1,SYSDATE,SYSDATE,0) ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getnickname());
			pstm.setInt(2, dto.getCate_no());
			pstm.setInt(3, dto.getGroup_no());
			pstm.setString(4, dto.getTitle());
			pstm.setString(5, dto.getContent());
			pstm.setDouble(6, dto.getService());
			pstm.setDouble(7, dto.getClean());
			pstm.setDouble(8, dto.getTraffic());
			pstm.setString(9, dto.getRevisit());
			
			System.out.println("03. query 준비:" + sql);

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");

		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			System.out.println("05. db 종료\n");
		}

		return res;
	}

	public int delete(Connection con, int shopno) {
		PreparedStatement pstm = null;
		int res = 0;

		String sql = " DELETE FROM SHOP_TB WHERE SHOPNO=? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, shopno);
			System.out.println("03. query 준비: " + sql);

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");

		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
			System.out.println("05. db 종료\n");
		}

		return res;
	}

	
	  public ShopCateDto selectCate(Connection con, int cate_no) {
		  PreparedStatement pstm = null;
		  ResultSet rs = null;
		  ShopCateDto res = null;
		  
		  String sql = " SELECT * FROM SHOP_CATE WHERE CATEGORY_ID=? ";
		  
		  try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, cate_no);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			if(rs.next()) {
				res = new ShopCateDto(rs.getInt(1),rs.getString(2));
				
			}
			
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		  
		  return res;
	  }
	  
	  public ShopGroupDto selectGroup(Connection con, int group_no) {
		  PreparedStatement pstm = null;
		  ResultSet rs = null;
		  ShopGroupDto res = null;
		  
		  String sql = " SELECT * FROM SHOP_GROUP WHERE GROUP_ID=? ";
		  
		  try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, group_no);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			if(rs.next()) {
				res = new ShopGroupDto(rs.getInt(1),rs.getString(2));
				
			}
			
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		  
		  return res;
	  }
	 
	  public int update(Connection con, ShopDto dto) {
		  PreparedStatement pstm = null;
		  int res = 0;
		  
		  String sql = " UPDATE SHOP_TB SET UPDATEAT=SYSDATE, CONTENT=?, SERVICE=?, CLEAN=?, TRAFFIC=?, GROUP_NO=?, REVISIT=? WHERE SHOP_NO=?";
		  
		  try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getContent());
			pstm.setDouble(2, dto.getService());
			pstm.setDouble(3, dto.getClean());
			pstm.setDouble(4, dto.getTraffic());
			pstm.setInt(5, dto.getGroup_no());
			pstm.setString(6, dto.getRevisit());
			pstm.setInt(7, dto.getShopno());
			System.out.println("03. query 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			
			
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(pstm);
			System.out.println("05. db 종료 \n");
		}
		  
		  
		  
		  
		  
		  
		  return res;
	  }
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  

}
