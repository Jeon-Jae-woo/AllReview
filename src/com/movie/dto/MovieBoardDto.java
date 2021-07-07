package com.movie.dto;

import java.sql.Date;

public class MovieBoardDto {
	
	//필드선언
	private int movie_id;
	private int movie_type;
	private String movie_title;
	private String director;
	private String actor;
	private int participant;
	private String movie_img;
	private Date createat;
	private Date updateat;
	
	
	//기본 생성자
	public MovieBoardDto() {
		super();
	}
	
	//매개변수 생성자
	public MovieBoardDto(int movie_id, int movie_type, String movie_title, String director, String actor,
			int participant, String movie_img, Date createat, Date updateat) {
		super();
		this.movie_id = movie_id;
		this.movie_type = movie_type;
		this.movie_title = movie_title;
		this.director = director;
		this.actor = actor;
		this.participant = participant;
		this.movie_img = movie_img;
		this.createat = createat;
		this.updateat = updateat;
		
	}

	//getter&setter
	public int getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}

	public int getMovie_type() {
		return movie_type;
	}

	public void setMovie_type(int movie_type) {
		this.movie_type = movie_type;
	}

	public String getMovie_title() {
		return movie_title;
	}

	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public int getParticipant() {
		return participant;
	}

	public void setParticipant(int participant) {
		this.participant = participant;
	}

	public String getMovie_img() {
		return movie_img;
	}

	public void setMovie_img(String movie_img) {
		this.movie_img = movie_img;
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

	
	

	
	
	
	
	
	
	

}
