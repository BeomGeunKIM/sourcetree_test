package com.kh.login.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.guest.model.service.GuestService;
import com.kh.login.guest.model.vo.ReserveHistory;
import com.kh.login.host.manageReserve.model.vo.PageInfo;

@WebServlet("/adminFindReserve.ad")
public class AdminFindReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AdminFindReserveServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage; //현재 페이지를 표시할 변수
		int limit; //한 페이지에 게시글이 몇 개 보여질 것인지 표시
		int maxPage; //전체 페이지에서 가장 마지막 페이지
		int startPage;// 한번에 표시될 페이지가 시작할 페이지
		int endPage; // 한번에 표시
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String userName = request.getParameter("userName");
		
		currentPage = 1;
		String url = "?";
		System.out.println(url);
		String root = request.getRequestURI();
		System.out.println(root);
		
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int listCount = new GuestService().getListReserveCount(memberNo);
		
		System.out.println("list count : "+ listCount);
		//총 페이지 수 계산
		//예를 들면 목록 갯수가 123개 이면 
		//총 필요한 페이지 수는 13개임
		maxPage = (int)((double) listCount / limit +0.9);
	
		//현재 페이지에 보여줄 시작 페이지 수(10개씩 보여지게 할 경우)
		//아래 쪽 페이지 수가 10개씩 보여진다면
		//1,11,21,31 ....
		startPage = (((int)((double) currentPage / 10 + 0.9))-1) * 10+1; 
		
		//목록 아래쪽에 보여질 마지막 페이지 수(10,20,30,...)
		endPage = startPage + 10-1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage,0);
		ArrayList<ReserveHistory> reserveList = new GuestService().getYourReserveList(memberNo);
		System.out.println(reserveList);
	
		String page ="";
		if(reserveList != null) {
			
			request.setAttribute("reserveList", reserveList);
			request.setAttribute("pi", pi);
			request.setAttribute("url", url);
			request.setAttribute("root", root);
			request.setAttribute("msg", "예약 건이 총 "+listCount+" 건이 있습니다");
			request.setAttribute("memberNo", memberNo);
			request.setAttribute("userName", userName);
			page = "/views/guest/reserveList.jsp";
		
		}else {
			if(listCount<0) {
			request.setAttribute("msg", "조회 실패");
			page = "/views/common/errorPage.jsp";
			}else {
				request.setAttribute("reserveList", reserveList);
				request.setAttribute("pi", pi);
				request.setAttribute("url", url);
				request.setAttribute("root", root);
				request.setAttribute("msg", "예약한 기록이 없습니다");
				request.setAttribute("memberNo", memberNo);
				request.setAttribute("userName", userName);
			
				page = "/views/guest/reserveList.jsp";
			}
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
