package com.shop.controller;

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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shop.biz.ShopBiz;
import com.shop.dto.ShopCateDto;
import com.shop.dto.ShopDto;
import com.shop.dto.ShopGroupDto;
import com.user.dto.pagingDto;

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
			String pageNumParam = request.getParameter("pageNum");
			String categoryParam = request.getParameter("category_no");
			
			int pageNum = 0;
			if(pageNumParam == null) {
				pageNum = 1;
			}else {
				pageNum = Integer.parseInt(pageNumParam);
			}
			int category_no = 0;
			
			if(categoryParam == null) {
				category_no = 1;
			}else {
				category_no = Integer.parseInt(categoryParam);
			}
			
			List<ShopDto> list = biz.selectAll(pageNum, category_no);
			pagingDto paging = biz.ShopPaging(pageNum, category_no);
			List<ShopDto> list2 = biz.recoTop();
			List<ShopDto> list3 = biz.hitTop();
			
			
			request.setAttribute("paging", paging);
			request.setAttribute("list", list);
			request.setAttribute("list2", list2);
			request.setAttribute("list3", list3);
			request.setAttribute("category_no", category_no);
			dispatch("shopcate.jsp",request, response);
			
			
		}else if(command.equals("shopsearch")) {
			String pageNumParam = request.getParameter("pageNum");
			String categoryParam = request.getParameter("category_no");
			String searchParam = request.getParameter("search");
			
			
			
			int pageNum = 0;
			if(pageNumParam == null) {
				pageNum = 1;
			}else {
				pageNum = Integer.parseInt(pageNumParam);
			}
			int category_no = 0;
			
			if(categoryParam == null) {
				category_no = 1;
			}else {
				category_no = Integer.parseInt(categoryParam);
			}
			
			String search = "%"+searchParam+"%";
			
			System.out.println(search+"/"+categoryParam+"/"+pageNum);
			
			List<ShopDto> list = biz.ShopSearch(pageNum, category_no, search);
			pagingDto paging = biz.ShopPaging(pageNum, category_no);
			
			
			request.setAttribute("paging", paging);
			request.setAttribute("list", list);
			request.setAttribute("category_no", category_no);
			dispatch("shopcate.jsp",request, response);
			
			
		
	}else if(command.equals("shopinsert")){
			HttpSession session = request.getSession();
			
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
			int cate = Integer.parseInt(multi.getParameter("category"));
			int group = Integer.parseInt(multi.getParameter("group"));
			String title = multi.getParameter("shoptitle");
			String content = multi.getParameter("shopcontent");
			double service = Double.parseDouble(multi.getParameter("service"));
			double clean = Double.parseDouble(multi.getParameter("clean"));
			double traffic = Double.parseDouble(multi.getParameter("traffic"));
			String revisit = multi.getParameter("revisit");
			
			
			
			ShopDto dto = new ShopDto();
			dto.setNickname(nickname);
			dto.setCate_no(cate);
			dto.setGroup_no(group);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setService(service);
			dto.setClean(clean);
			dto.setTraffic(traffic);
			dto.setRevisit(revisit);
			dto.setRecipt_img(receipt);
			dto.setUpload_img(review_img);
			
			
			int res = biz.insert(dto);
			
			if(res>0) {
				jsResponse("글 작성 성공", "shop.do?command=shoplist", response);
				
			}else {
				jsResponse("글 작성 실패", "shop.do?command=shoplist", response);
			}
			
			
			
		}else if(command.equals("shopdetail")) {
			HttpSession session = request.getSession();
			String nickname = (String)session.getAttribute("nickname");
			
			int shopno = Integer.parseInt(request.getParameter("shopno"));
			
			ShopDto dto = biz.selectOne(shopno);
			
			ShopCateDto catedto = biz.selectCate(dto.getCate_no());
			
			ShopGroupDto groupdto = biz.selectGroup(dto.getGroup_no());
			
			int res = biz.inserthit(shopno, nickname);
			
			if(res>0) {
				biz.updatehit(shopno);
			}
			
			
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
			
			
			String dtonickname = dto.getNickname();
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
			
			
			
		}else if(command.equals("reco")) {
			HttpSession session = request.getSession();
			String nickname = (String)session.getAttribute("nickname");
			
			int shopno = Integer.parseInt(request.getParameter("shopno"));
			
			int res = biz.insertreco(shopno,nickname);
			
			if(res>0) {
				biz.updatereco(shopno);
				jsResponse("글 추천 완료", "shop.do?command=shopdetail&shopno="+shopno, response);
			}else {
				jsResponse("이미 추천한 글 입니다.", "shop.do?command=shopdetail&shopno="+shopno, response);
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
