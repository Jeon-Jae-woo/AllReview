package com.movie.controller;

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

import com.movie.dto.MovieBoardDto;
import com.movie.dto.MovieCategoryDto;
import com.movie.dto.MovieReviewDto;
import com.user.dto.pagingDto;
import com.movie.biz.movieBiz;
import com.movie.biz.MovieBizImple;


@WebServlet("/movieController")
public class movieController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public movieController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		movieBiz biz = new MovieBizImple();
		
		//영화 카테고리 연결	
		if(command.equals("moiveListCate")) {
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
			
			List<MovieBoardDto> list = biz.movieselectAll(category, pageNum);
			
			
			List<MovieCategoryDto> moiveListCate = biz.categoryselectAll();
			
			pagingDto paging = biz.movieListPaging(pageNum, category); 
			
			String category_name = "";
			if(!list.isEmpty()) {
				category_name = list.get(0).getMovie_type_name();
			}
			
			request.setAttribute("paging", paging);
			request.setAttribute("list", list);		
			request.setAttribute("moiveListCate", moiveListCate);
			request.setAttribute("category", category);
			request.setAttribute("category_name", category_name);
			 
			 dispatch("MovieMain.jsp", request, response);
			 
		}
		else if(command.equals("detail")){
			int movie_id = Integer.parseInt(request.getParameter("movie_id"));
			
			String pageNumParam = request.getParameter("pageNum");

			int pageNum = 0;
			if(pageNumParam == null) {
				pageNum = 1;
			}else {
				pageNum = Integer.parseInt(pageNumParam);
			}
			
			MovieBoardDto dto = biz.movieselectOne(movie_id);
			
			List<MovieReviewDto> list = biz.reviewListService(movie_id, pageNum);
			pagingDto paging = biz.movieReviewPaging(pageNum, movie_id);
			
			request.setAttribute("paging", paging);
			request.setAttribute("totalList", list);	
			request.setAttribute("dto", dto);
			request.setAttribute("movie_id", movie_id);
			
			dispatch("MovieList.jsp", request, response);
			
		}else if(command.equals("reviewWriteForm")) {
			int movie_id = Integer.parseInt(request.getParameter("movie_id"));
			HttpSession session = request.getSession();
			if(session.getAttribute("email") == null) {
				jsResponse("로그인이 되어있지 않습니다", "index.jsp", response);
			}
			
			request.setAttribute("movie_id", movie_id);
			dispatch("MovieWrite.jsp", request, response);
			
			
		}
		//리뷰 글 작성
		else if(command.equals("reviewWrite")) {
			HttpSession session = request.getSession();
			if(session.getAttribute("email") == null) {
				jsResponse("로그인이 되어있지 않습니다", "index.jsp", response);
			}
			
			String nickname = (String)session.getAttribute("nickname");
			System.out.println("닉네임  : " + nickname);
			System.out.println(request.getParameter("movie_id"));
			System.out.println(request.getParameter("reviewtitle"));
			System.out.println(request.getParameter("content"));
			System.out.println(request.getParameter("moviegrade"));
			
			//닉네임, MOVIE_ID, 제목, 내용, MOVIE_GRADE
			int movie_id = Integer.parseInt(request.getParameter("movie_id"));
			
			String title = request.getParameter("reviewtitle");
			String content = request.getParameter("content");
			int moviegrade = Integer.parseInt(request.getParameter("moviegrade"));

			MovieReviewDto dto = new MovieReviewDto();
			dto.setMovie_id(movie_id);
			dto.setNickname(nickname);
			dto.setReview_title(title);
			dto.setReview_content(content);
			dto.setMovie_grade(moviegrade);
			
			int result = biz.ReviewInsertService(dto);
			
			if(result>0) {
				jsResponse("리뷰 등록 성공","movieController?command=detail&movie_id="+movie_id,response);
			}else {
				jsResponse("리뷰 등록 실패","movieController?command=detail&movie_id="+movie_id,response);
			}

		}
		//리뷰 글 조회
		else if(command.equals("reviewDetail")) {
			int review_id = Integer.parseInt(request.getParameter("review_id"));
			
			MovieReviewDto dto = biz.reviewSelectService(review_id);
			
			request.setAttribute("dto", dto);
			dispatch("MovieDetail.jsp", request, response);
		}else if(command.equals("reviewUpdateForm")) {
			int review_id = Integer.parseInt(request.getParameter("review_id"));
			MovieReviewDto dto = biz.reviewSelectService(review_id);
			request.setAttribute("dto", dto);
			dispatch("MovieUpdate.jsp", request, response);
		}
		else if(command.equals("reviewUpdate")) {
			
			HttpSession session = request.getSession();
			if(session.getAttribute("email") == null) {
				jsResponse("로그인이 되어있지 않습니다", "index.jsp", response);
			}
			
			String nickname = (String)session.getAttribute("nickname");

			int review_id = Integer.parseInt(request.getParameter("review_id"));
			String title = request.getParameter("reviewtitle");
			String content = request.getParameter("content");
			
			MovieReviewDto dto = new MovieReviewDto();
			dto.setReview_id(review_id);
			dto.setReview_title(title);
			dto.setReview_content(content);
			dto.setNickname(nickname);
			
			
			int result = biz.reviewUpdateService(dto); 
			if(result>0) {
				jsResponse("리뷰 수정 성공","movieController?command=reviewDetail&review_id="+review_id,response);
			}else {
				jsResponse("리뷰 수정 실패","movieController?command=reviewDetail&review_id="+review_id,response);
			}
			
		}
		//삭제
		else if(command.equals("reviewDelete")) {
			HttpSession session = request.getSession();
			if(session.getAttribute("email") == null) {
				jsResponse("로그인이 되어있지 않습니다", "index.jsp", response);
			}
			
			String nickname = (String)session.getAttribute("nickname");
			System.out.println(request.getParameter("movie_id"));
			System.out.println(request.getParameter("review_id"));
			int review_id = Integer.parseInt(request.getParameter("review_id"));
			int movie_id = Integer.parseInt(request.getParameter("movie_id"));
			
			int result = biz.reviewDeleteService(nickname, review_id);
			
			if(result>0) {
				jsResponse("리뷰 삭제 성공","movieController?command=detail&movie_id="+movie_id,response);
			}else {
				jsResponse("리뷰 삭제 실패","movieController?command=reviewDetail&review_id="+review_id,response);
			}
			
		}

		
		else if(command.equals("moviecreate")) {
			response.sendRedirect("MovieCreate.jsp");
			
		
		}
	}	 	

	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
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
