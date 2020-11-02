package com.kh.login.host.manageReserve.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.host.manageReserve.model.service.HostReserveService;
import com.kh.login.host.manageReserve.model.vo.PageInfo;
import com.kh.login.host.manageReserve.model.vo.PaymentRequest;

/**
 * Servlet implementation class SelectPaymentRequest
 */
@WebServlet("/select.pr")
public class SelectPaymentRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPaymentRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		String reserveNo = request.getParameter("reserveNo");
		String hostNo = request.getParameter("hostNo");
		int result = 0;
		
		
		
		int rno = 0;
		if(reserveNo != "" && reserveNo != null) {
			rno = Integer.parseInt(reserveNo);
			System.out.println("update rno : " + reserveNo);
			System.out.println("update rno : " + rno);
		}
		int hno = 0;
		if(hostNo != "" && hostNo != null) {
			hno = Integer.parseInt(hostNo);
			System.out.println("update rno : " + hostNo);
			System.out.println("update rno : " + hno);
		}
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int listCount = new HostReserveService().getListCount(hno);
		int requestCount = new HostReserveService().getRequestCount(rno);
		
		
		maxPage = (int) ((double) listCount / limit + 0.9);
		
		startPage = (((int) ((double) currentPage / 10 + 0.9)) -1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		
		System.out.println("listCount : " + listCount);
		System.out.println("currentPage : " + currentPage);
		System.out.println("limit : " + limit);
		System.out.println("maxPage : " + maxPage);
		System.out.println("startPage : " + startPage);
		System.out.println("endPage : " + endPage);
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage, requestCount);
		
		ArrayList<PaymentRequest> list = new HostReserveService().selectList(pi, hno);
		System.out.println("pay list:" + list);
		
		String page = "";
		if(list != null) {
			page = "/views/host/manageReserve/paymentRequest.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "/views/host/manageReserve/paymentRequest.jsp";
			request.setAttribute("list", list);
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
