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
import com.kh.login.member.model.vo.Member;

/**
 * Servlet implementation class UpdatePaymentRequest
 */
@WebServlet("/update.pr")
public class UpdatePaymentRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePaymentRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		String num = request.getParameter("num");
		String reserveNo = request.getParameter("reserveNo");
		String hno = request.getParameter("hostNo");
		int result = 0;
		
		
		int rno = 0;
		if(reserveNo != "" && reserveNo != null) {
			rno = Integer.parseInt(reserveNo);
			System.out.println("update rno : " + reserveNo);
			System.out.println("update rno : " + rno);
		}
		int nno = 0;
		if(num != "" && num != null) {
			nno = Integer.parseInt(num);
			System.out.println("update num : " + num);
			System.out.println("update nno : " + nno);
		}
		int hostNo = 0;
		if(hno != "" && hno != null) {
			hostNo = Integer.parseInt(hno);
			System.out.println("update hostNo : " + hostNo);
			System.out.println("update nno : " + hno);
		}
		
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int listCount = new HostReserveService().getListCount(hostNo);
		int requestCount = new HostReserveService().getRequestCount(hostNo);
		
		
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
		
		ArrayList<PaymentRequest> list = new HostReserveService().updateReserveRequest(pi, nno, rno);
		
		String page = "";
		if(list != null) {
//			page = "/views/host/manageReserve/paymentRequest.jsp";
//			request.setAttribute("list", list);
//			request.setAttribute("pi", pi);
			response.sendRedirect(request.getContextPath() + "/select.pr?hostNo=" + loginUser.getMemberNo());
		} else {
			page = "/views/host/manageReserve/paymentRequest.jsp";
			request.setAttribute("list", list);
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
