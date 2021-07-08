package com.book.dao;

public interface BookBoardDao {
	
	String bookselectAllSql = "SELECT *  FROM BOARD ORDER BY BOOK_ID DESC";
	String bookupdateSql = " UPDATE BOARD SET BOOK_TITLE=?, WRITER=?, PUBLISHER=?, BOOK_IMG=?, SYSDATE, SYSDATE ";
	String bookdeleteSql = " DELETE FROM BOARD WHERE BOOK_ID=? ";
	
	

}
