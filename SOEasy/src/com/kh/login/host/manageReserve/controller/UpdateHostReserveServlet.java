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
 * Servlet implementation class UpdateHostReserveServlet
 */
@WebServlet("/update.hr")
public class UpdateHostReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateHostReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strReserveNo = request.getParameter("reserveNo");
		String startDay = request.getParameter("startDate");
		String endDay = request.getParameter("endDate");
		int reservePersonCount = Integer.parseInt(request.getParameter("reservPersonCount"));
		String officeNo = request.getParameter("place");
		String userName = request.getParameter("userName");
		String realUserName = request.getParameter("realUserName");
		String userPhone = request.getParameter("userPhone");
		String userEmail = request.getParameter("userEmail");
		String requestContent = request.getParameter("requestContent");
		
		int reserveNo = 0;
		if(strReserveNo != null && strReserveNo != "") {
			reserveNo = Integer.parseInt(strReserveNo);
		}
		System.out.println("select Reserve Detail reserveNo : " + reserveNo);
		
		HostReserve updateReserve = new HostReserve();
		updateReserve.setReserveNo(reserveNo);
		updateReserve.setStartDay(startDay);
		updateReserve.setEndDay(endDay);
		updateReserve.setReservePersonCount(reservePersonCount);
		updateReserve.setOfficeNo(officeNo);
		updateReserve.setUserName(userName);
		updateReserve.setRealUserName(realUserName);
		updateReserve.setPhone(userPhone);
		updateReserve.setEmail(userEmail);
		updateReserve.setRequestContent(requestContent);
		
		
		HostReserve hostReserve = new HostReserveService().updateReserve(reserveNo);
		
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
