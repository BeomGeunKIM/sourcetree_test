package com.kh.login.space.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.space.model.service.SpaceService;
import com.kh.login.space.model.vo.SpaceInfo;

/**
 * Servlet implementation class SelectTempAreaServlet
 */
@WebServlet("/selectTempSpace")
public class SelectTempAreaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectTempAreaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		//SpaceInfo에 SPACE_NO, SPACE_NAME, S_STATUS, SPACE_KIND, SPACE_SHORT_INTRO 가져오기
		ArrayList<SpaceInfo> siList = new SpaceService().selectTempSpaceOfOneMember(memberNo);
		//널인 경우가 생기지 않게 메인페이지에서 ajax처리 완료
		if(siList != null) {
			request.setAttribute("siList", siList);
			request.getRequestDispatcher("/views/guest/savetemporaryArea.jsp").forward(request, response);;
		} else {
			request.setAttribute("msg", "내 공간 관리 접근 실패!");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);;
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
