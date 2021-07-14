package com.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import com.oreilly.servlet.MultipartRequest;


@WebServlet("/noticeController")
public class noticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public noticeController() {
        super();
    }

	/*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		
		//command
		
		System.out.println("command : " + command);
		
		if(command.equals("noticeWrite")) {
			HttpSession session = request.getSession();
			if(session.getAttribute("email") == null) {
				jsResponse("로그인이 되어있지 않습니다", "index.jsp", response);
			}
			
			String nickname = (String)session.getAttribute("nickname");
			System.out.println(nickname);
			
			String realFolder="";
			String saveFolder = "resources/uploadImage";		//사진을 저장할 경로
			String encType = "utf-8";				//변환형식
			int maxSize=5*2048*2048;				//사진의 size
			
			ServletContext context = this.getServletContext();		//절대경로를 얻는다
			realFolder = context.getRealPath(saveFolder);
			
			System.out.println(realFolder);
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
	                   new DefaultFileRenamePolicy());
			
			
			String fileRealName = multi.getFilesystemName("file1");
			
			System.out.println("file1 + " + fileRealName);
			
			String fileRealName2 = multi.getFilesystemName("file2");
			
			System.out.println("file2 + " + fileRealName2);
			
			fileDto dto = new fileDto();
			dto.setTitle(multi.getParameter("title"));
			dto.setImgName(fileRealName);
			dto.setImgName2(fileRealName2);
			
			
			//fileDao filedao = new fileDao();
			int result = filedao.fileInsert(dto);
			
			System.out.println(result);
			
			request.setAttribute("dto", dto);
			dispatch("notice2.jsp", request, response);
		}
		else if(command.equals("detail")) {
			
			
			
			
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private String adminCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Integer userLevel = (Integer)session.getAttribute("level");
		if(userLevel==3) {
			jsResponse("접근할 수 없습니다", "index.jsp", response);
		}
		
		return (String)session.getAttribute("email");
		
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
	*/
}
