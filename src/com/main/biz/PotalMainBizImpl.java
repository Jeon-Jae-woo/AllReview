package com.main.biz;

import java.util.List;

import com.main.dao.PotalMainDao;
import com.main.dao.PotalMainDaoImpl;
import com.main.dto.PotalMainDto;

public class PotalMainBizImpl implements PotalMainBiz {

	private PotalMainDao dao = new PotalMainDaoImpl();
	
	@Override
	public List<PotalMainDto> PotalMainList() {
		dao.ClearList();
		dao.MovieList();
		
		List<PotalMainDto> allList = dao.getAllList();
		
		return allList;
	}

}
