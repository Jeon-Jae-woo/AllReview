package com.book.dto;



public class BookCategoryDto {
	private int book_type;
	private String book_type_name;
	
	public BookCategoryDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BookCategoryDto(int book_type, String book_type_name) {
		super();
		this.book_type = book_type;
		this.book_type_name = book_type_name;
	}
	
	public int getBook_type() {
		return book_type;
	}
	
	public void setBook_type(int book_type) {
		this.book_type = book_type;
	}
	
	public String getBook_type_name() {
		return book_type_name;
	}
	
	public void setBook_type_name(String book_type_name) {
		this.book_type_name = book_type_name;
	}
	
	
}
