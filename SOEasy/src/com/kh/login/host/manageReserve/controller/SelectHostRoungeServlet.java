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
 * Servlet implementation class SelectHostRoungeServlet
 */
@WebServlet("/Select.ro")
public class SelectHostRoungeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectHostRoungeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		int hostNo = loginUser.getMemberNo();
		int spaceNo = new HostReserveService().findspaceNo(hostNo);
		System.out.println(spaceNo);
		
		ArrayList<HostReserve> list = new HostReserveService().selectRoungeInfo(hostNo, spaceNo);
		
		
		
		String page = "";
		if(list != null) {
			page = "/views/host/manageReserve/rounge1.jsp";
			request.setAttribute("list", list);
			request.getRequestDispatcher(page).forward(request, response);
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
