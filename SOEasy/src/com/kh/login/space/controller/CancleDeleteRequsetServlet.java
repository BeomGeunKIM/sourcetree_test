package com.kh.login.space.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.member.model.vo.Member;
import com.kh.login.space.model.service.SpaceService;

/**
 * Servlet implementation class CancleDeleteRequsetServlet
 */
@WebServlet("/cancleDeleteRequset")
public class CancleDeleteRequsetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancleDeleteRequsetServlet() {
        super();
        // TODO Auto-generated constructor stub
        // test1 to
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int spaceNo = Integer.parseInt(request.getParameter("sNo"));
		
		int result = 0;
		
		result = new SpaceService().cancleDelReq(spaceNo);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectTempSpace?memberNo=" + loginUser.getMemberNo());
		} else {
			request.setAttribute("msg", "怨듦컙 �궘�젣 痍⑥냼 �슂泥� �떎�뙣");
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
