package com.main.dto;

import java.util.Comparator;

public class dtoComparator implements Comparator {

	//조회수 정렬
	@Override
	public int compare(Object o1, Object o2) {
		int view1 = ((PotalMainDto)o1).getView();
		int view2 = ((PotalMainDto)o2).getView();
		
		if(view1>view2) {
			return -2;
		}else if(view1<view2) {
			return 1;
		}else {
			return 0;
		}
	}

}
