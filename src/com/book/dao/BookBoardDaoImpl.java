package com.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static common.JDBCTemplate.*;

import com.book.dto.BookBoardDto;
import com.book.dto.BookCategoryDto;
import com.book.dto.BookReviewDto;

import oracle.sql.DATE;

public class BookBoardDaoImpl implements BookBoardDao {
	

	public List<BookBoardDto> bookselectAll(Connection con){
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<BookBoardDto> res = new ArrayList<BookBoardDto>();
		
		try {
			pstm = con.prepareStatement(bookselectAllSql);
			System.out.println("03.query 준비: +");
			
			rs=pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				BookBoardDto bbd = 
						new BookBoardDto(rs.getInt(1),
								rs.getInt(2),
								rs.getString(3),
								rs.getString(4),
								rs.getString(5),
								rs.getString(6),
								rs.getDate(7),
								rs.getDate(8),
								rs.getInt(9));
				
				res.add(bbd);
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return res;
	}
	public boolean bookupdate(Connection con, BookBoardDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(bookupdateSql);
			pstm.setString(3, dto.getBook_title());
			pstm.setString(4, dto.getWriter());
			pstm.setString(5, dto.getPublisher());
			
			System.out.println("03. query 준비: + bookupdateSql");
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
			
		}
		
		
		return (res>0)?true:false;
	}
	public boolean bookdelete(Connection con, int book_id) {
		
		PreparedStatement pstm = null;
		int res = 0;
		try {
			pstm = con.prepareStatement(bookdeleteSql);
			pstm.setInt(1, book_id);
			System.out.println("03.query준비 : " + bookdeleteSql);
		
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		
		}
		return (res>0)?true:false;
	
	}
	
	
	
	//카테고리별 책 리스트 조회
	@Override
	public List<BookBoardDto> bookListAll(int pageNum, int category) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<BookBoardDto> list = new ArrayList<BookBoardDto>();
		BookBoardDto dto = null;
		
		int startRow = (pageNum-1)*8+1;
		int endRow = pageNum*8+1;
		
		try {
			pstm = con.prepareStatement(bookSelectAll);
			pstm.setInt(1, category);
			pstm.setInt(2, endRow);
			pstm.setInt(3, startRow);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				dto = new BookBoardDto();
				//SELECT RNUM,  BOOK_ID, BOOK_TYPE, BOOK_TITLE, BOOK_IMG, BOOK_TYPE_NAME 
				dto.setBook_id(rs.getInt(2));
				dto.setBook_type(rs.getInt(3));
				dto.setBook_title(rs.getString(4));
				dto.setBook_img(rs.getString(5));
				dto.setBook_type_name(rs.getString(6));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
	
		return list;
	}
	//count row 
	@Override
	public int bookListRowCount(int book_type) {
		Connection con =getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			pstm = con.prepareStatement(bookRowCount);
			pstm.setInt(1, book_type);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return count;
	}
	//카테고리 리스트
	@Override
	public List<BookCategoryDto> categoryList() {
		Connection con = getConnection();
		Statement stmt = null;
		List<BookCategoryDto> list = new ArrayList<BookCategoryDto>();
		ResultSet rs = null;
		BookCategoryDto dto = null;
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(bookCategoryList);
			
			while(rs.next()) {
				dto = new BookCategoryDto();
				dto.setBook_type(rs.getInt(1));
				dto.setBook_type_name(rs.getString(2));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
			close(con);
		}
		
		return list;
	}
	
	
	//책 기본정보 조회
	@Override
	public BookBoardDto bookInfo(int book_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		BookBoardDto dto = null;
		
		try {
			pstm = con.prepareStatement(bookselectOneSql);
			pstm.setInt(1, book_id);
			
			rs = pstm.executeQuery();
			
			//SELECT BOOK_ID, B.BOOK_TYPE, BOOK_TITLE, WRITER,
			//PUBLISHER, BOOK_IMG, BOOK_TYPE_NAME 

			while(rs.next()) {
				dto = new BookBoardDto();
				dto.setBook_id(rs.getInt(1));
				dto.setBook_type(rs.getInt(2));
				dto.setBook_title(rs.getString(3));
				dto.setWriter(rs.getString(4));
				dto.setPublisher(rs.getString(5));
				dto.setBook_img(rs.getString(6));
				dto.setBook_type_name(rs.getString(7));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return dto;
	}
	
	//책 리뷰 리스트
	@Override
	public List<BookReviewDto> ReviewList(int book_id, int pageNum) {
		Connection con = getConnection();
		PreparedStatement pstm= null;
		ResultSet rs = null;
		List<BookReviewDto> reviewList = new ArrayList<BookReviewDto>();
		BookReviewDto dto = null;
		
		int startRow = (pageNum-1)*8+1;
		int endRow = pageNum*8+1;
		
		try {
			pstm = con.prepareStatement(bookReviewList);
			pstm.setInt(1, book_id);
			pstm.setInt(2, endRow);
			pstm.setInt(3, startRow);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				//SELECT RNUM, REVIEW_ID, REVIEW_TITLE, NICKNAME, BOOK_ID, BOOK_GRADE, REVIEW_R_NUM, 
				//REVIEW_V_NUM, CREATEAT 
				dto = new BookReviewDto();
				dto.setReview_id(rs.getInt(2));
				dto.setReview_title(rs.getString(3));
				dto.setNickname(rs.getString(4));
				dto.setBook_id(rs.getInt(5));
				dto.setBook_grade(rs.getInt(6));
				dto.setReview_r_num(rs.getInt(7));
				dto.setReview_v_num(rs.getInt(8));
				dto.setRcreateat(rs.getDate(9));
				
				reviewList.add(dto);
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		
		return reviewList;
	}
	//리뷰 리스트 row
	@Override
	public int ReviewListRow(int book_id) {
		Connection con =getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			pstm = con.prepareStatement(bookReviewRow);
			pstm.setInt(1, book_id);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return count;
	}
	
	//리뷰 게시글 조회
	@Override
	public BookReviewDto ReviewSelectOne(int review_id) {
		Connection con =getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		BookReviewDto dto = null;
		
		try {
			pstm = con.prepareStatement(bookReviewOne);
			pstm.setInt(1, review_id);
			
			rs = pstm.executeQuery();
			//SELECT REVIEW_ID, REVIEW_TITLE, REVIEW_CONTENT, NICKNAME, BOOK_ID, 
			//REVIEW_R_NUM, REVIEW_V_NUM, CREATEAT, REVIEW_IMG, STATUS
			
			while(rs.next()) {
				dto = new BookReviewDto();
				dto.setReview_id(rs.getInt(1));
				dto.setReview_title(rs.getString(2));
				dto.setReview_content(rs.getString(3));
				dto.setNickname(rs.getString(4));
				dto.setBook_id(rs.getInt(5));
				dto.setReview_r_num(rs.getInt(6));
				dto.setReview_v_num(rs.getInt(7));
				dto.setRcreateat(rs.getDate(8));
				dto.setReview_img(rs.getString(9));
				dto.setStatus(rs.getInt(10));
				dto.setReceipt(rs.getString(11));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return dto;
	}
	
	//리뷰 글 등록
	@Override
	public int ReviewWrite(BookReviewDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int result = 0;
		
		try {
			pstm = con.prepareStatement(bookReviewWrite);
			pstm.setString(1, dto.getReview_title());
			pstm.setString(2, dto.getReview_content());
			pstm.setString(3, dto.getNickname());
			pstm.setInt(4, dto.getBook_id());
			pstm.setInt(5, dto.getBook_grade());
			pstm.setString(6, dto.getReview_img());
			pstm.setString(7, dto.getReceipt());
			
			result = pstm.executeUpdate();
			
			if(result>0) {
				commit(con);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return result;
	}
	
	//삭제
	@Override
	public int ReviewDelete(String nickname, int review_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int result = 0;
		
		try {
			pstm = con.prepareStatement(bookReviewDelete);
			pstm.setString(1, nickname);
			pstm.setInt(2, review_id);
			
			result = pstm.executeUpdate();
			
			if(result>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return result;
	}
	//수정
	@Override
	public int ReviewUpdate(BookReviewDto dto) {
		//"UPDATE BOOK_REVIEW_BOARD SET REVIEW_TITLE=?, REVIEW_CONTENT=?, UPDATEAT=SYSDATE WHERE REVIEW_ID=? AND NICKNAME=? AND DELETE_N=0";
		
		Connection con =getConnection();
		PreparedStatement pstm = null;
		int result = 0;
		
		try {
			pstm = con.prepareStatement(bookReviewUpdate);
			pstm.setString(1, dto.getReview_title());
			pstm.setString(2, dto.getReview_content());
			pstm.setInt(3, dto.getReview_id());
			pstm.setString(4, dto.getNickname());
			
			result = pstm.executeUpdate();
			
			if(result>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return result;
	}
	@Override
	public int bookinsert(Connection con, BookBoardDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(bookinsertSql);
			pstm.setInt(1, dto.getBook_type());
			pstm.setString(2, dto.getBook_title());
			pstm.setString(3, dto.getWriter());
			pstm.setString(4, dto.getPublisher());
			pstm.setString(5, dto.getBook_img());
			System.out.println("03.query 준비: " +bookinsertSql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}
				
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			System.out.println("05.db종료\n");
		}
		return res;
	}

}
