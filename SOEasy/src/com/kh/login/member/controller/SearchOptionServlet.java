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
import com.kh.login.member.model.vo.Member;

@WebServlet("/searchOption.me")
public class SearchOptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchOptionServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int activeCode = Integer.parseInt(request.getParameter("isActive"));
		String isActive="";
		switch(activeCode) {
		case 1: isActive="M_STATUS IN('W','N','X','Y')"; break;
		case 2: isActive="M_STATUS='Y'"; break;
		case 3: isActive="M_STATUS IN('W','N','X')"; break;
		}
		System.out.println("이즈액티브"+isActive);
		String root = request.getRequestURI();
		
		String power = "";
		int powerCode = Integer.parseInt(request.getParameter("power"));
		switch(powerCode) {
		case 1: power="AND P_TYPE IN(1,2)"; break;
		case 2: power="AND P_TYPE=1"; break;
		case 3: power="AND P_TYPE=2"; break;
		}

		
		String url = PageInfo.customQString(request.getQueryString(), 2);
		
		int currentPage; //현재 페이지를 표시할 변수
		int limit; //한 페이지에 게시글이 몇 개 보여질 것인지 표시
		int maxPage; //전체 페이지에서 가장 마지막 페이지
		int startPage;// 한번에 표시될 페이지가 시작할 페이지
		int endPage; // 한번에 표시
		
		currentPage = 1;
		
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		
		int listCount = new MemberService().getListCount(isActive,power);
		System.out.println("list count : "+ listCount);
		//총 페이지 수 계산
		//예를 들면 목록 갯수가 123개 이면 
		//총 필요한 페이지 수는 13개임
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
		ArrayList<Member> memberList = new MemberService().selectAllList(pi,isActive,power);
	
	
		String page ="";
		
		if(memberList !=null) {
			page = "views/admin/manageMember.jsp";
			request.setAttribute("memberList", memberList);
			request.setAttribute("pi", pi);
			request.setAttribute("url", url);
			request.setAttribute("root", root);
		}else {
			page="views/common/errorpage.jsp";
			request.setAttribute("msg", "회원목록  조회 실패 !");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
