package com.shop.dto;

public class ShopCateDto {
	private int cateId;
	private String cateName;

	public ShopCateDto() {
		super();
	}

	public ShopCateDto(int cateId, String cateName) {
		super();
		this.cateId = cateId;
		this.cateName = cateName;
	}

	public ShopCateDto(int cateId) {
		super();
		this.cateId = cateId;
	}

	public int getCateId() {
		return cateId;
	}

	public void setCateId(int cateId) {
		this.cateId = cateId;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	
	
}
