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
import com.kh.login.space.model.service.SpaceService;
import com.kh.login.space.model.vo.SpaceInfo;

/**
 * Servlet implementation class UpdateSpaceStep2Servlet
 */
@WebServlet("/updateSpaceStep2")
public class UpdateSpaceStep2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSpaceStep2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		ArrayList<HashMap<String,Object>> siList = (ArrayList<HashMap<String,Object>>) request.getSession().getAttribute("siList");
		HashMap<String, Object> hmap = siList.get(0);
		
		SpaceInfo getSi = (SpaceInfo) hmap.get("spaceInfo");
		
		SpaceInfo si = new SpaceInfo();
		si.setSpaceNo(getSi.getSpaceNo());
		
		//입력받은 값들 null값 처리
		int monthPay = 0;
		int dayPay = 0;
		
		if(request.getParameter("month-pay") == null || request.getParameter("month-pay") == "") {
		} else {
			monthPay = Integer.parseInt(request.getParameter("month-pay"));
		}
		if(request.getParameter("day-pay") == null || request.getParameter("day-pay") == "") {
		} else {
			dayPay = Integer.parseInt(request.getParameter("day-pay"));
		}
		
		String didDayReserv = "N";
		String didMonthReserv = "N";
		if(monthPay > 0) {
			didMonthReserv = "Y";
		}
		if (dayPay > 0) {
			didDayReserv = "Y";
		}
		
		//공간 운영시간
		//월
		String monOpenCheck = request.getParameter("mon-open-check").toUpperCase();
		int monStartTime = Integer.parseInt(request.getParameter("mon-start-time"));
		int monEndTime = Integer.parseInt(request.getParameter("mon-end-time"));
		//화
		String tueOpenCheck = request.getParameter("tue-open-check").toUpperCase();
		int tueStartTime = Integer.parseInt(request.getParameter("tue-start-time"));
		int tueEndTime = Integer.parseInt(request.getParameter("tue-end-time"));
		//수
		String wedOpenCheck = request.getParameter("wed-open-check").toUpperCase();
		int wedStartTime = Integer.parseInt(request.getParameter("wed-start-time"));
		int wedEndTime = Integer.parseInt(request.getParameter("wed-end-time"));
		//목
		String thuOpenCheck = request.getParameter("thu-open-check").toUpperCase();
		int thuStartTime = Integer.parseInt(request.getParameter("thu-start-time"));
		int thuEndTime = Integer.parseInt(request.getParameter("thu-end-time"));
		//금
		String friOpenCheck = request.getParameter("fri-open-check").toUpperCase();
		int friStartTime = Integer.parseInt(request.getParameter("fri-start-time"));
		int friEndTime = Integer.parseInt(request.getParameter("fri-end-time"));
		//토
		String satOpenCheck = request.getParameter("sat-open-check").toUpperCase();
		int satStartTime = Integer.parseInt(request.getParameter("sat-start-time"));
		int satEndTime = Integer.parseInt(request.getParameter("sat-end-time"));
		//일
		String sunOpenCheck = request.getParameter("sun-open-check").toUpperCase();
		int sunStartTime = Integer.parseInt(request.getParameter("sun-start-time"));
		int sunEndTime = Integer.parseInt(request.getParameter("sun-end-time"));
		
		String[] openChecks = new String[] {monOpenCheck, tueOpenCheck, wedOpenCheck, thuOpenCheck, friOpenCheck, satOpenCheck, sunOpenCheck};
		int[] startTimes = new int[] {monStartTime, tueStartTime, wedStartTime, thuStartTime, friStartTime, satStartTime, sunStartTime};
		int[] endTimes = new int[] {monEndTime, tueEndTime, wedEndTime, thuEndTime, friEndTime, satEndTime, sunEndTime};

		//일자별 환불율
		//8일전부터 받기
		
		double day8 = 0;
		double day7 = 0;
		double day6 = 0;
		double day5 = 0;
		double day4 = 0;
		double day3 = 0;
		double day2 = 0;
		double day1 = 0;
		double day0 = 0;
		
		double[] spaceRefundPolicy = new double[] {day0, day1, day2, day3, day4, day5, day6, day7, day8};
		
		for(int i = 8; i >= 0; i --) {
			if(request.getParameter("day" + i + "-rate") == null || request.getParameter("day" + i + "-rate") == "") {
				System.out.println("혹시 값이 널입니까?");
			} else {
				if(i == 0) {
					spaceRefundPolicy[i] = 0;
				} else {
					spaceRefundPolicy[i] = Double.parseDouble(request.getParameter("day" + i + "-rate"));
				}
			}
		}
		System.out.println("step2 : " + si);
		// spaceInfo에 값 집어넣기.
		si.setDidDayReserv(didDayReserv);
		si.setDidMonthReserv(didMonthReserv);
		si.setDayPay(dayPay);
		si.setMonthPay(monthPay);
		si.setOpenChecks(openChecks);
		si.setStartTimes(startTimes);
		si.setEndTimes(endTimes);
		si.setSpaceRefundPolicy(spaceRefundPolicy);
		
		int result = new SpaceService().updateSpaceStep2(si);
		
		System.out.println("update2 si : " + si);
		
		if(result > 0 ) {
			response.sendRedirect(request.getContextPath() + "/selectTempSpace?memberNo=" + loginUser.getMemberNo());
		} else {
			request.setAttribute("msg", "공간 가격정보 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
