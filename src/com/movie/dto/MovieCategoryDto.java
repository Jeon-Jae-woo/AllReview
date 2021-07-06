package com.movie.dto;

public class MovieCategoryDto {
	
	//필드선언
	private int movie_type;
	private String movie_type_name;
	
	//기본생성자
	public MovieCategoryDto() {
		super();
	}
	
	//매개변수 생성자
	public MovieCategoryDto(int movie_type, String movie_type_name) {
		super();
		this.movie_type = movie_type;
		this.movie_type_name = movie_type_name;
	}

	//getter&setter
	public int getMovie_type() {
		return movie_type;
	}

	public void setMovie_type(int movie_type) {
		this.movie_type = movie_type;
	}

	public String getMovie_type_name() {
		return movie_type_name;
	}

	public void setMovie_type_name(String movie_type_name) {
		this.movie_type_name = movie_type_name;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
