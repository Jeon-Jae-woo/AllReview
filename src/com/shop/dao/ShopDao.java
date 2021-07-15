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

	public List<ShopDto> selectAll(Connection con, int pageNum, int category_no) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ShopDto> res = new ArrayList<ShopDto>();

		String sql = "SELECT RNUM, STT.* FROM( SELECT ROWNUM AS RNUM, ST.* FROM( SELECT * FROM SHOP_TB WHERE STATUS=1 AND DELETES=0 AND CATEGORY_NO=? ORDER BY SHOP_NO DESC) ST WHERE ROWNUM<?) STT WHERE RNUM>=?"; 
		
		int startRow = (pageNum-1)*16+1;
		int endRow = pageNum*16+1;
		
		// AND RECIPT=1 넣기
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, category_no);
			pstm.setInt(2, endRow);
			pstm.setInt(3, startRow);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");

			while (rs.next()) {
				ShopDto tmp = new ShopDto(rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7),
						rs.getString(8), rs.getDouble(9), rs.getDouble(10), rs.getDouble(11), rs.getString(12),
						rs.getInt(13), rs.getInt(14), rs.getInt(15), rs.getInt(16), rs.getDate(17), rs.getDate(18),
						rs.getInt(19), rs.getString(20), rs.getString(21));

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
	
	public List<ShopDto> hitTop(Connection con){
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ShopDto> res = new ArrayList<ShopDto>();
		
		String sql = " SELECT * FROM SHOP_TB ORDER BY HIT DESC ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				ShopDto tmp = new ShopDto(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5),
						rs.getString(6), rs.getDouble(7), rs.getDouble(8), rs.getDouble(9), rs.getString(10),
						rs.getInt(11), rs.getInt(12), rs.getInt(13), rs.getInt(14), rs.getDate(15), rs.getDate(16),
						rs.getInt(17), rs.getString(18), rs.getString(19));
				
				res.add(tmp);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}
	
	public List<ShopDto> recoTop(Connection con){
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ShopDto> res = new ArrayList<ShopDto>();
		
		String sql = " SELECT * FROM SHOP_TB ORDER BY RECO DESC ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				ShopDto tmp = new ShopDto(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5),
						rs.getString(6), rs.getDouble(7), rs.getDouble(8), rs.getDouble(9), rs.getString(10),
						rs.getInt(11), rs.getInt(12), rs.getInt(13), rs.getInt(14), rs.getDate(15), rs.getDate(16),
						rs.getInt(17), rs.getString(18), rs.getString(19));
				
				res.add(tmp);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}
	
	public List<ShopDto> ShopSearch(Connection con, int pageNum, int category_no, String search) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ShopDto> res = new ArrayList<ShopDto>();

		String sql = "SELECT RNUM, STT.* FROM( SELECT ROWNUM AS RNUM, ST.* FROM( SELECT * FROM SHOP_TB WHERE STATUS=1 AND DELETES=0 AND TITLE LIKE ? AND CATEGORY_NO=? ORDER BY SHOP_NO DESC) ST WHERE ROWNUM<?) STT WHERE RNUM>=?"; 
		
		int startRow = (pageNum-1)*16+1;
		int endRow = pageNum*16+1;
		
		// AND RECIPT=1 넣기
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, search);
			pstm.setInt(2, category_no);
			pstm.setInt(3, endRow);
			pstm.setInt(4, startRow);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");

			while (rs.next()) {
				ShopDto tmp = new ShopDto(rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7),
						rs.getString(8), rs.getDouble(9), rs.getDouble(10), rs.getDouble(11), rs.getString(12),
						rs.getInt(13), rs.getInt(14), rs.getInt(15), rs.getInt(16), rs.getDate(17), rs.getDate(18),
						rs.getInt(19), rs.getString(20), rs.getString(21));

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
	
	public int ShopTotalCount(Connection con, int category_no) {
		int count = 0;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		String sql = "SELECT COUNT(*) FROM SHOP_TB WHERE STATUS=1 AND DELETES=0 AND CATEGORY_NO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, category_no);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return count;
	}


	public ShopDto selectOne(Connection con, int shopno) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ShopDto res = null;

		String sql = " SELECT * FROM SHOP_TB WHERE SHOP_NO=? AND DELETES=0 ";
		// AND RECIPT=1 넣기
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, shopno);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");

			if (rs.next()) {
				res = new ShopDto(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5),
						rs.getString(6), rs.getDouble(7), rs.getDouble(8), rs.getDouble(9), rs.getString(10),
						rs.getInt(11), rs.getInt(12), rs.getInt(13), rs.getInt(14), rs.getDate(15), rs.getDate(16),
						rs.getInt(17), rs.getString(18), rs.getString(19));

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

		String sql = " INSERT INTO SHOP_TB VALUES(SHOPSQ.NEXTVAL,?,?,?,?,?,?,?,?,?,0,0,0,0,SYSDATE,SYSDATE,0,?,?) ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getNickname());
			pstm.setInt(2, dto.getCate_no());
			pstm.setInt(3, dto.getGroup_no());
			pstm.setString(4, dto.getTitle());
			pstm.setString(5, dto.getContent());
			pstm.setDouble(6, dto.getService());
			pstm.setDouble(7, dto.getClean());
			pstm.setDouble(8, dto.getTraffic());
			pstm.setString(9, dto.getRevisit());
			pstm.setString(10, dto.getRecipt_img());
			pstm.setString(11, dto.getUpload_img());

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

		String sql = " UPDATE SHOP_TB SET DELETES=1 WHERE SHOP_NO=?";

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

			if (rs.next()) {
				res = new ShopCateDto(rs.getInt(1), rs.getString(2));

			}

		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
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

			if (rs.next()) {
				res = new ShopGroupDto(rs.getInt(1), rs.getString(2));

			}

		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
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
		} finally {
			close(pstm);
			System.out.println("05. db 종료 \n");
		}

		return res;
	}

	public int inserthit(Connection con, int shopno, String nickname) {
		PreparedStatement pstm = null;
		int res = 0;

		String sql = " INSERT INTO SHOP_HIT VALUES(HITSQ.NEXTVAL,?,?) ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, nickname);
			pstm.setInt(2, shopno);
			System.out.println("03. query 준비: " + sql);

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

	public int updatehit(Connection con, int shopno) {
		PreparedStatement pstm = null;
		int res = 0;

		String sql = " UPDATE SHOP_TB SET HIT=HIT+1 WHERE SHOP_NO=? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, shopno);
			System.out.println("03. query 준비: " + sql);

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

	public int insertreco(Connection con, int shopno, String nickname) {
		PreparedStatement pstm = null;
		int res = 0;

		String sql = " INSERT INTO SHOP_RECO VALUES(RECOSQ.NEXTVAL,?,?) ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, nickname);
			pstm.setInt(2, shopno);
			System.out.println("03. query 준비 : " + sql);

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");

		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			System.out.println("05. db 종료\n");
		}

		return res;
	}
	
	
	public int updatereco(Connection con, int shopno) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE SHOP_TB SET RECO=RECO+1 WHERE SHOP_NO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, shopno);
			System.out.println("03. query 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			System.out.println("05. db 종료\n");
		}
		
		
		return res;
	}
	
	
	
	
	
	
	
	
	

}
