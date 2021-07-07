package com.shop.controller;

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

import com.shop.biz.ShopBiz;
import com.shop.dto.ShopCateDto;
import com.shop.dto.ShopDto;
import com.shop.dto.ShopGroupDto;

@WebServlet("/shop.do")
public class ShopController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShopController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[command: " +command+"]");
		
		ShopBiz biz = new ShopBiz();
		
		if(command.equals("shoplist")) {
			List<ShopDto> list = biz.selectAll();
			
			request.setAttribute("list", list);
			dispatch("shopcate.jsp",request, response);
			
			
		}else if(command.equals("shopinsert")){
			HttpSession session = request.getSession();
			
			String nickname = (String)session.getAttribute("nickname");
			int cate = Integer.parseInt(request.getParameter("category"));
			int group = Integer.parseInt(request.getParameter("group"));
			String title = request.getParameter("shoptitle");
			String content = request.getParameter("shopcontent");
			double service = Double.parseDouble(request.getParameter("service"));
			double clean = Double.parseDouble(request.getParameter("clean"));
			double traffic = Double.parseDouble(request.getParameter("traffic"));
			String revisit = request.getParameter("revisit");
			
			
			
			ShopDto dto = new ShopDto();
			dto.setnickname(nickname);
			dto.setCate_no(cate);
			dto.setGroup_no(group);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setService(service);
			dto.setClean(clean);
			dto.setTraffic(traffic);
			dto.setRevisit(revisit);
			
			int res = biz.insert(dto);
			
			if(res>0) {
				jsResponse("글 작성 성공", "shop.do?command=shoplist", response);
				
			}else {
				jsResponse("글 작성 실패", "shop.do?command=shoplist", response);
			}
			
			
			
		}else if(command.equals("shopdetail")) {
			int shopno = Integer.parseInt(request.getParameter("shopno"));
			
			ShopDto dto = biz.selectOne(shopno);
			
			ShopCateDto catedto = biz.selectCate(dto.getCate_no());
			
			ShopGroupDto groupdto = biz.selectGroup(dto.getGroup_no());
			
			request.setAttribute("dto", dto);
			request.setAttribute("catedto", catedto);
			request.setAttribute("groupdto", groupdto);
			dispatch("shopdetail.jsp", request, response);
			
		}else if(command.equals("shopwriteform")) {
			HttpSession session = request.getSession();
			
			System.out.println(session.getAttribute("nickname"));
			
			if(session.getAttribute("nickname") == null) {
				jsResponse("로그인을 해주세요.", "index.jsp", response);
			}else {
				response.sendRedirect("shopwrite.jsp");
			}
			
			
		}else if(command.equals("shopdelete")) {
			int shopno = Integer.parseInt(request.getParameter("shopno"));
			
			int res = biz.delete(shopno);
			
			if(res>0) {
				jsResponse("글 삭제 성공", "shop.do?command=shoplist", response);
			}else {
				jsResponse("글 삭제 실패", "shop.do?command=shopdetail&shopno="+shopno, response);
			}
			
			
		}else if(command.equals("shopupdateform")) {
			HttpSession session = request.getSession();
			
			int shopno = Integer.parseInt(request.getParameter("shopno"));
			
			ShopDto dto = biz.selectOne(shopno);
			
			
			String dtonickname = dto.getnickname();
			String nickname = (String)session.getAttribute("nickname");
			System.out.println(dtonickname +"/"+session.getAttribute("nickname"));
			
			if(nickname.equals(dtonickname) ) {
				request.setAttribute("dto", dto);
				dispatch("shopupdate.jsp", request, response);
			}else {
				jsResponse("본인의 글이 아닙니다.", "shop.do?command=shopdetail&shopno="+shopno, response);
			}
		}else if(command.equals("shopupdate")) {
			int shopno = Integer.parseInt(request.getParameter("shopno"));
			String content = request.getParameter("content");
			double service = Double.parseDouble(request.getParameter("service"));
			double clean = Double.parseDouble(request.getParameter("clean"));
			double traffic = Double.parseDouble(request.getParameter("traffic"));
			int group = Integer.parseInt(request.getParameter("group"));
			String revisit = request.getParameter("revisit");
			
			
			ShopDto dto = new ShopDto(shopno,group,content,service,clean,traffic,revisit);
			
			
			int res = biz.update(dto);
			
			if(res>0) {
				jsResponse("글 수정 성공", "shop.do?command=shopdetail&shopno="+shopno, response);
			}else {
				jsResponse("글 수정 실패", "shop.do?command=shopdetail&shopno="+shopno, response);
			}
			
			
			
		}
		
		
		
		
		
		
	
	}
	
	
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"
				 +	"alert('"+msg+"');"
				 +	"location.href='"+url+"';"
				 +	"</script>";
		
		PrintWriter out = response.getWriter();
		out.print(s);
	}
	
	
	
	
	
	
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
