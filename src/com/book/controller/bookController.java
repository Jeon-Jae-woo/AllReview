package com.book.controller;

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

import com.book.biz.bookBiz;
import com.book.biz.bookBizImpl;
import com.book.dto.BookBoardDto;
import com.book.dto.BookCategoryDto;
import com.book.dto.BookReviewDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.user.dto.pagingDto;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
			
			String category_name = "";
			if(!list.isEmpty()) {
				category_name = list.get(0).getBook_type_name();
			}
			System.out.println("카테 : " + category_name);
			request.setAttribute("categoryList", categoryList);
			request.setAttribute("paging", paging);
			request.setAttribute("list", list);		
			request.setAttribute("category", category);
			request.setAttribute("category_name", category_name);
			
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
			//System.out.println(bookInfo.getBook_id());
			//System.out.println(bookInfo.getBook_title());
			
			
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
		//수정 작업 필요
		else if(command.equals("reviewDetail")) {
			int review_id = Integer.parseInt(request.getParameter("review_id"));
			
			BookReviewDto dto = biz.reviewSelectOneService(review_id);
			
			request.setAttribute("dto", dto);
			
			//승인 및 거절된 글은 관리자만 열람 가능, 승인된 글은 일반 유저도 접근 가능
			int level = 0;
			HttpSession session = request.getSession();
			if(session.getAttribute("level")!=null) {
				level = (Integer)session.getAttribute("level");
				request.setAttribute("bigCate", "도서");
				request.setAttribute("level", level);
			}

			if((dto.getStatus()==0 || dto.getStatus()==2) && (level==1 || level==2)) {
				dispatch("BookDetail.jsp", request, response);	
			}
			else if(dto.getStatus()==1){
				dispatch("BookDetail.jsp", request, response);	
			}else {
				jsResponse("유효하지 않은 접근입니다", "index.jsp", response);
			}
			
			
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
			
			//파일처리
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
			//파일처리 끝
			
			
			//String nickname = multi.getParameter("nickname");
			String nickname = (String)session.getAttribute("nickname"); 
			System.out.println("닉네임  : " + nickname);
			
			int book_id = Integer.parseInt(multi.getParameter("book_id"));
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			int book_grade = Integer.parseInt(multi.getParameter("bookgrade"));
			
			System.out.println("book_id :" + book_id);
			System.out.println("title : " + title);
			System.out.println("content : " + content);
			System.out.println("grade : " + book_grade);
			
			BookReviewDto dto = new BookReviewDto();
			dto.setReview_title(title);
			dto.setReview_content(content);
			dto.setNickname(nickname);
			dto.setBook_grade(book_grade);
			dto.setBook_id(book_id);
			dto.setReview_img(review_img);
			dto.setReceipt(receipt);
			
			
			
			
			
			int result = biz.reviewWriteService(dto);
			
			
			
			if(result>0) {
				jsResponse("리뷰 등록 성공","bookController?command=bookDetail&book_id="+book_id,response);
			}else {
				jsResponse("리뷰 등록 실패","bookController?command=bookDetail&book_id="+book_id,response);
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
			
			else if(command.equals("bookupdateform")) {
				int category = Integer.parseInt(request.getParameter("category"));
				String category_name = request.getParameter("category_name");
				
				List<BookCategoryDto> bookListCate = biz.categoryAll();

				request.setAttribute("category_name", category_name);
				request.setAttribute("category", category);

				request.setAttribute("bookListCate", bookListCate);
			
				dispatch("BookUpdate.jsp", request, response);
			}
			//도서 등록
			else if(command.equals("bookupdate")) {
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
				String book_title = multi.getParameter("book_title");
				String writer = multi.getParameter("writer");
				String publisher = multi.getParameter("publisher");
				//int participant = Integer.parseInt(multi.getParameter("participant"));
				
				BookBoardDto dto = new BookBoardDto();
				dto.setBook_type(category);
				dto.setBook_title(book_title);
				dto.setWriter(writer);
				dto.setPublisher(publisher);
				//dto.setParticipant(participant);
				dto.setBook_img(poster);
				
				int result = biz.bookinsert(dto);
				
				if(result>0) {
					jsResponse("도서 등록 성공","bookController?command=bookList&category="+category,response);
				}else {
					jsResponse("도서 등록 실패","bookController?command=bookListCate&category="+category,response);	
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
