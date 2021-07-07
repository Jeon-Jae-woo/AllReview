package com.movie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movie.dto.MovieBoardDto;
import com.movie.dto.MovieCategoryDto;
import com.movie.biz.MovieBiz;
import com.movie.biz.MovieBizImple;


@WebServlet("/MovieController")
public class MovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MovieController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		MovieBiz biz = new MovieBizImple();
		
		//영화 카테고리 연결	
		if(command.equals("moiveListCate")) {

			 List<MovieCategoryDto> moiveListCate = biz.categoryselectAll();
			 
			 request.setAttribute("moiveListCate", moiveListCate);
			  
				/*
				 * List<MovieBoardDto> list = biz.movieselectAll();
				 * 
				 * request.setAttribute("list", list);
				 */
			 
			 for(MovieCategoryDto dto : moiveListCate) {
			 System.out.println(dto.getMovie_type()); } 
			 
			 dispatch("MovieMain.jsp", request, response);
			 
		//영화목록조회 페이지
		}else if(command.equals("list")) {
			List<MovieBoardDto> list = biz.movieselectAll();
	
			request.setAttribute("list", list);
			
			for(MovieBoardDto dto : list) {
				System.out.println(dto.getMovie_id());
			}
			dispatch("MovieMain.jsp", request, response);
		//리뷰리스트조회 페이지(영화기본정보 표시)	
		}else if(command.equals("detail")){
			int movie_id = Integer.parseInt(request.getParameter("movie_id"));
			
			MovieBoardDto dto = biz.movieselectOne(movie_id);
			
			request.setAttribute("dto", dto);
			//request.setAttribute("dto", dto); 영화평점 추가
			dispatch("MovieList.jsp", request, response);
			
		}else if(command.equals("moviecreate")) {
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

}
