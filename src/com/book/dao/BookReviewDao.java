package com.book.dao;

public interface BookReviewDao {
	String reviewselectAll = " SELECT * FROM REVIEW ORDER BY REVIEW_ID DESC ";

	String reviewselectOneSql = "SELECT * FROM BOARD WHERE REVIEW_ID=? ";
	
	String reviewinsertSql = " INSERT INTO REVIEW VALUES(REVIEW_ID, NICKNAME, BOOK_ID, REVIEW_TITLE, REVIEW_CONTENT,BOOK_GRADE, REVIEW_R_NUM, REVIEW_V_NUM, REVIEW_IMG, RCREATEAT, RUPDATEAT, RDELETE, STATUS) ";

	String reviewupdateSql = " UPDATE BOARD SET REVIEW_TITLE=?, REVIEW_CONTENT=?, REVIEW_ID=? ";
	
	String reviewdeleteSql = " DELETE FROM REVIEW WHERE REVIEW_ID=? ";
}
