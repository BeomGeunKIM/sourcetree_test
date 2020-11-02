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
import com.kh.login.guest.model.service.GuestService;
import com.kh.login.host.manageReserve.model.vo.PageInfo;

@WebServlet("/adminDeleteAreaRequest.ad")
public class AdminDeleteAreaRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminDeleteAreaRequestServlet() {
        super();
    }
//
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage; //현재 페이지를 표시할 변수
		int limit; //한 페이지에 게시글이 몇 개 보여질 것인지 표시
		int maxPage; //전체 페이지에서 가장 마지막 페이지
		int startPage;// 한번에 표시될 페이지가 시작할 페이지
		int endPage; // 한번에 표시
		
		currentPage = 1;
		String url = "?";
		System.out.println(url);
		String root = request.getRequestURI();
		
			
		
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		int listCount = new AdminService().getDeleteRequestListCount();
		System.out.println("list count : "+ listCount);
		maxPage = (int)((double) listCount / limit +0.9);
		startPage = (((int)((double) currentPage / 10 + 0.9))-1) * 10+1; 
		endPage = startPage + 10-1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage,0);
		
		ArrayList<HashMap<String,Object>> deleteList = new AdminService().selectAllDeleteList(pi);
		System.out.println(deleteList);
		String page = "";
		if(deleteList != null) {
			page = "/views/admin/deleteAreaRequest.jsp";
			request.setAttribute("list", deleteList);
			request.setAttribute("pi", pi);
			request.setAttribute("root", root);
			request.setAttribute("url", url);
		} else {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "공간 삭제 요청 로드 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
