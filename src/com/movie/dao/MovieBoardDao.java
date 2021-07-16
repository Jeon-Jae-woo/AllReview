package com.movie.dao;

import java.sql.Connection;
import java.util.List;

import com.movie.dto.MovieBoardDto;
import com.movie.dto.MovieReviewDto;

public interface MovieBoardDao {

	//영화목록(포스터이미지)조회
	String movieselectAllSql = "SELECT RNUM, MOVIE_ID, MOVIE_TYPE, MOVIE_TITLE, DIRECTOR, ACTOR, MOVIE_IMG, MOVIE_TYPE_NAME FROM (SELECT ROWNUM AS RNUM, MOVIE_ID, MOVIE_TYPE, MOVIE_TITLE, DIRECTOR, ACTOR, MOVIE_IMG, MOVIE_TYPE_NAME FROM (SELECT MOVIE_ID, MB.MOVIE_TYPE, MOVIE_TITLE, DIRECTOR, ACTOR, MOVIE_IMG, MC.MOVIE_TYPE_NAME FROM MOVIE_BOARD MB JOIN MOVIE_CATEGORY MC ON(MB.MOVIE_TYPE=MC.MOVIE_TYPE) WHERE MB.MOVIE_TYPE=?) WHERE ROWNUM<?) WHERE RNUM >=?";
	
	String movieRow = "SELECT COUNT(*) FROM MOVIE_BOARD WHERE MOVIE_TYPE=?";
	
	//영회기본정보 조회(포스터눌렀을때 2페이지)
	String movieselectOneSql = "SELECT MOVIE_ID, MB.MOVIE_TYPE, MOVIE_TITLE, DIRECTOR, ACTOR, MOVIE_IMG, MC.MOVIE_TYPE_NAME FROM MOVIE_BOARD MB JOIN MOVIE_CATEGORY MC ON(MB.MOVIE_TYPE=MC.MOVIE_TYPE) WHERE MOVIE_ID=?";

	//영화 리뷰 리스트(movie_id로 구분)
	String movieReviewList = "SELECT RNUM, REVIEW_ID, NICKNAME, MOVIE_ID, REVIEW_TITLE, MOIVE_GRADE, REVIEW_R_NUM, REVIEW_V_NUM, CREATEAT FROM(SELECT ROWNUM AS RNUM, REVIEW_ID, NICKNAME, MOVIE_ID, REVIEW_TITLE, MOIVE_GRADE, REVIEW_R_NUM, REVIEW_V_NUM, CREATEAT FROM (SELECT REVIEW_ID, NICKNAME, MOVIE_ID, REVIEW_TITLE, MOIVE_GRADE, REVIEW_R_NUM, REVIEW_V_NUM, CREATEAT FROM MOVIE_REVIEW WHERE MOVIE_ID=? AND DELETE_N=0 AND STATUS_NO=1 )WHERE ROWNUM<?) WHERE RNUM >=?";
	String movieReviewRow = "SELECT COUNT(*) FROM MOVIE_REVIEW WHERE MOVIE_ID=? AND DELETE_N=0 AND STATUS_NO=1";
	
	//영회 리뷰 등록
	String reviewInsert = "INSERT INTO MOVIE_REVIEW VALUES(MOVIE_REVIEWSEQ.NEXTVAL,?,?,?,?,?,0,0,?,0,0,SYSDATE,SYSDATE,?)";
	
	//영화 리뷰 글 조회
	String reviewSelectOne = "SELECT review_id, nickname, movie_id, review_title, review_content, moive_grade, review_r_num, review_v_num, review_img, status_no, createat, receipt FROM MOVIE_REVIEW WHERE REVIEW_ID=?";
	
	//영화 리뷰 글 수정
	String reviewUpdate = "UPDATE MOVIE_REVIEW SET REVIEW_TITLE=?, REVIEW_CONTENT=?, MOIVE_GRADE=?, REVIEW_IMG=? , UPDATEAT=SYSDATE WHERE REVIEW_ID=? AND NICKNAME=? AND DELETE_N=0";
	
	//영화 리뷰 글 삭제
	String reviewDelete = "UPDATE MOVIE_REVIEW SET DELETE_N=1 WHERE NICKNAME=? AND REVIEW_ID=?";
	
	//영화등록
	String movieinsertSql = "INSERT INTO MOVIE_BOARD VALUES(MOVIE_BOARDSEQ.NEXTVAL,?,?,?,?,0,?,SYSDATE,SYSDATE)";
	
	
	//영화등록한거 수정
	String movieupdateSql = "UPDATE MOVIE_BOARD SET MOVIE_TITLE=?, MOVIE_TYPE=?, DIRECTOR=?, ACTOR=?, MOVIE_IMG=? WHERE MOVIE_ID=?";
	//영화 등록한거 삭제
	String moviedeleteSql = "DELETE FROM MOVIE_BOARD WHERE MOVIE_ID=?";
	
	////////////////////////////////////////////////////////////////////////////////////////////////
	//조회수 정렬
	String hittopsql = " SELECT * FROM MOVIE_REVIEW WHERE DELETE_N=0 ORDER BY REVIEW_V_NUM DESC ";
	//조회수 
	String hitinsertsql = " INSERT INTO MOVIE_HIT VALUES(MOVIE_HITSEQ.NEXTVAL,?,?)";
	//조회수 증가
	String hitupdatesql = " UPDATE MOVIE_REVIEW SET REVIEW_V_NUM=REVIEW_V_NUM+1 WHERE REVIEW_ID=?  ";

	//추천수 정렬
	String recotopsql = " SELECT * FROM MOVIE_REVIEW WHERE DELETE_N=0 ORDER BY REVIEW_R_NUM DESC ";
	//추천수
	String recoinsertsql = " INSERT INTO MOVIE_RECO VALUES(MOVIE_RECOSEQ.NEXTVAL,?,?) ";
	//추천수 증가
	String recoupdatesql = " UPDATE MOVIE_REVIEW SET REVIEW_R_NUM=REVIEW_R_NUM+1 WHERE REVIEW_ID =? ";
	//////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	//리뷰 리스트
	public List<MovieReviewDto> reviewList(Connection con, int movie_id, int pageNum);
	public int MovieReviewCount(Connection con, int movie_id);
	
	//리뷰 등록
	public int reviewInsert(Connection con, MovieReviewDto dto);
	//리뷰 글 조회
	public MovieReviewDto reviewSelect(Connection con, int review_id);
	//리뷰 글 수정
	public int reviewUpdate(Connection con, MovieReviewDto dto);
	//리뷰 글 삭제
	public int reviewDelete(Connection con, String nickname, int review_id);
	//카테고리 연결
	public List<MovieBoardDto> movieselectAll(Connection con, int category, int pageNum);
	// 영화 기본정보 조회
	public MovieBoardDto movieselectOne(Connection con, int movie_id);
	//영화 등록
	public int movieinsert(Connection con, MovieBoardDto dto);
	
	public int MovieRowCount(int category);
	
	//////////////////////////////////////////////////////////////////////////////////////////////////
	//조회수 정렬
	public List<MovieReviewDto> hitTop(Connection con);
	//조회수
	public int inserthit(Connection con, int review_id, String nickname);
	//조회수 증가
	public int updatehit(Connection con, int review_id);
	
	//추천수 정렬
	public List<MovieReviewDto> recoTop(Connection con);
	//추천수
	public int insertreco(Connection con, int review_id, String nickname);
	//추천수 증가
	public int updatereco(Connection con, int review_id);
	//////////////////////////////////////////////////////////////////////////////////////////////////
	
	
}
