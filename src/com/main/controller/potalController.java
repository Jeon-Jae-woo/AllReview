package com.main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.biz.PotalMainBiz;
import com.main.biz.PotalMainBizImpl;
import com.main.dto.PotalMainDto;

@WebServlet("/potalController")
public class potalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private PotalMainBiz potalbiz = new PotalMainBizImpl();
	
    public potalController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//command로 핸들링
		String command = request.getParameter("command");
		System.out.println("command : " + command);
		
		if(command.equals("mainPageList")) {
			List<PotalMainDto> allList = potalbiz.PotalMainList();
			
			
			request.setAttribute("allList", allList);
			
			dispatch("index.jsp", request, response);
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
