package com.main.biz;

import java.util.List;

import com.main.dao.PotalMainDao;
import com.main.dao.PotalMainDaoImpl;
import com.main.dto.PotalMainDto;

public class PotalMainBizImpl implements PotalMainBiz {

	private PotalMainDao dao = new PotalMainDaoImpl();
	
	@Override
	public List<PotalMainDto> PotalMainList() {
		List<PotalMainDto> allList = dao.getAllList();
		
		for(PotalMainDto dto : allList) {
			System.out.println("-----------");
			System.out.println(dto.getBigCategory());
			System.out.println(dto.getTitle());
			System.out.println(dto.getReviewImg());
			System.out.println(dto.getView());
			System.out.println("-----------");
		}
		return allList;
	}

}
