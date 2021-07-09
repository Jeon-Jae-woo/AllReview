package com.book.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.biz.bookBiz;
import com.book.biz.bookBizImpl;
import com.book.dto.BookBoardDto;
import com.book.dto.BookCategoryDto;
import com.book.dto.BookReviewDto;
import com.movie.dto.MovieReviewDto;
import com.user.dto.pagingDto;


@WebServlet("/bookController")
public class bookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public bookController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		bookBiz biz = new bookBizImpl();
		
		if(command.equals("bookList")) {
			String cate = request.getParameter("category");
			String pageNumParam = request.getParameter("pageNum");
			
			int pageNum = 0;
			if(pageNumParam == null) {
				pageNum = 1;
			}else {
				pageNum = Integer.parseInt(pageNumParam);
			}

			int category = 0;
			if(cate==null) {
				category = 1;
			}else {
				category = Integer.parseInt(cate);
			}
			
			//책 리스트
			List<BookBoardDto> list = biz.bookAllService(pageNum, category);
			//책 카테고리 리스트
			List<BookCategoryDto> categoryList = biz.categoryAll();
			
			//페이징
			pagingDto paging = biz.BookCountService(pageNum, category);
			
			request.setAttribute("categoryList", categoryList);
			request.setAttribute("paging", paging);
			request.setAttribute("list", list);		
			request.setAttribute("category", category);
			
			dispatch("BookMain.jsp", request, response);
			
			
		}else if(command.equals("bookDetail")) {
			int book_id = Integer.parseInt(request.getParameter("book_id"));
			
			String pageNumParam = request.getParameter("pageNum");

			int pageNum = 0;
			if(pageNumParam == null) {
				pageNum = 1;
			}else {
				pageNum = Integer.parseInt(pageNumParam);
			}
			
			//책 정보
			BookBoardDto bookInfo = biz.bookInfoService(book_id);
			//책 리뷰 리스트
			List<BookReviewDto> reviewList = biz.ReviewListService(book_id, pageNum);
			
			//페이징
			pagingDto paging = biz.BookReviewCount(pageNum, book_id);
			
			List<BookCategoryDto> categoryList = biz.categoryAll();
			request.setAttribute("categoryList", categoryList);
			request.setAttribute("bookInfo", bookInfo);
			request.setAttribute("reviewList", reviewList );
			request.setAttribute("paging", paging);
			request.setAttribute("book_id", book_id);
			
			dispatch("BookImfo.jsp", request, response);
			
		}
		//리뷰 글 조회
		else if(command.equals("reviewDetail")) {
			int review_id = Integer.parseInt(request.getParameter("review_id"));
			
			BookReviewDto dto = biz.reviewSelectOneService(review_id);
			
			request.setAttribute("dto", dto);
			
			dispatch("BookDetail.jsp", request, response);
		}
		//글 등록 페이지 이동
		else if(command.equals("reviewWriteForm")) {
			HttpSession session = request.getSession();
			if(session.getAttribute("email") == null) {
				jsResponse("로그인이 되어있지 않습니다", "login.jsp", response);
			}
			String nickname = (String)session.getAttribute("nickname");
			int book_id = Integer.parseInt(request.getParameter("book_id"));
			
			
			request.setAttribute("nickname", nickname);
			request.setAttribute("book_id", book_id);
			dispatch("BookWrite.jsp", request, response);

			
		}
		//글 등록
		else if(command.equals("reviewWrite")) {
			HttpSession session = request.getSession();
			if(session.getAttribute("email") == null) {
				jsResponse("로그인이 되어있지 않습니다", "login.jsp", response);
			}
			
			String nickname = (String)session.getAttribute("nickname");
			int book_id = Integer.parseInt(request.getParameter("book_id"));
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int book_grade = Integer.parseInt(request.getParameter("book_grade"));
			String review_img = request.getParameter("review_img");
			
			
			BookReviewDto dto = new BookReviewDto();
			dto.setReview_title(title);
			dto.setReview_content(content);
			dto.setNickname(nickname);
			dto.setBook_grade(book_grade);
			dto.setBook_id(book_id);
			dto.setReview_img(review_img);
			
			int result = biz.reviewWriteService(dto);
			
			if(result>0) {
				jsResponse("리뷰 등록 성공","bookController?command=bookDetail&book_id="+book_id,response);
			}else {
				jsResponse("리뷰 등록 실패","bookController?command=bookDetail&movie_id="+book_id,response);
			}
			
		}
		//리뷰 삭제
		else if(command.equals("reviewDelete")) {
			HttpSession session = request.getSession();
			if(session.getAttribute("email") == null) {
				jsResponse("로그인이 되어있지 않습니다", "index.jsp", response);
			}
			
			String nickname = (String)session.getAttribute("nickname");
			int review_id = Integer.parseInt(request.getParameter("review_id"));
			int book_id = Integer.parseInt(request.getParameter("book_id"));
			
			int result = biz.reviewDeleteService(nickname, review_id);
			
			if(result>0) {
				jsResponse("리뷰 삭제 성공","bookController?command=bookDetail&book_id="+book_id,response);
			}else {
				jsResponse("리뷰 삭제 실패","bookController?command=reviewDetail&review_id="+review_id,response);
			}
		}
		//리뷰 수정 폼
		else if(command.equals("reviewUpdateForm")) {
			int review_id = Integer.parseInt(request.getParameter("review_id"));
			BookReviewDto dto = biz.reviewSelectOneService(review_id);
			request.setAttribute("dto", dto);
			dispatch("BookWriteModify.jsp", request, response);
		}
		//리뷰 수정
		else if(command.equals("reviewUpdate")) {
			
			HttpSession session = request.getSession();
			if(session.getAttribute("email") == null) {
				jsResponse("로그인이 되어있지 않습니다", "index.jsp", response);
			}
			
			String nickname = (String)session.getAttribute("nickname");

			int review_id = Integer.parseInt(request.getParameter("review_id"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			BookReviewDto dto = new BookReviewDto();
			dto.setReview_id(review_id);
			dto.setReview_title(title);
			dto.setReview_content(content);
			dto.setNickname(nickname);
			
			//수정 작업
			int result = biz.reviewUpdateService(dto); 
			
			if(result>0) {
				jsResponse("리뷰 수정 성공","bookController?command=reviewDetail&review_id="+review_id,response);
			}else {
				jsResponse("리뷰 수정 실패","bookController?command=reviewDetail&review_id="+review_id,response);
			}
			
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"
				+ "alert('"+msg+"');"
				+ "location.href='"+url+"';"
				+ "</script>";
		PrintWriter out = response.getWriter();
		out.print(s);
	}
	
}
