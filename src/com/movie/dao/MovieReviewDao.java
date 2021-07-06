package com.movie.dao;

import java.sql.Connection;
import java.util.List;

import com.movie.dto.MovieReviewDto;

public interface MovieReviewDao {
	//리뷰리스트 전체조회
	String reviewselectAllSql = "SELECT * FROM MOVIE_REVIEW ORDER BY REVIEW_ID DESC";
	
	//리뷰 상세조회 (리뷰리스트에서 선택시)
	String reviewselectOneSql = "SELECT * FROM MOVIE_REVIEW WHERE REVIEW_ID=?";
	
	//리뷰 작성
	String reviewinsertSql = "INSERT INTO MOVIE_REVIEW VALUES(MOVIE_REVIEWREVIEW_ID.NEXTVAL,?,?,?,?,?,?,?,?,?,?,SYSDATE,SYSDATE)";
	//INSERT할때 테이블 컬럼명을 전체 다 넣어야하는건지 ?
	//리뷰 작성시에 사용자가 작성하는 부분은 MOVIE_ID/TITLE/CONTENT/MOVIE_GRADE/REVIEW_IMG
	//유저가 리뷰 작성할때 카테고리는 MOVIE_ID는  select,option으로 선택하는걸로 jsp화면을 구현해놨는데 괜찮은건지?
	// 수정날짜, 상태, 삭제, 조회수, 추천수는 글쓰기 부분에서는 필요없는부분인데 ?.. 
	
	//리뷰 수정
	String reviewupdateSql = "UPDATE MOVIE_REVIEW SET REVIEW_TITLE=?, REVIEW_CONTENT=?, REVIEW_IMG=? WHERE REVIEW_ID=?";
	//리뷰 수정할때 사용자가 수정 가능한 부분은 TITLE/CONTENT/MOVIE_GRADE/REVIEW_IMG부분
	//등록날짜와 수정날짜는 update에 안넣어도 되는건지 ?
	
	//리뷰 삭제
	String reviewdeleteSql = "DELETE FROM MOVIE_REVIEW WHERE REVIEW_ID=?";
							
							
	public List<MovieReviewDto> reviewselectAll(Connection con);
	public MovieReviewDto reviewselectOne(Connection con, int review_id);
	public boolean reviewinsert(Connection con, MovieReviewDto dto);
	public boolean reviewupdate(Connection con, MovieReviewDto dto);
	public boolean reviewdelete(Connection con, int review_id);

}
