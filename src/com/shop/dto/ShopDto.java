package com.shop.dto;

import java.util.Date;

public class ShopDto {
	private int shopno;
	private String writer;
	private String title;
	private String content;
	private double service;
	private double clean;
	private double traffic;
	private String revisit;
	private String selgroup;
	private Date regdate;
	
	
	public ShopDto() {
		super();
	}


	public ShopDto(int shopno, String writer, String title, String content, double service, double clean,
			double traffic, String revisit, String selgroup, Date regdate) {
		super();
		this.shopno = shopno;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.service = service;
		this.clean = clean;
		this.traffic = traffic;
		this.revisit = revisit;
		this.selgroup = selgroup;
		this.regdate = regdate;
	}


	public int getShopno() {
		return shopno;
	}


	public void setShopno(int shopno) {
		this.shopno = shopno;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
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


	public String getSelgroup() {
		return selgroup;
	}


	public void setSelgroup(String selgroup) {
		this.selgroup = selgroup;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
}
