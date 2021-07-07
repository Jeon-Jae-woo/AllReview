package com.online.dto;

import java.sql.Date;

public class onlineDto {
	private int online_board_id;    //글번호
	private String nickname;
	private int category_id;
	private int category_detail_id;
	private String online_title;
	private String online_content;
	private double price_sat;
	private double product_sat;
	private int add_receipt;
	private int add_product;
	private Date createat;
	private Date pudateat;
	private int status;
	private int delete_n;
	private int recomd;
	private int hits;
	
	//평점평균
	private double satavg = (price_sat+product_sat)/2;
	
	//기본생성자
	public onlineDto() {
		super();
	}
	//
	
	
	
	//전체생성자
	public onlineDto(int online_board_id, String nickname, int category_id, int category_detail_id, String online_title,
			String online_content, double price_sat, double product_sat, int add_receipt, int add_product,
			Date createat, Date pudateat, int status, int delete_n, int recomd, int hits) {
		super();
		this.online_board_id = online_board_id;
		this.nickname = nickname;
		this.category_id = category_id;
		this.category_detail_id = category_detail_id;
		this.online_title = online_title;
		this.online_content = online_content;
		this.price_sat = price_sat;
		this.product_sat = product_sat;
		this.add_receipt = add_receipt;
		this.add_product = add_product;
		this.createat = createat;
		this.pudateat = pudateat;
		this.status = status;
		this.delete_n = delete_n;
		this.recomd = recomd;
		this.hits = hits;
	}


	public int getOnline_board_id() {
		return online_board_id;
	}


	public void setOnline_board_id(int online_board_id) {
		this.online_board_id = online_board_id;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public int getCategory_id() {
		return category_id;
	}


	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}


	public int getCategory_detail_id() {
		return category_detail_id;
	}


	public void setCategory_detail_id(int category_detail_id) {
		this.category_detail_id = category_detail_id;
	}


	public String getOnline_title() {
		return online_title;
	}


	public void setOnline_title(String online_title) {
		this.online_title = online_title;
	}


	public String getOnline_content() {
		return online_content;
	}


	public void setOnline_content(String online_content) {
		this.online_content = online_content;
	}


	public double getPrice_sat() {
		return price_sat;
	}


	public void setPrice_sat(double price_sat) {
		this.price_sat = price_sat;
	}


	public double getProduct_sat() {
		return product_sat;
	}


	public void setProduct_sat(double product_sat) {
		this.product_sat = product_sat;
	}


	public int getAdd_receipt() {
		return add_receipt;
	}


	public void setAdd_receipt(int add_receipt) {
		this.add_receipt = add_receipt;
	}


	public int getAdd_product() {
		return add_product;
	}


	public void setAdd_product(int add_product) {
		this.add_product = add_product;
	}


	public Date getCreateat() {
		return createat;
	}


	public void setCreateat(Date createat) {
		this.createat = createat;
	}


	public Date getPudateat() {
		return pudateat;
	}


	public void setPudateat(Date pudateat) {
		this.pudateat = pudateat;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public int getDelete_n() {
		return delete_n;
	}


	public void setDelete_n(int delete_n) {
		this.delete_n = delete_n;
	}


	public int getRecomd() {
		return recomd;
	}


	public void setRecomd(int recomd) {
		this.recomd = recomd;
	}


	public int getHits() {
		return hits;
	}


	public void setHits(int hits) {
		this.hits = hits;
	}



	public double getSatavg() {
		return (price_sat+product_sat)/2;
	}



	public void setSatavg(double satavg) {
		this.satavg = satavg;
	}
	
}
