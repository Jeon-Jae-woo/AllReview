package com.shop.biz;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.shop.dao.ShopDao;
import com.shop.dto.ShopCateDto;
import com.shop.dto.ShopDto;
import com.shop.dto.ShopGroupDto;
import com.user.dto.pagingDto;

public class ShopBiz {
	
	private ShopDao dao = new ShopDao();
	
	
	
	public List<ShopDto> selectAll(int pageNum, int category_no){
		Connection con = getConnection();
		
		List<ShopDto> list = dao.selectAll(con, pageNum, category_no);
		
		close(con);
		
		return list;
	}
	
	public List<ShopDto> hitTop(){
		Connection con = getConnection();
		
		List<ShopDto> list = dao.hitTop(con);
		
		close(con);
		
		return list;
	}
	public List<ShopDto> recoTop(){
		Connection con = getConnection();
		
		List<ShopDto> list = dao.recoTop(con);
		
		close(con);
		
		return list;
	}
	
	
	public List<ShopDto> ShopSearch(int pageNum, int category_no, String search){
		Connection con = getConnection();
		
		List<ShopDto> list = dao.ShopSearch(con, pageNum, category_no, search);
		
		close(con);
		
		
		return list;
	}
	
	
	public pagingDto ShopPaging(int pageNum, int category_no) {
		Connection con = getConnection();
		int size = dao.ShopTotalCount(con, category_no);
		pagingDto paging = new pagingDto();
		paging.setPageNum(pageNum);
		paging.setItemCount(16);
		paging.setTotalCount(size);
		paging.pagination();
		
		close(con);
		
		return paging;
	}
	
	

	
	
	
	public ShopDto selectOne(int shopno) {
		Connection con = getConnection();
		
		ShopDto dto = dao.selectOne(con, shopno);
		
		close(con);
		
		
		return dto;
	}
	
	
	
	
	
	
	public int insert(ShopDto dto) {
		Connection con = getConnection();
		
		int res = dao.insert(con, dto);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		
		
		
		
		return res;
	}
	 
	
	public int delete(int shopno) {
		Connection con = getConnection();
		
		int res = dao.delete(con, shopno);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return res;
	}
	
	public ShopCateDto selectCate(int cate_no) {
		Connection con = getConnection();
		
		ShopCateDto cateDto = dao.selectCate(con, cate_no);
		
		close(con);
		
		return cateDto;
	}
	
	public ShopGroupDto selectGroup(int group_no) {
		Connection con = getConnection();
		
		ShopGroupDto groupDto = dao.selectGroup(con, group_no);
		
		close(con);
		
		return groupDto;
		
		
	}
	
	public int update(ShopDto dto) {
		Connection con = getConnection();
		
		int res = dao.update(con, dto);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		
		
		return res;
	}
	
	public int inserthit(int shopno, String nickname) {
		Connection con = getConnection();
		
		int res = dao.inserthit(con,shopno,nickname);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return res;
	}
	
	public void updatehit(int shopno) {
		Connection con = getConnection();
		
		int res = dao.updatehit(con, shopno);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		
	}
	
	public int insertreco(int shopno, String nickname) {
		Connection con = getConnection();
		
		int res = dao.insertreco(con,shopno,nickname);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return res;
	}
	
	
	public void updatereco(int shopno) {
		Connection con = getConnection();
		
		int res = dao.updatereco(con,shopno);
		
		if(res>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		
	}
	
	
	
	
	
}
