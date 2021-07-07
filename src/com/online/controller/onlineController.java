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

import com.online.biz.onlineBiz;
import com.online.biz.onlineBizImpl;
import com.online.dto.onlineDto;

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
			List<onlineDto> list = biz.selectAll();
			
			request.setAttribute("list", list);
			dispatch("board_main.jsp",request,response);
			
			
		//카테고리 게시판 별 조회
		}else if(command.equals("fashion")) {
			List<onlineDto> fashion = biz.selectFashion();
			
			request.setAttribute("fashion", fashion);
			dispatch("board_fashion.jsp",request,response);
			
			
		}else if(command.equals("beauty")) {
			List<onlineDto> beauty= biz.selectBeauty();
			
			request.setAttribute("beauty", beauty);
			dispatch("board_beauty.jsp",request,response);
			
			
		}else if(command.equals("food")) {
			List<onlineDto> food = biz.selectFood();
			
			request.setAttribute("food", food);
			dispatch("board_food.jsp",request,response);
			
		}else if(command.equals("home")) {
			List<onlineDto> home = biz.selectHome();
			
			request.setAttribute("home", home);
			dispatch("board_home.jsp",request,response);
			
		}else if(command.equals("digital")) {
			List<onlineDto> digital = biz.selectDigital();
			
			request.setAttribute("digital", digital);
			dispatch("board_digital.jsp",request,response);
			
		}else if(command.equals("appliances")) {
			List<onlineDto> appliances = biz.selectAppliances();
				
			request.setAttribute("appliances", appliances);
			dispatch("board_appliances.jsp",request,response);
			
		}else if(command.equals("childcare")) {
			List<onlineDto> childcare = biz.selectChildcare();
				
			request.setAttribute("childcare", childcare);
			dispatch("board_childcare.jsp",request,response);
			
		}else if(command.equals("medical")) {
			List<onlineDto> medical = biz.selectMedical();
				
			request.setAttribute("medical", medical);
			dispatch("board_medical.jsp",request,response);
			
		}else if(command.equals("hobby")) {
			List<onlineDto> hobby = biz.selectHobby();
				
			request.setAttribute("hobby", hobby);
			dispatch("board_hobby.jsp",request,response);
			
		}else if(command.equals("sports")) {
			List<onlineDto> sports = biz.selectSports();
				
			request.setAttribute("sports", sports);
			dispatch("board_sports.jsp",request,response);
			
		}else if(command.equals("pet")) {
			List<onlineDto> pet = biz.selectPet();
				
			request.setAttribute("pet", pet);
			dispatch("board_pet.jsp",request,response);
			
			
		}else if(command.equals("car")) {
			List<onlineDto> car = biz.selectCar();
					
			request.setAttribute("car", car);
			dispatch("board_car.jsp",request,response);
				
			
		//상세조회
		} else if(command.equals("detail")) {
			int online_board_id = Integer.parseInt(request.getParameter("online_board_id"));
			
			onlineDto dto = biz.selectOne(online_board_id);
			
			request.setAttribute("dto", dto);
			dispatch("boarddetail.jsp",request,response);
			
			
			
		} else if(command.equals("writeform")) {
			response.sendRedirect("boardwrite.jsp");
		}else if(command.equals("boardwrite")) {
			
			
		}else if(command.equals("updateform")) {
			
		}else if(command.equals("boardupdate")) {
			
		}else if(command.equals("delete")) {
			int online_board_id = Integer.parseInt(request.getParameter("online_board_id"));
			
			boolean res = biz.delete(online_board_id);
			
			if(res) {
				jsResponse("글 삭제 성공", "controller.do?command=list", response);
			}else {
				jsResponse("글 삭제 실패", "controller.do?command=detail&online_board_id="+online_board_id,response);
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
