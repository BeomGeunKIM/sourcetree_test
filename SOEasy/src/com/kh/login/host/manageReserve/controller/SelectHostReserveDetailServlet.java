package com.kh.login.host.manageReserve.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.host.manageReserve.model.service.HostReserveService;
import com.kh.login.host.manageReserve.model.vo.HostReserve;

/**
 * Servlet implementation class SelectHostReserveDetailServlet
 */
@WebServlet("/select.hr")
public class SelectHostReserveDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectHostReserveDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reserveNoStr = request.getParameter("reserveNo");
		System.out.println("!!" + reserveNoStr);
		int reserveNo = 78;
		if(request.getParameter("reserveNo") != null) {
			Integer.parseInt(request.getParameter("reserveNo"));
		}
		
		System.out.println("select Reserve Detail reserveNo : " + reserveNo);
		
		HostReserve hostReserve = new HostReserveService().selectOne(reserveNo);
		
		System.out.println("select Reserve Detail hostReserve : " + hostReserve);
		
		String page="";
		if(hostReserve != null) {
			page = "views/host/manageReserve/hostReserveView.jsp";
			request.setAttribute("hostReserve", hostReserve);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "예약 상세 조회 실패!");
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
