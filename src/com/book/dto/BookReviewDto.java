package com.book.dto;

import java.util.Date;

public class BookReviewDto {
	private int review_id;
	private String nickname;
	private int book_id;
	private String review_title;
	private String review_content;
	private int book_grade;
	private int review_r_num;
	private int review_v_num;
	private String review_img;
	private Date rcreateat;
	private Date rupdateat;
	private int rdelete;
	private int status;
	private String receipt;
	
	public BookReviewDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookReviewDto(int review_id, String nickname, int book_id, String review_title, String review_content,
			int book_grade, int review_r_num, int review_v_num, String review_img, Date rcreateat, Date rupdateat,
			int rdelete, int status, String receipt) {
		super();
		this.review_id = review_id;
		this.nickname = nickname;
		this.book_id = book_id;
		this.review_title = review_title;
		this.review_content = review_content;
		this.book_grade = book_grade;
		this.review_r_num = review_r_num;
		this.review_v_num = review_v_num;
		this.review_img = review_img;
		this.rcreateat = rcreateat;
		this.rupdateat = rupdateat;
		this.rdelete = rdelete;
		this.status = status;
		this.receipt = receipt;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getBook_grade() {
		return book_grade;
	}
	public void setBook_grade(int book_grade) {
		this.book_grade = book_grade;
	}
	public int getReview_r_num() {
		return review_r_num;
	}
	public void setReview_r_num(int review_r_num) {
		this.review_r_num = review_r_num;
	}
	public int getReview_v_num() {
		return review_v_num;
	}
	public void setReview_v_num(int review_v_num) {
		this.review_v_num = review_v_num;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public Date getRcreateat() {
		return rcreateat;
	}
	public void setRcreateat(Date rcreateat) {
		this.rcreateat = rcreateat;
	}
	public Date getRupdateat() {
		return rupdateat;
	}
	public void setRupdateat(Date rupdateat) {
		this.rupdateat = rupdateat;
	}
	public int getRdelete() {
		return rdelete;
	}
	public void setRdelete(int rdelete) {
		this.rdelete = rdelete;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getReceipt() {
		return receipt;
	}
	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}
	
	
	
	

}
