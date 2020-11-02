package com.kh.login.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.host.manageReserve.model.vo.PageInfo;
import com.kh.login.member.model.service.MemberService;
import com.kh.login.member.model.vo.RecoverMember;

//셀렉트 바에 따라 복구 요청 처리 상태에 따른 결과값 조회
@WebServlet("/searchRstatus.me")
public class searchRstatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public searchRstatusServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int status = Integer.parseInt(request.getParameter("rStatus"));
		if(status== 4) {//전체 조회일 경우 원래 전체 조회 서블렛으로 다시 보냄
			response.sendRedirect("/login/selectRecover.me");
		}
		else {
			int currentPage=1; 
			int limit=10;
			int maxPage; 
			int startPage;
			int endPage; 
			String root = request.getRequestURI();
			String url = PageInfo.customQString(request.getQueryString(), 1);
			
			if(request.getParameter("currentPage")!=null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			int listCount = new MemberService().getListOptionCount(status);
			maxPage = (int)((double) listCount / limit +0.9);
			
			//현재 페이지에 보여줄 시작 페이지 수(10개씩 보여지게 할 경우)
			//아래 쪽 페이지 수가 10개씩 보여진다면
			//1,11,21,31 ....
			startPage = (((int)((double) currentPage / 10 + 0.9))-1) * 10+1; 
			
			//목록 아래쪽에 보여질 마지막 페이지 수(10,20,30,...)
			endPage = startPage + 10-1;
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage,0);
			ArrayList<RecoverMember> recoverList = new MemberService().searchRecoverOption(pi,status);
			String page = "";
			if(recoverList !=null) {
				page = "views/admin/memberRecovery.jsp";
				request.setAttribute("recoverList", recoverList);
				request.setAttribute("pi", pi);
				request.setAttribute("url", url);
				request.setAttribute("root", root);
			}else {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "복구목록  조회 실패 !");
			}
			
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
