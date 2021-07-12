package com.movie.dto;

import java.sql.Date;

public class MovieReviewDto {
	
	//필드생성
	private int review_id;
	private String nickname;
	private int movie_id;
	private String review_title;
	private String review_content;
	private int movie_grade;
	private int review_r_num;
	private int review_v_num;
	private String review_img;
	private int status_no;
	private int delete_n;
	private Date creatat;
	private Date updateat;
	private String receipt;
	

	//기본생성자
	public MovieReviewDto() {
		super();
	}

	//매개변수 생성자
	public MovieReviewDto(int review_id, String nickname, int movie_id, String review_title, String review_content,
			int movie_grade, int review_r_num, int review_v_num, String review_img,int status_no, int delete_n, 
			Date creatat, Date updateat, String receipt) {
		super();
		this.review_id = review_id;
		this.nickname = nickname;
		this.movie_id = movie_id;
		this.review_title = review_title;
		this.review_content = review_content;
		this.movie_grade = movie_grade;
		this.review_r_num = review_r_num;
		this.review_v_num = review_v_num;
		this.review_img = review_img;
		this.status_no = status_no;
		this.delete_n = delete_n;
		this.creatat = creatat;
		this.updateat = updateat;
		this.receipt = receipt;
	}

	//getter&setter
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

	public int getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
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

	public int getMovie_grade() {
		return movie_grade;
	}

	public void setMovie_grade(int movie_grade) {
		this.movie_grade = movie_grade;
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

	public int getStatus_no() {
		return status_no;
	}

	public void setStatus_no(int status_no) {
		this.status_no = status_no;
	}

	public int getDelete_n() {
		return delete_n;
	}

	public void setDelete_n(int delete_n) {
		this.delete_n = delete_n;
	}
	
	public Date getCreatat() {
		return creatat;
	}

	public void setCreatat(Date creatat) {
		this.creatat = creatat;
	}

	public Date getUpdateat() {
		return updateat;
	}

	public void setUpdateat(Date updateat) {
		this.updateat = updateat;
	}

	public String getReceipt() {
		return receipt;
	}

	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}
	
	
	
	
	

}
