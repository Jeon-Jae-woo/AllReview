package com.user.dto;

import java.util.Date;

public class adminUserDto {
	private String email;
	private String nickname;
	private int levelNo;
	private int statusNo;
	private Date createdAt;
	private String levelName;
	private String statusName;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getLevelNo() {
		return levelNo;
	}
	public void setLevelNo(int levelNo) {
		this.levelNo = levelNo;
	}
	public int getStatusNo() {
		return statusNo;
	}
	public void setStatusNo(int statusNo) {
		this.statusNo = statusNo;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public String getLevelName() {
		return levelName;
	}
	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	
	
	@Override
	public String toString() {
		return "adminUserDto [email=" + email + ", nickname=" + nickname + ", levelNo=" + levelNo + ", statusNo="
				+ statusNo + ", createdAt=" + createdAt + ", levelName=" + levelName + ", statusName=" + statusName
				+ "]";
	}
	
	
	
}
