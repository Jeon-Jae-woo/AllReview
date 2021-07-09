package com.book.biz;

import java.util.List;

import com.book.dto.BookBoardDto;
import com.book.dto.BookCategoryDto;
import com.book.dto.BookReviewDto;
import com.user.dto.pagingDto;

public interface bookBiz {

	//카테고리별 책 리스트
	public List<BookBoardDto> bookAllService(int pageNum, int category);
	public pagingDto BookCountService(int pageNum, int category);
	
	//카테고리 리스트
	public List<BookCategoryDto> categoryAll();
	
	//책 정보 조회
	public BookBoardDto bookInfoService(int book_id);
	//책 리뷰 리스트
	public List<BookReviewDto> ReviewListService(int book_id, int pageNum);
	public pagingDto BookReviewCount(int pageNum, int book_id);
	
	//리뷰 글 조회
	public BookReviewDto reviewSelectOneService(int review_id);
	//리뷰 글 쓰기
	public int reviewWriteService(BookReviewDto dto);
	//리뷰 글 삭제
	public int reviewDeleteService(String nickname, int review_id);
	//리뷰 글 수정
	public int reviewUpdateService(BookReviewDto dto);
	
}
