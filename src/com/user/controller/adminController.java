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
import com.user.dto.pagingDto;
import com.user.dto.userDto;

@WebServlet("/adminController")
public class adminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private adminBiz adminbiz = new adminBizImpl();
	
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
		
		if(command.equals("userList")) {
			
			String pageNumParam = request.getParameter("pageNum");
			int pageNum = 0;
			if(pageNumParam == null) {
				pageNum = 1;
			}else {
				pageNum = Integer.parseInt(pageNumParam);
			}
			
			List<userDto> userlist = adminbiz.allUserListService(pageNum); 
			pagingDto paging = adminbiz.userListPaging(pageNum);
			
			System.out.println();
			for(userDto dto : userlist) {
				System.out.println("---------------------------");
				System.out.println("이메일 : " + dto.getEmail());
				System.out.println("닉네임 : " + dto.getNickName());
				System.out.println("가입일: " + dto.getCreatedAt());
				System.out.println("----------------------------");

			}
			
			System.out.println("----페이징----");
			System.out.println(paging.toString());
			System.out.println("-----------");
			System.out.println();
			
			request.setAttribute("userlist", userlist);
			request.setAttribute("paging", paging);
			
			dispatch("adminUserlist.jsp", request, response);
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
