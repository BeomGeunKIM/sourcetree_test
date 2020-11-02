package com.kh.login.host.manageReserve.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.host.manageReserve.model.service.HostReserveService;
import com.kh.login.host.manageReserve.model.vo.HostReservation;
import com.kh.login.member.model.vo.Member;
import com.kh.login.space.model.service.SpaceReservationService;
import com.kh.login.space.model.vo.SpaceReservation;

/**
 * Servlet implementation class InsertHostReserveServlet
 */
@WebServlet("/insertReserve.ho")
public class InsertHostReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertHostReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("인서트 호스트 직접예약");
		//vo에서 int형으로 선언해준것들은 파싱해줌
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		
		int hostNo = loginUser.getMemberNo();
		int spaceNo = 6;
		spaceNo = new HostReserveService().findspaceNo(hostNo);
		
		String fixUnfix = "";
		if (request.getParameter("seat") != null && request.getParameter("seat") != "") {
			fixUnfix = request.getParameter("seat");
		}
		
		String officeNo = "";
		if (request.getParameter("officeNo") != null && request.getParameter("officeNo") != "") {
			officeNo = request.getParameter("officeNo");
		}
		
		
		String[] startDates = request.getParameter("startDate").split("-");
		String startDate = startDates[0] + startDates[1] + startDates[2];
		String[] endDates = request.getParameter("endDate").split("-");
		String endDate = endDates[0] + endDates[1] + endDates[2];
		System.out.println(startDate + ", " + endDate);
		int reservPersonCount = Integer.parseInt(request.getParameter("reservPersonCount"));
		
//		if(request.getParameter("spaceNo") != null) {
//			spaceNo = Integer.parseInt(request.getParameter("spaceNo"));
//		}
		int didHostOk = 1;
		int reservStatus = 1;
		String didReview = "WAIT";
		String reservDate = "SYSDATE"; //SYSDATE
		int expectPay = 0;
		if(request.getParameter("expectPay") != null) {
			expectPay = Integer.parseInt(request.getParameter("expectPay"));
		}
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("userPhone");
		String userEmail = request.getParameter("userEmail");
		String requestContent =request.getParameter("requestContent");
		
		HostReservation hostReservation = new HostReservation();
		hostReservation.setHostNo(hostNo);
		hostReservation.setSpaceNo(spaceNo);
		hostReservation.setFixUnfix(fixUnfix);
		hostReservation.setOfficeNo(officeNo);
		hostReservation.setStartDate(startDate);hostReservation.setEndDate(endDate);
		hostReservation.setReservPersonCount(reservPersonCount);
		hostReservation.setDidHostOk(didHostOk);
		hostReservation.setReservStatus(reservStatus);
		hostReservation.setDidReview(didReview);
		//reservDate는 쿼리문에서 SYSDATE로 넣을거기 때문에 여기서 전달 X
		hostReservation.setExpectPay(expectPay);
		hostReservation.setUserName(userName);
		hostReservation.setUserPhone(userPhone);
		hostReservation.setUserEmail(userEmail);
		hostReservation.setRequestContent(requestContent);
		
//		int result = new SpaceReservationService().insertReservation(requestMember);
		ArrayList<HashMap<String,Object>> list = new HostReserveService().insertHostReserve(hostReservation, hostNo, spaceNo);
		
		
		System.out.println(userName);
		
		String page = "";
		if(list != null) {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "예약이 성공적으로 완료되었습니다.");
			request.getRequestDispatcher(page).forward(request, response);
//			page = "/views/host/manageReserve/hostReserveView.jsp";
//			request.setAttribute("reserveNo", "insertReservationInfo");
//			request.setAttribute("list", list);
//			request.getRequestDispatcher(page).forward(request, response);
		} else {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "예약정보 insert 실패");
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
