package com.book.dto;

import java.util.Date;

public class BookBoardDto {
	private int book_id;
	private int book_type;
	private String book_title;
	private String writer;
	private String publisher;
	private String book_img;
	private Date creatat;
	private Date updateat;
	private int bdelete;
	private String book_type_name;
	
	public BookBoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	//쓰지마셈
	public BookBoardDto(int book_id, int book_type, String book_title, String writer, String publisher, String book_img,
			Date creatat, Date updateat, int bdelete) {
		super();
		this.book_id = book_id;
		this.book_type = book_type;
		this.book_title = book_title;
		this.writer = writer;
		this.publisher = publisher;
		this.book_img = book_img;
		this.creatat = creatat;
		this.updateat = updateat;
		this.bdelete = bdelete;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getBook_type() {
		return book_type;
	}
	public void setBook_type(int book_type) {
		this.book_type = book_type;
	}
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getBook_img() {
		return book_img;
	}
	public void setBook_img(String book_img) {
		this.book_img = book_img;
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
	public int getBdelete() {
		return bdelete;
	}
	public void setBdelete(int bdelete) {
		this.bdelete = bdelete;
	}
	
	public String getBook_type_name() {
		return book_type_name;
	}
	public void setBook_type_name(String book_type_name) {
		this.book_type_name = book_type_name;
	}
	
	
	

}
