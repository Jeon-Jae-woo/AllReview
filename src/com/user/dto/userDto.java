package com.user.dto;

import java.util.Date;

public class userDto {
	
	private String email;
	private String nickName;
	private int levelNo;
	private String name;
	private String password;
	private String birth;
	private String gender;
	private String address;
	private Date createdAt;
	private Date updatedAt;
	private int statusNo;
	
	public userDto() {
		super();
	}
	

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getLevelNo() {
		return levelNo;
	}
	public void setLevelNo(int levelNo) {
		this.levelNo = levelNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public int getStatusNo() {
		return statusNo;
	}
	public void setStatusNo(int statusNo) {
		this.statusNo = statusNo;
	}


	@Override
	public String toString() {
		return "userDto [email=" + email + ", nickName=" + nickName + ", levelNo=" + levelNo + ", name=" + name
				+ ", password=" + password + ", birth=" + birth + ", gender=" + gender + ", address=" + address
				+ ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + ", statusNo=" + statusNo + "]";
	}
	
	
	
}
