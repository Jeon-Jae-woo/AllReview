package com.shop.dto;

public class ShopGroupDto {
	private int gorupId;
	private String groupName;

	public ShopGroupDto() {
		super();
	}

	public ShopGroupDto(int gorupId, String groupName) {
		super();
		this.gorupId = gorupId;
		this.groupName = groupName;
	}

	public ShopGroupDto(int gorupId) {
		super();
		this.gorupId = gorupId;
	}

	public int getGorupId() {
		return gorupId;
	}

	public void setGorupId(int gorupId) {
		this.gorupId = gorupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	
	
}
