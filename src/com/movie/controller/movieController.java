package com.movie.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.movie.dto.MovieBoardDto;
import com.movie.dto.MovieCategoryDto;
import com.movie.dto.MovieReviewDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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
		
		//리뷰 리스트 조회
		else if(command.equals("detail")){
			int movie_id = Integer.parseInt(request.getParameter("movie_id"));
			String category_name = request.getParameter("category_name");
			String pageNumParam = request.getParameter("pageNum");

			int pageNum = 0;
			if(pageNumParam == null) {
				pageNum = 1;
			}else {
				pageNum = Integer.parseInt(pageNumParam);
			}
			
			MovieBoardDto dto = biz.movieselectOne(movie_id);
			
			List<MovieReviewDto> list = biz.reviewListService(movie_id, pageNum);
			
			List<MovieCategoryDto> moiveListCate = biz.categoryselectAll();
			
			pagingDto paging = biz.movieReviewPaging(pageNum, movie_id);
			
			request.setAttribute("paging", paging);
			request.setAttribute("totalList", list);	
			request.setAttribute("dto", dto);
			request.setAttribute("category_name", category_name);
			request.setAttribute("movie_id", movie_id);
			request.setAttribute("moiveListCate", moiveListCate);
			dispatch("MovieList.jsp", request, response);
		}
		//리뷰 글작성
		else if(command.equals("reviewWriteForm")) {
			int movie_id = Integer.parseInt(request.getParameter("movie_id"));
			HttpSession session = request.getSession();
			if(session.getAttribute("email") == null) {
				jsResponse("로그인이 되어있지 않습니다", "index.jsp", response);
			}
			List<MovieCategoryDto> moiveListCate = biz.categoryselectAll();
			
			request.setAttribute("moiveListCate", moiveListCate);
			request.setAttribute("movie_id", movie_id);
			System.out.println("reviewWriteForm"+movie_id);
			dispatch("MovieWrite.jsp", request, response);
		}
		//리뷰 글 작성 세션
		else if(command.equals("reviewWrite")) {
			HttpSession session = request.getSession();
			if(session.getAttribute("email") == null) {
				jsResponse("로그인이 되어있지 않습니다", "index.jsp", response);
			}
			
			//파일 처리
			String realFolder="";
			String saveFolder = "resources/uploadImage";		//사진을 저장할 경로
			String encType = "utf-8";				//변환형식
			int maxSize=5*1024*1024;				//사진의 size
				
			ServletContext context = this.getServletContext();		//절대경로를 얻는다
			realFolder = context.getRealPath(saveFolder);
			
			System.out.println(realFolder);
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
	                   new DefaultFileRenamePolicy());
			
			String receipt = multi.getFilesystemName("receipt");
			
			String review_img = multi.getFilesystemName("uploadImg");
			
			System.out.println("file1 + " + receipt);
			System.out.println("file2 + " + review_img);
			//파일 처리 끝
			
			String nickname = (String)session.getAttribute("nickname");
			System.out.println("닉네임  : " + nickname);
			
			//닉네임, MOVIE_ID, 제목, 내용, MOVIE_GRADE
			int movie_id = Integer.parseInt(multi.getParameter("movie_id"));
			
			String title = multi.getParameter("reviewtitle");
			String content = multi.getParameter("content");
			int moviegrade = Integer.parseInt(multi.getParameter("moviegrade"));

			MovieReviewDto dto = new MovieReviewDto();
			dto.setMovie_id(movie_id);
			dto.setNickname(nickname);
			dto.setReview_title(title);
			dto.setReview_content(content);
			dto.setMovie_grade(moviegrade);
			dto.setReceipt(receipt); // 이미지 세팅
			dto.setReview_img(review_img); // 이미지 세팅
			
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
			
			List<MovieCategoryDto> moiveListCate = biz.categoryselectAll();
			
			MovieReviewDto dto = biz.reviewSelectService(review_id);
			
			request.setAttribute("moiveListCate", moiveListCate);
			request.setAttribute("dto", dto);
			
			
			//승인 및 거절된 글은 관리자만 열람 가능, 승인된 글은 일반 유저도 접근 가능
			int level = 0;
			HttpSession session = request.getSession();
			if(session.getAttribute("level")!=null) {
				level = (Integer)session.getAttribute("level");
				request.setAttribute("bigCate", "영화");
				request.setAttribute("level", level);
			}

			if((dto.getStatus_no()==0 || dto.getStatus_no()==2) && (level==1 || level==2)) {
				dispatch("MovieDetail.jsp", request, response);	
			}
			else if(dto.getStatus_no()==1){
				dispatch("MovieDetail.jsp", request, response);	
			}else {
				jsResponse("유효하지 않은 접근입니다", "index.jsp", response);
			}
			
		}
		//리뷰 수정
		else if(command.equals("reviewUpdateForm")) {
			int review_id = Integer.parseInt(request.getParameter("review_id"));
			
			MovieReviewDto dto = biz.reviewSelectService(review_id);
			List<MovieCategoryDto> moiveListCate = biz.categoryselectAll();
			
			request.setAttribute("moiveListCate", moiveListCate);
			request.setAttribute("dto", dto);
			
			dispatch("MovieUpdate.jsp", request, response);
		}
		//리뷰 수정 로그인 세션 
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

		//영화 등록

		else if(command.equals("moviecreateForm")) {
			int category = Integer.parseInt(request.getParameter("category"));
			String category_name = request.getParameter("category_name");
			
			List<MovieCategoryDto> moiveListCate = biz.categoryselectAll();

			request.setAttribute("category_name", category_name);
			request.setAttribute("category", category);

			request.setAttribute("moiveListCate", moiveListCate);
		
			
			
			dispatch("MovieCreate.jsp", request, response);
		}
		//영화 등록
		else if(command.equals("moviecreate")) {
			HttpSession session = request.getSession();
			if(session.getAttribute("email") == null) {
				jsResponse("로그인이 되어있지 않습니다", "index.jsp", response);
			}
			
			//파일 처리
			String realFolder="";
			String saveFolder = "resources/uploadImage";		//사진을 저장할 경로
			String encType = "utf-8";				//변환형식
			int maxSize=5*1024*1024;				//사진의 size
				
			ServletContext context = this.getServletContext();		//절대경로를 얻는다
			realFolder = context.getRealPath(saveFolder);
			
			System.out.println(realFolder);
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
	                   new DefaultFileRenamePolicy());
			
			String poster = multi.getFilesystemName("poster");
			
			System.out.println("file + " + poster);
			
			//기본 정보 받기
			int category = Integer.parseInt(multi.getParameter("category"));
			String movie_title = multi.getParameter("movie_title");
			String director = multi.getParameter("director");
			String actor = multi.getParameter("actor");
			//int participant = Integer.parseInt(multi.getParameter("participant"));
			
			MovieBoardDto dto = new MovieBoardDto();
			dto.setMovie_type(category);
			dto.setMovie_title(movie_title);
			dto.setDirector(director);
			dto.setActor(actor);
			//dto.setParticipant(participant);
			dto.setMovie_img(poster);
			
			int result = biz.movieinsert(dto);
			
			if(result>0) {
				jsResponse("영화 등록 성공","movieController?command=moiveListCate&category="+category,response);
			}else {
				jsResponse("영화 등록 실패","movieController?command=moiveListCate&category="+category,response);	
			}
			
			
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
