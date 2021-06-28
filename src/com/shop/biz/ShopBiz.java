package com.shop.biz;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.shop.dao.ShopDao;
import com.shop.dto.ShopDto;

public class ShopBiz {
	
	private ShopDao dao = new ShopDao();
	
	
	
	public List<ShopDto> selectAll(){
		Connection con = getConnection();
		
		List<ShopDto> list = dao.selectAll(con);
		
		close(con);
		
		return list;
	}
	
	
	
}
