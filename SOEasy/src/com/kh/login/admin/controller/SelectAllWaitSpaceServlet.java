package com.kh.login.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.admin.model.service.AdminService;
import com.kh.login.host.manageReserve.model.vo.PageInfo;

//공간 검수 요청 접근 서블렛
@WebServlet("/selectAllWaitSpace.ad")
public class SelectAllWaitSpaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectAllWaitSpaceServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage; //현재 페이지를 표시할 변수
		int limit; //한 페이지에 게시글이 몇 개 보여질 것인지 표시
		int maxPage; //전체 페이지에서 가장 마지막 페이지
		int startPage;// 한번에 표시될 페이지가 시작할 페이지
		int endPage; // 한번에 표시
		
		currentPage = 1;
		String url = "?";
		String root = request.getRequestURI();
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		int listCount = new AdminService().getWaitingSpaceListCount();
		System.out.println("list count : "+ listCount);
		maxPage = (int)((double) listCount / limit +0.9);
		startPage = (((int)((double) currentPage / 10 + 0.9))-1) * 10+1; 
		endPage = startPage + 10-1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage,0);
		
		ArrayList<HashMap<String,Object>> waitingList = new AdminService().selectAllWaitingList(pi);
		
		String page = "";
		
		if(waitingList != null) {
			page = "/views/admin/manageArea.jsp";
			request.setAttribute("list", waitingList);
			request.setAttribute("pi", pi);
			request.setAttribute("root", root);
			request.setAttribute("url", url);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "전체 공간 조회 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
