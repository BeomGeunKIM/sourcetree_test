package com.kh.login.space.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.member.model.vo.Member;
import com.kh.login.space.model.service.SpaceService;
import com.kh.login.space.model.vo.Image;

/**
 * Servlet implementation class DeleteSpaceServlet
 */
@WebServlet("/deleteSpace")
public class DeleteSpaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSpaceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int spaceNo = Integer.parseInt(request.getParameter("sNo"));
		
		int result = 0;
		int kind = 0;
		
		kind = new SpaceService().searchKind(spaceNo);
		
		System.out.println("delete servlet kind : " + kind);
		
		if(kind == 0) {
			request.setAttribute("msg", "미완성 공간 삭제 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		ArrayList<Image> imgList = new SpaceService().selectSpaceImg(spaceNo);
		String root = request.getSession().getServletContext().getRealPath("/");
		
		result = new SpaceService().deleteSpaceInfoAll(spaceNo, kind);
		
		if(result > 0 && kind != 0) {
			for(int i = 0; i < imgList.size(); i++) {
				File failedFile = new File(root + imgList.get(i).getFilePath() + "/" + imgList.get(i).getChangeName());
				//System.out.println(root + imgList.get(i).getFilePath() + "/" + imgList.get(i).getChangeName());
				failedFile.delete();
			}
			
			response.sendRedirect(request.getContextPath() + "/selectTempSpace?memberNo=" + loginUser.getMemberNo());
		} else {
			request.setAttribute("msg", "미완성 공간 삭제 실패");
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
