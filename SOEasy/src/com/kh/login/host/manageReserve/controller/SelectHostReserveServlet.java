package com.kh.login.host.manageReserve.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.host.manageReserve.model.service.HostReserveService;
import com.kh.login.host.manageReserve.model.vo.HostReserve;
import com.kh.login.member.model.vo.Member;

/**
 * Servlet implementation class SelectHostReserveServlet
 */
@WebServlet("/selectReserve.ho")
public class SelectHostReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectHostReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
//		
		String sHostNo = request.getParameter("hostNo");
		String sSpaceNo = request.getParameter("spaceNo");
		
		int hostNo = loginUser.getMemberNo();
		int spaceNo = new HostReserveService().findspaceNo(hostNo);
		System.out.println(spaceNo);
		
		ArrayList<HostReserve> list = new HostReserveService().selectReserveInfo(hostNo, spaceNo);
		
		for(HostReserve o : list) {
			System.out.println("table servlet : " + o);
		}
		
		int officeCount = new HostReserveService().selectOfficeCount(spaceNo);
		
		System.out.println("servlet officeCount : " + officeCount);
		
		String page = "";
		if(list != null) {
			page = "/views/host/manageReserve/reserveStep1.jsp";
			request.setAttribute("list", list);
			request.setAttribute("officeCount", officeCount);
			request.getRequestDispatcher(page).forward(request, response);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "직접예약 보기 실패!");
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
