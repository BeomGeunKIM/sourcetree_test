package com.kh.login.space.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.space.model.service.SpaceService;

/**
 * Servlet implementation class IntoUpdateSpaceServlet
 */
@WebServlet("/intoUpdateSpace")
public class IntoUpdateSpaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntoUpdateSpaceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("intoUpS : " + request.getParameter("sNo"));
		int sNo = Integer.parseInt(request.getParameter("sNo"));
		
		ArrayList<HashMap<String,Object>> list = new SpaceService().selectOneSpaceInfo(sNo);
		System.out.println("intoUpS : " + list);
		
		String page = "";
		if(list != null) {
			page = "/views/space/updateSpaceStep1.jsp";
			request.getSession().setAttribute("siList", list);
			request.getRequestDispatcher(page).forward(request, response);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공간 정보 수정 접근 실패");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
