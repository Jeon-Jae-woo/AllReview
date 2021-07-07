package com.movie.dao;

import java.sql.Connection;
import java.util.List;

import com.movie.dto.MovieBoardDto;

public interface MovieBoardDao {

	//영화목록(포스터이미지)조회
	String movieselectAllSql = "SELECT * FROM MOVIE_BOARD ORDER BY MOVIE_ID DESC";
	//영회기본정보 조회(포스터눌렀을때 2페이지)
	String movieselectOneSql = "SELECT * FROM MOVIE_BOARD WHERE MOVIE_ID=?";
	//영화등록
	String movieinsertSql = "INSERT INTO MOVIE_BOARD VALUES(MOVIE_BOARDMOVIE_ID.NEXTVAL,?,?,?,?,?,?,SYSDATE,SYSDATE)";
	//영화등록한거 수정
	String movieupdateSql = "UPDATE MOVIE_BOARD SET MOVIE_TITLE=?, MOVIE_TYPE=?, DIRECTOR=?, ACTOR=?, MOVIE_IMG=? WHERE MOVIE_ID=?";
	//영화 등록한거 삭제
	String moviedeleteSql = "DELETE FROM MOVIE_BOARD WHERE MOVIE_ID=?";
	

	
	public List<MovieBoardDto> movieselectAll(Connection con);
	public MovieBoardDto movieselectOne(Connection con, int movie_id);
	public boolean movieinsert(Connection con, MovieBoardDto dto);
	public boolean movieupdate(Connection con, MovieBoardDto dto);
	public boolean moviedelete(Connection con, int movie_id);
	
}
