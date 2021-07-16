package com.online.dto;

import java.sql.Date;

public class onlineDto {
	private int online_board_id;    //글번호
	private String nickname;
	private int category_id;
	private String online_title;
	private String online_content;
	private double price_sat;
	private double product_sat;
	private String add_receipt;
	private String add_product;
	private Date createat;
	private Date pudateat;
	private int status;
	private int delete_n;
	private int recomd;
	private int hits;
	private String category_name;
	
	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	//평점평균
	private double satavg = (price_sat+product_sat)/2;
	
	//기본생성자
	public onlineDto() {
		super();
	}
	
	//전체생성자
	public onlineDto(int online_board_id, String nickname, int category_id, String online_title,
			String online_content, double price_sat, double product_sat, String add_receipt, String add_product,
			Date createat, Date pudateat, int status, int delete_n, int recomd, int hits) {
		super();
		this.online_board_id = online_board_id;
		this.nickname = nickname;
		this.category_id = category_id;
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


	public String getAdd_receipt() {
		return add_receipt;
	}


	public void setAdd_receipt(String add_receipt) {
		this.add_receipt = add_receipt;
	}


	public String getAdd_product() {
		return add_product;
	}


	public void setAdd_product(String add_product) {
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
		return this.satavg;
	}



	public void setSatavg() {
		this.satavg = (this.price_sat+ this.product_sat)/2;
	}
	
}
