package com.shop.dto;

import java.util.Date;

public class ShopDto {
	private int shopno;
	private String nickname;
	private int cate_no;
	private int group_no;
	private String title;
	private String content;
	private double service;
	private double clean;
	private double traffic;
	private String revisit;
	private int hit;
	private int reco;
	private int recipt;
	private int status;
	private Date createat;
	private Date updateat;
	private int delete;
	
	public ShopDto() {
		super();
	}

	public ShopDto(int shopno, String nickname, int cate_no, int group_no, String title, String content, double service,
			double clean, double traffic, String revisit, int hit, int reco, int recipt, int status, Date createat,
			Date updateat, int delete) {
		super();
		this.shopno = shopno;
		this.nickname = nickname;
		this.cate_no = cate_no;
		this.group_no = group_no;
		this.title = title;
		this.content = content;
		this.service = service;
		this.clean = clean;
		this.traffic = traffic;
		this.revisit = revisit;
		this.hit = hit;
		this.reco = reco;
		this.recipt = recipt;
		this.status = status;
		this.createat = createat;
		this.updateat = updateat;
		this.delete = delete;
	}
	
	
	
	

	public ShopDto(int shopno, int group_no, String content, double service, double clean, double traffic,
			String revisit) {
		super();
		this.shopno = shopno;
		this.group_no = group_no;
		this.content = content;
		this.service = service;
		this.clean = clean;
		this.traffic = traffic;
		this.revisit = revisit;
	}

	public ShopDto(String nickname, int cate_no, int group_no, String title, String content, double service, double clean,
			double traffic, String revisit) {
		super();
		this.nickname = nickname;
		this.cate_no = cate_no;
		this.group_no = group_no;
		this.title = title;
		this.content = content;
		this.service = service;
		this.clean = clean;
		this.traffic = traffic;
		this.revisit = revisit;
	}

	public int getShopno() {
		return shopno;
	}

	public void setShopno(int shopno) {
		this.shopno = shopno;
	}

	public String getnickname() {
		return nickname;
	}

	public void setnickname(String nickname) {
		this.nickname = nickname;
	}

	public int getCate_no() {
		return cate_no;
	}

	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public double getService() {
		return service;
	}

	public void setService(double service) {
		this.service = service;
	}

	public double getClean() {
		return clean;
	}

	public void setClean(double clean) {
		this.clean = clean;
	}

	public double getTraffic() {
		return traffic;
	}

	public void setTraffic(double traffic) {
		this.traffic = traffic;
	}

	public String getRevisit() {
		return revisit;
	}

	public void setRevisit(String revisit) {
		this.revisit = revisit;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getReco() {
		return reco;
	}

	public void setReco(int reco) {
		this.reco = reco;
	}

	public int getRecipt() {
		return recipt;
	}

	public void setRecipt(int recipt) {
		this.recipt = recipt;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getCreateat() {
		return createat;
	}

	public void setCreateat(Date createat) {
		this.createat = createat;
	}

	public Date getUpdateat() {
		return updateat;
	}

	public void setUpdateat(Date updateat) {
		this.updateat = updateat;
	}

	public int getDelete() {
		return delete;
	}

	public void setDelete(int delete) {
		this.delete = delete;
	}
	
	
	
	
}
