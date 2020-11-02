package com.kh.login.space.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.host.manageReserve.model.vo.PageInfo;
import com.kh.login.space.model.service.SearchService;
import com.kh.login.space.model.vo.SpaceInfo;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/select.se")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		System.out.println("search : " + search);
		
//		String root = request.getRequestURI();
//		String url = PageInfo.customQString(request.getQueryString(), 2);
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
	
		String root = request.getRequestURI();
		System.out.println(root);
		String url = PageInfo.customQString(request.getQueryString(), 1);
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 12;
		
		int listCount = new SearchService().getListCount(search);
		
		maxPage = (int) ((double) listCount / limit + 0.9);
		
		startPage = (((int) ((double) currentPage / 10 + 0.9)) -1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		System.out.println("listCount : " + listCount);
		System.out.println("currentPage : " + currentPage);
		System.out.println("limit : " + limit);
		System.out.println("maxPage : " + maxPage);
		System.out.println("startPage : " + startPage);
		System.out.println("endPage : " + endPage);

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage, 0);
		
		ArrayList<HashMap<String, Object>> list = new SearchService().selectList(pi, search);
		
		String page = "";
		if(search != null) {
			page = "/views/space/search1.jsp";
			request.setAttribute("list", list);
			request.setAttribute("search", search);
			request.setAttribute("pi", pi);
			request.setAttribute("root", root);
			request.setAttribute("url", url);
		} else {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "공간 검색 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}