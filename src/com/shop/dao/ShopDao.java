package com.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shop.dto.ShopDto;

import static common.JDBCTemplate.*;

public class ShopDao {
	
	public List<ShopDto> selectAll(Connection con){
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ShopDto> res = new ArrayList<ShopDto>();
		
		String sql = " SELECT * FROM SHOP_TB ORDER BY SHOPNO DESC ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 以�鍮�: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query �떎�뻾 諛� 由ы꽩");
			
			while(rs.next()) {
				ShopDto tmp = new ShopDto(rs.getInt(1), rs.getString(2), rs.getString(3),
										  rs.getString(4), rs.getDouble(5), rs.getDouble(6),
										  rs.getDouble(7), rs.getString(8), rs.getString(9), rs.getDate(10));
				
				res.add(tmp);
			}
			
			
		} catch (SQLException e) {
			System.out.println("3/4 �떒怨� �뿉�윭"+ res);
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			System.out.println("05. db 醫낅즺\n");
		}
		
		
		
		return res;
	}
	
	
	
	
}
