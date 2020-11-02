package com.kh.login.space.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.member.model.vo.Member;
import com.kh.login.space.model.service.SpaceReservationService;

import com.kh.login.space.model.vo.Image;
import com.kh.login.space.model.vo.QnA;
import com.kh.login.space.model.vo.Review;

import com.kh.login.space.model.vo.SpaceInfo;
import com.kh.login.space.model.vo.SpaceReservation;

@WebServlet("/insertReservationInfo")
public class InsertReservationInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertReservationInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>) request.getSession().getAttribute("introList");
		HashMap<String, Object> hmap = list.get(0);

		SpaceInfo si = (SpaceInfo) hmap.get("spaceInfo");

		ArrayList<Image> imgList = (ArrayList<Image>) hmap.get("imgList");
		ArrayList<Review> reviewList = (ArrayList<Review>) hmap.get("reviewList");
		ArrayList<QnA> qnaList = (ArrayList<QnA>) hmap.get("qnaList");

		String roadAddrPart1 = si.getSpaceLocationFilter().split(",")[0];  
		
		int guestNo = loginUser.getMemberNo();
		int spaceNo = si.getSpaceNo();
		
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
		int didHostOk = 1;
		int reservStatus = 1;
		String didReview = "WAIT";
		String reservDate = "SYSDATE";
		int expectPay = Integer.parseInt(request.getParameter("expectPay"));
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("userPhone");
		String userEmail = request.getParameter("userEmail");
		String requestContent =request.getParameter("requestContent");
		
		SpaceReservation requestMember = new SpaceReservation();
		requestMember.setGuestNo(guestNo);
		requestMember.setFixUnfix(fixUnfix);
		requestMember.setOfficeNo(officeNo);
		requestMember.setStartDate(startDate);
		requestMember.setEndDate(endDate);
		requestMember.setReservPersonCount(reservPersonCount);
		requestMember.setDidHostOk(didHostOk);
		requestMember.setReservStatus(reservStatus);
		requestMember.setDidReview(didReview);
		requestMember.setExpectPay(expectPay);
		requestMember.setUserName(userName);
		requestMember.setUserPhone(userPhone);
		requestMember.setUserEmail(userEmail);
		requestMember.setRequestContent(requestContent);
		
		ArrayList<HashMap<String,Object>> returnList = new SpaceReservationService().insertReservation(requestMember, si);
		
		String page = "";
		if(returnList != null) {
			response.sendRedirect(request.getContextPath()+"/SelectUserReservHistory");
		} else {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "예약정보 insert 실패");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
