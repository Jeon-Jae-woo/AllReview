package com.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.biz.userBiz;
import com.user.biz.userBizImpl;
import com.user.dto.userDto;

@WebServlet("/userController")
public class userController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private userBiz userbiz = new userBizImpl();

    public userController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//command로 핸들링
		String command = request.getParameter("command");
		System.out.println("command : " + command);
		
		//회원가입
		if(command.equals("join")) {
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String birth1 = request.getParameter("birth1");
			String birth2 = request.getParameter("birth2");
			String birth3 = request.getParameter("birth3");
			String gender = request.getParameter("gender");
			String nickname = request.getParameter("nickname");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			
			String birth = birth1 + birth2 + birth3;
			String address = address1 + address2;
			
			userDto userdto = new userDto();
			userdto.setEmail(email);
			userdto.setPassword(password);
			userdto.setName(name);
			userdto.setBirth(birth);
			userdto.setGender(gender);
			userdto.setNickName(nickname);
			userdto.setAddress(address);
			
			System.out.println(userdto.toString());
			
			int result = userbiz.joinService(userdto);
			
			if(result>0) {
				jsResponse("회원가입 성공!","index.jsp",response);
			}else {
				jsResponse("회원가입 실패!","index.jsp",response);
			}
		}
		//이메일 중복 체크
		else if(command.equals("emailchk")) {
			String email = request.getParameter("email");
			
			System.out.println("이메일 체크 서블릿 실행");
			int result = userbiz.emailChkService(email);
			
			if(result==1) {
				PrintWriter out = response.getWriter();
				out.print(1);	
			}else {
				PrintWriter out = response.getWriter();
				out.print(0);
			}
			
		}
		//nickname 중복 체크
		else if(command.equals("nicknamechk")) {
			System.out.println("별명 체크 서블릿 실행");
			
			String nickname = request.getParameter("nickname");
			
			int result = userbiz.nicknameChkService(nickname);
			
			if(result==1) {
				PrintWriter out = response.getWriter();
				out.print(1);
			}else {
				PrintWriter out = response.getWriter();
				out.print(0);
			}
			
		}
		//로그인 아이디, 비밀번호 체크 / 성공시 세션 생성
		else if(command.equals("loginCheck")) {
			System.out.println("로그인 서블릿 실행");
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			userDto user = new userDto();
			
			user = userbiz.loginChkService(email, password);
			
			//로그인 성공시
			if(user.getEmail() != null) {
				//세션을 만들어서 반환(이메일, 별명, 유저 레벨 정보가 들어있음)
				HttpSession session = request.getSession();
				session.setAttribute("email", user.getEmail());
				session.setAttribute("nickname", user.getNickName());
				session.setAttribute("level", user.getLevelNo());
				
				jsResponse("로그인 성공","index.jsp",response);
			}else {
				jsResponse("아이디 혹은 비밀번호를 잘못 입력하였습니다","login.jsp",response);
			}
			

		} 
		//로그아웃
		else if(command.equals("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			jsResponse("로그아웃 되었습니다","./index.jsp",response);
		}

		//admin
		if(command.equals("adminLevelUpdate")) {
			System.out.println("admin level 서블릿 실행");
			String email = request.getParameter("email");
			int levelNo = Integer.parseInt(request.getParameter("levelNo"));
			int result = userbiz.adminLevelUpdateService(email, levelNo);
			
			//테스트용으로 만듦
			if(result>0) {
				jsResponse("레벨 변환 성공","index.jsp",response);
			}else {
				jsResponse("레벨 변환 실패","index.jsp",response);
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
	
}
