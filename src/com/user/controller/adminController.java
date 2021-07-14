package com.user.controller;

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

import com.user.biz.adminBiz;
import com.user.biz.adminBizImpl;
import com.user.biz.userBiz;
import com.user.biz.userBizImpl;
import com.user.dto.adminUserDto;
import com.user.dto.pagingDto;
import com.user.dto.totalBoardDto;
import com.user.dto.userDto;

@WebServlet("/adminController")
public class adminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private adminBiz adminbiz = new adminBizImpl();
	private userBiz userbiz = new userBizImpl();
	
    public adminController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("관리자 실행");
		//관리자 체크
		String email = adminCheck(request, response);
		
		//command
		String command = request.getParameter("command");
		System.out.println("command : " + command);
		
		//회원 및 관리자 목록 조회
		if(command.equals("userList")) {
			
			String pageNumParam = request.getParameter("pageNum");
			String adminCheck = request.getParameter("adminCheck");
			
			System.out.println("adminCheck : " + adminCheck);
			
			int pageNum = 0;
			if(pageNumParam == null) {
				pageNum = 1;
			}else {
				pageNum = Integer.parseInt(pageNumParam);
			}
			
			List<userDto> userlist = null;
			pagingDto paging = null;
			if(adminCheck==null) {
				userlist = adminbiz.allUserListService(pageNum); 
				paging = adminbiz.userListPaging(pageNum);
			}
			else if(adminCheck.equals("true")) {
				userlist = adminbiz.adminUserListService(pageNum);
				paging = adminbiz.adminListPaging(pageNum);
			}
			
			for(userDto dto : userlist) {
				System.out.println("----");
				System.out.println(dto.getEmail());
				System.out.println("----");
			}
			
			System.out.println("끝");
			request.setAttribute("userlist", userlist);
			request.setAttribute("paging", paging);
			
			dispatch("adminUserlist.jsp", request, response);
		}
		//유저 상세 정보
		else if(command.equals("userdetail")) {
			String user = request.getParameter("email");
			
			String category = request.getParameter("category");
			String pageNumParam = request.getParameter("pageNum");
			
			int pageNum = 0;
			if(pageNumParam == null) {
				pageNum = 1;
			}else {
				pageNum = Integer.parseInt(pageNumParam);
			}
			if(category==null) {
				category="매장";
			}
			
			adminUserDto userdetail = adminbiz.userdetailService(user);
			
			List<totalBoardDto> totalList = userbiz.userWriteListService(userdetail.getNickname(), pageNum, category);
			
			request.setAttribute("userdetail", userdetail);
			
			pagingDto paging = userbiz.writeListPaging(userdetail.getNickname(), pageNum, category);
			request.setAttribute("totalList", totalList);
			request.setAttribute("paging", paging);
			request.setAttribute("category", category);
			request.setAttribute("email", email);
			dispatch("adminUserdetail.jsp", request, response);
						

		}
		//유저 정보 업데이트
		else if(command.equals("userUpdate")) {
			System.out.println("admin 유저 업데이트 서블릿 실행");
			
			String userEmail = request.getParameter("email");
			int statusNo = Integer.parseInt(request.getParameter("statusSelect"));
			int levelNo = Integer.parseInt(request.getParameter("levelSelect"));
			
			int result = adminbiz.userUpdateService(userEmail, statusNo, levelNo);
	
			if(result>0) {
				jsResponse("회원 정보 수정 성공", "adminController?command=userdetail&email="+userEmail, response);
			}else {
				jsResponse("회원 정보 수정 실패", "adminController?command=userdetail&email="+userEmail, response);
			}		
		}
		//승인 대기중인 글 -> status = 0 , 승인 거절된 글 -> status = 2
		else if(command.equals("waitList")) {
			System.out.println("wait list 서블릿 실행 ! ");
			String category = request.getParameter("category");
			String pageNumParam = request.getParameter("pageNum");
			String statusParam = request.getParameter("status");
			
			
			System.out.println("카테고리 값 : " + category);
			System.out.println("page 값 : " + pageNumParam);
			System.out.println("status 값 : " + statusParam);
			
			int status = 0;
			if(statusParam == null) {
				status = 0;
			}else {
				status = Integer.parseInt(statusParam);
			}
			System.out.println("status 값 : " + status);
			int pageNum = 0;
			if(pageNumParam == null) {
				pageNum = 1;
			}else {
				pageNum = Integer.parseInt(pageNumParam);
			}
			if(category==null) {
				category="매장";
			}
			
			//status를 보내야함
			List<totalBoardDto> totalList = adminbiz.waitListService(pageNum, category, status);
			pagingDto paging = adminbiz.waitListPaging(pageNum, category, status);
			
			request.setAttribute("totalList", totalList);
			request.setAttribute("paging", paging);
			request.setAttribute("category", category);
			request.setAttribute("status", status);
			dispatch("adminWaitboard.jsp", request, response);
			
			
		}
		//글 승인 및 거절
		else if(command.equals("approval")) {
			int status = Integer.parseInt(request.getParameter("status"));
			String bigCate = request.getParameter("bigCate");
			int review_id = Integer.parseInt(request.getParameter("review_id"));
			
			System.out.println("status = " + status);
			System.out.println("bigCate = " + bigCate);
			System.out.println("review_id = " + review_id);
			
			
			int result = adminbiz.approvalService(status, bigCate, review_id);
			
			if(result>0) {
				jsResponse("정상적으로 처리되었습니다", "adminController?command=waitList", response);
			}else {
				jsResponse("실패했습니다", "adminController?command=waitList", response);
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
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	/*
	 * 부가 기능
	 */
	private String adminCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Integer userLevel = (Integer)session.getAttribute("level");
		if(userLevel==3) {
			jsResponse("접근할 수 없습니다", "index.jsp", response);
		}
		
		return (String)session.getAttribute("email");
		
	}
}
