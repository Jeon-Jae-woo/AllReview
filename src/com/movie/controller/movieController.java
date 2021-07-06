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
		
		//영화목록조회
		if(command.equals("list")) {
			List<MovieBoardDto> list = biz.movieselectAll();
	
			request.setAttribute("list", list);
			
			for(MovieBoardDto dto : list) {
				System.out.println(dto.getMovie_id());
			}
			
			dispatch("Movie/MovieMain.jsp", request, response);
		}else if(command.equals("detail")){
			int movie_id = Integer.parseInt(request.getParameter("movie_id"));
			
			MovieBoardDto dto = biz.movieselectOne(movie_id);
			
			request.setAttribute("dto", dto);
			dispatch("MovieList.jsp", request, response);
			
		}
		
		
		//영화리뷰목록조회
//		else if(command.equals("")) {
//			
//		}
		//영화리뷰상세조회
//		else if(command.equals("")) {
//			
//		}

		
		
		
	}	 	

	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
