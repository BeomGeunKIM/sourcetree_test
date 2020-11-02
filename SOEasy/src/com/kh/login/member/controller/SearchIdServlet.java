package com.kh.login.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.host.manageReserve.model.vo.PageInfo;
import com.kh.login.member.model.service.MemberService;
import com.kh.login.member.model.vo.Member;

/**
 * Servlet implementation class SearchIdServlet
 */
@WebServlet("/searchId.me")
public class SearchIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchIdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage; //현재 페이지를 표시할 변수
		int limit; //한 페이지에 게시글이 몇 개 보여질 것인지 표시
		int maxPage; //전체 페이지에서 가장 마지막 페이지
		int startPage;// 한번에 표시될 페이지가 시작할 페이지
		int endPage; // 한번에 표시
		String keyword = request.getParameter("keyword");
		keyword = "%"+keyword+"%";
		currentPage = 1;
	

		String url = PageInfo.customQString(request.getQueryString(), 1);
		
		String root = request.getRequestURI();
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		
		int listCount = new MemberService().getListCount(keyword);
		System.out.println("list count : "+ listCount);
		maxPage = (int)((double) listCount / limit +0.9);
		startPage = (((int)((double) currentPage / 10 + 0.9))-1) * 10+1; 
		endPage = startPage + 10-1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage,0);
		ArrayList<Member> memberList = new MemberService().selectAllList(pi,keyword);
	
	
		String page ="";
		
		if(memberList !=null) {
			page = "views/admin/manageMember.jsp";
			request.setAttribute("memberList", memberList);
			request.setAttribute("pi", pi);
			request.setAttribute("url", url);
			request.setAttribute("root", root);
		}else {
			page="views/common/errorpage.jsp";
			request.setAttribute("msg", "회원목록  조회 실패 !");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
