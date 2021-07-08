package com.online.controller;

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

import com.online.biz.onlineBiz;
import com.online.biz.onlineBizImpl;
import com.online.dto.onlineDto;
import com.user.dto.pagingDto;

@WebServlet("/onlineController")
public class onlineController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public onlineController() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//커맨드로 넘어오는 값, 콘솔창 커맨드값
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		onlineBiz biz = new onlineBizImpl();
		
		//전체조회
		if(command.equals("list")) {
			String category = request.getParameter("category");
			String pageNumParam = request.getParameter("pageNum");
			
			int pageNum = 0;
			if(pageNumParam == null) {
				pageNum = 1;
			}else {
				pageNum = Integer.parseInt(pageNumParam);
			}

			int category_id = 0;
			if(category==null) {
				category_id = 1;
			}else {
				category_id = Integer.parseInt(category);
			}
			
			List<onlineDto> list = biz.selectListCateService(category_id, pageNum);
			
			pagingDto paging = biz.OnlineListPaging(pageNum, category_id);
			String category_name = list.get(0).getCategory_name();
			
			
			request.setAttribute("paging", paging);
			request.setAttribute("list", list);
			request.setAttribute("category_id", category_id);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("category_name", category_name);
			dispatch("online01.jsp",request,response);
			
		}
		//단일 조회
		else if(command.equals("detail")) {
			int board_id = Integer.parseInt(request.getParameter("board_id"));
			
			onlineDto dto = biz.selectOnlineService(board_id);
			
			request.setAttribute("dto", dto);
			dispatch("boarddetail.jsp", request, response);
			
		}
		else if(command.equals("updateForm")) {
			int board_id = Integer.parseInt(request.getParameter("board_id"));
			onlineDto dto = biz.selectOnlineService(board_id);
			request.setAttribute("dto", dto);
			dispatch("boardupdate.jsp", request, response);
		}
		//게시글 수정
		else if(command.equals("update")) {
			int board_id = Integer.parseInt(request.getParameter("board_id"));
			HttpSession session = request.getSession();
			if(session.getAttribute("email") == null) {
				jsResponse("로그인이 되어있지 않습니다", "index.jsp", response);
			}
			
			String nickname = (String)session.getAttribute("nickname");
			
			//ONLINE_TITLE=?, ONLINE_CONTENT=?, PRICE_SAT=?, PRODUCT_SAT=?, 
			//		ADD_PRODUCT=?, UPDATEAT=SYSDATE WHERE ONLINE_BOARD_ID=? AND NICKNAME=?";
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			double price_sat = Double.parseDouble(request.getParameter("price_sat"));
			double product_sat = Double.parseDouble(request.getParameter("product_sat"));
			int add_product = Integer.parseInt(request.getParameter("add_product"));
			
			onlineDto dto = new onlineDto();
			dto.setOnline_board_id(board_id);
			dto.setNickname(nickname);
			
			dto.setOnline_title(title);
			dto.setOnline_content(content);
			dto.setPrice_sat(price_sat);
			dto.setProduct_sat(product_sat);
			dto.setAdd_product(add_product);
			
			
			int result = biz.updateOnlineService(dto);
			
			if(result>0) {
				jsResponse("리뷰 수정 성공","onlineController?command=detail&board_id="+board_id,response);
			}else {
				jsResponse("리뷰 수정 실패","onlineController?command=detail&board_id="+board_id,response);
			}
			
		}
		//게시글 삭제
		else if(command.equals("delete")) {
			int board_id = Integer.parseInt(request.getParameter("board_id"));
			int category_id = Integer.parseInt(request.getParameter("category_id"));
			
			HttpSession session = request.getSession();
			if(session.getAttribute("email") == null) {
				jsResponse("로그인이 되어있지 않습니다", "index.jsp", response);
			}
			
			String nickname = (String)session.getAttribute("nickname");
			
			int result= biz.deleteOnlineService(board_id, nickname);
			
			
			if(result>0) {
				jsResponse("리뷰 삭제 성공","onlineController?command=list&category="+category_id,response);
			}else {
				jsResponse("리뷰 삭제 실패","onlineController?command=list&category="+category_id,response);
			}
			
		}
		//글 쓰기 폼 이동
		else if(command.equals("writeForm")) {
			HttpSession session = request.getSession();
			if(session.getAttribute("email") == null) {
				jsResponse("로그인이 되어있지 않습니다", "index.jsp", response);
			}
			int category_id = Integer.parseInt(request.getParameter("category_id"));
			String category_name = request.getParameter("category_name");
			
			request.setAttribute("category_id", category_id);
			request.setAttribute("category_name", category_name);
			dispatch("boardwrite.jsp", request, response);
			
			
		}
		//글 쓰기
		else if(command.equals("write")) {
			HttpSession session = request.getSession();
			if(session.getAttribute("email") == null) {
				jsResponse("로그인이 되어있지 않습니다", "index.jsp", response);
			}
			
			String nickname = (String)session.getAttribute("nickname");
			int category_id = Integer.parseInt(request.getParameter("category_id"));
			
			//제목, 내용, 카테고리, 가격만족도, 상품만족도, 사진, 영수증, 닉네임
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			double price_sat = Double.parseDouble(request.getParameter("price_sat"));
			double product_sat = Double.parseDouble(request.getParameter("product_sat"));
			//상품 , 영수증 사진
			int product_add = Integer.parseInt(request.getParameter("product_add"));
			int receipt = Integer.parseInt(request.getParameter("receipt"));
			
			onlineDto dto = new onlineDto();
			
			dto.setNickname(nickname);
			dto.setCategory_id(category_id);
			dto.setOnline_title(title);
			dto.setOnline_content(content);
			dto.setPrice_sat(price_sat);
			dto.setProduct_sat(product_sat);
			dto.setAdd_product(product_add);
			dto.setAdd_receipt(receipt);
			
			int result = biz.insertOnlineService(dto);
			
			if(result>0) {
				jsResponse("리뷰 등록 성공","onlineController?command=list&category="+category_id,response);
			}else {
				jsResponse("리뷰 등록 실패","onlineController?command=list&category="+category_id,response);
			}
			
		}
	
		
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
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url); //메소드 실행시 넘겨줄 url
		dispatch.forward(request, response);
	}
}
