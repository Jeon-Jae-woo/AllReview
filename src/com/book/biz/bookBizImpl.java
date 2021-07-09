package com.book.biz;

import java.util.List;

import com.book.dao.BookBoardDao;
import com.book.dao.BookBoardDaoImpl;
import com.book.dto.BookBoardDto;
import com.book.dto.BookCategoryDto;
import com.book.dto.BookReviewDto;
import com.user.dto.pagingDto;

public class bookBizImpl implements bookBiz{

	private BookBoardDao dao = new BookBoardDaoImpl();
	
	//카테고리별 책 리스트
	@Override
	public List<BookBoardDto> bookAllService(int pageNum, int category) {
		List<BookBoardDto> list = dao.bookListAll(pageNum, category);
	
		return list;
	}
	
	
	//카테고리별 row count
	@Override
	public pagingDto BookCountService(int pageNum, int book_type) {
		pagingDto paging = new pagingDto();
		paging.setPageNum(pageNum);
		int size = 0;
		size = dao.bookListRowCount(book_type);
		paging.setItemCount(8);
		paging.setTotalCount(size);
		paging.pagination();
		
		return paging;
	}

	//카테고리 목록 반환
	@Override
	public List<BookCategoryDto> categoryAll() {
		List<BookCategoryDto> categoryList = dao.categoryList();
		return categoryList;
	}


	//책 정보
	@Override
	public BookBoardDto bookInfoService(int book_id) {
		BookBoardDto bookInfo = dao.bookInfo(book_id);
		return bookInfo;
	}


	//리뷰 리스트
	@Override
	public List<BookReviewDto> ReviewListService(int book_id, int pageNum) {
		List<BookReviewDto> reviewList = dao.ReviewList(book_id, pageNum);
		return reviewList;
	}

	//리뷰 리스트 페이징
	@Override
	public pagingDto BookReviewCount(int pageNum, int book_id) {
		pagingDto paging = new pagingDto();
		paging.setPageNum(pageNum);
		int size = 0;
		size = dao.ReviewListRow(book_id);
		
		paging.setItemCount(8);
		paging.setTotalCount(size);
		paging.pagination();
		
		return paging;
		
	}

	//리뷰 게시글 조회
	@Override
	public BookReviewDto reviewSelectOneService(int review_id) {
		BookReviewDto dto = dao.ReviewSelectOne(review_id);
		return dto;
	}


	//리뷰 글 등록
	@Override
	public int reviewWriteService(BookReviewDto dto) {
		int result = dao.ReviewWrite(dto);
		return result;
	}


	//리뷰 글 삭제
	@Override
	public int reviewDeleteService(String nickname, int review_id) {
		int result = dao.ReviewDelete(nickname, review_id);
		return result;
	}

	//리뷰 수정
	@Override
	public int reviewUpdateService(BookReviewDto dto) {
		int result = dao.ReviewUpdate(dto);
		return result;
	}

}
