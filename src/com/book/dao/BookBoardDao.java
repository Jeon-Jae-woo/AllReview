package com.book.dao;

import java.sql.Connection;
import java.util.List;

import com.book.dto.BookBoardDto;
import com.book.dto.BookCategoryDto;
import com.book.dto.BookReviewDto;


public interface BookBoardDao {
	
	String bookselectAllSql = "SELECT *  FROM BOARD ORDER BY BOOK_ID DESC";
	String bookupdateSql = " UPDATE BOARD SET BOOK_TITLE=?, WRITER=?, PUBLISHER=?, BOOK_IMG=?, SYSDATE, SYSDATE ";
	String bookdeleteSql = " DELETE FROM BOARD WHERE BOOK_ID=? ";
	
	//카테고리별 책 리스트
	String bookSelectAll = "SELECT RNUM,  BOOK_ID, BOOK_TYPE, BOOK_TITLE, BOOK_IMG, BOOK_TYPE_NAME FROM( SELECT ROWNUM RNUM, BOOK_ID, BOOK_TYPE, BOOK_TITLE, BOOK_IMG, BOOK_TYPE_NAME FROM( SELECT BOOK_ID, B.BOOK_TYPE, BOOK_TITLE, BOOK_IMG, BOOK_TYPE_NAME FROM BOOK_BOARD B JOIN BOOK_CATEGORY BC ON(B.BOOK_TYPE=BC.BOOK_TYPE) WHERE B.BOOK_TYPE=?) WHERE ROWNUM<?) WHERE RNUM>=?";
	String bookRowCount = "SELECT COUNT(*) FROM BOOK_BOARD WHERE BOOK_TYPE=?";
	
	//카테고리 리스트
	String bookCategoryList = "SELECT * FROM BOOK_CATEGORY";
	
	
	//책 기본 정보 조회
	String bookselectOneSql = "SELECT BOOK_ID, B.BOOK_TYPE, BOOK_TITLE, WRITER, PUBLISHER, BOOK_IMG, BOOK_TYPE_NAME FROM BOOK_BOARD B JOIN BOOK_CATEGORY BC ON(B.BOOK_TYPE=BC.BOOK_TYPE) WHERE BOOK_ID=?";
	
	
	//책 리뷰 리스트(book_id로 구분)
	String bookReviewList = "SELECT RNUM, REVIEW_ID, REVIEW_TITLE, NICKNAME, BOOK_ID, BOOK_GRADE, REVIEW_R_NUM, REVIEW_V_NUM, CREATEAT FROM( SELECT ROWNUM AS RNUM, REVIEW_ID, REVIEW_TITLE, NICKNAME, BOOK_ID, BOOK_GRADE, REVIEW_R_NUM, REVIEW_V_NUM, CREATEAT FROM( SELECT REVIEW_ID, REVIEW_TITLE, NICKNAME, BOOK_ID, BOOK_GRADE, REVIEW_R_NUM, REVIEW_V_NUM, CREATEAT FROM BOOK_REVIEW_BOARD WHERE BOOK_ID=? AND STATUS=1 AND DELETE_N=0) WHERE ROWNUM<?) WHERE RNUM>=?";
	String bookReviewRow = "SELECT COUNT(*) FROM BOOK_REVIEW_BOARD WHERE BOOK_ID=? AND STATUS=1 AND DELETE_N=0";
	
	//리뷰 글 조회
	String bookReviewOne = "SELECT REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENT, NICKNAME, BOOK_ID, REVIEW_R_NUM, REVIEW_V_NUM, CREATEAT, REVIEW_IMG, STATUS,RECEIPT FROM BOOK_REVIEW_BOARD WHERE REVIEW_ID=?";
	
	//리뷰 글 쓰기
	String bookReviewWrite = "INSERT INTO BOOK_REVIEW_BOARD VALUES(REVIEW_ID.NEXTVAL,?,?,?,?,?,0,0,SYSDATE,SYSDATE,?,0,?,0)";
	
	//리뷰 글 수정
	String bookReviewUpdate = "UPDATE BOOK_REVIEW_BOARD SET REVIEW_TITLE=?, REVIEW_CONTENT=?, UPDATEAT=SYSDATE WHERE REVIEW_ID=? AND NICKNAME=? AND DELETE_N=0";
	
	//리뷰 글 삭제
	String bookReviewDelete = "UPDATE BOOK_REVIEW_BOARD SET DELETE_N=1 WHERE NICKNAME=? AND REVIEW_ID=?";
	
	//도서등록
	String bookinsertSql = "INSERT INTO BOOK_BOARD VALUES(BOOK_BOARDSEQ.NEXTVAL,?,?,?,?,?,SYSDATE,SYSDATE)";
	//책 리스트 조회
	public List<BookBoardDto> bookListAll(int pageNum, int category);
	public int bookListRowCount(int book_type);
	
	//카테고리 리스트
	public List<BookCategoryDto> categoryList();
	
	//책 기본 정보 조회
	public BookBoardDto bookInfo(int book_id);
	//리뷰 리스트
	public List<BookReviewDto> ReviewList(int book_id, int pageNum);
	//리뷰 리스트 ROW
	public int ReviewListRow(int book_id);
	
	//리뷰 글 조회
	public BookReviewDto ReviewSelectOne(int review_id);
	//리뷰 글 쓰기
	public int ReviewWrite(BookReviewDto dto);
	//리뷰 글 삭제
	public int ReviewDelete(String nickname, int review_id);
	//리뷰 수정
	public int ReviewUpdate(BookReviewDto dto);
	
	//도서등록
	public int bookinsert(Connection con, BookBoardDto dto);
	
}
