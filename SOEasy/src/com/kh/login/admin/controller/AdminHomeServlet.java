package com.kh.login.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.admin.model.service.AdminService;
import com.kh.login.admin.model.vo.Synthesis;
import com.kh.login.member.model.vo.RecoverMember;

@WebServlet("/adminHome.ad")
public class AdminHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminHomeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//통계
		Synthesis synth = new AdminService().getAllSynth();
		//회원 복구 건
		ArrayList<RecoverMember> recoverList = new AdminService().getLatestRecoverList();
		// 공간 삭제 요청 건
		ArrayList<HashMap<String, Object>> deleteList = new AdminService(). getLatestDeleteList();
		// 공간 검수 요청 건
		ArrayList<HashMap<String, Object>> waitList = new AdminService().getLatestWaitList();
		// 악성 신고 건 현재 조회 불가
		HashMap<String,Object> adminInfo = null;
		String page = "";
		if(synth != null && recoverList != null && deleteList != null) {
			adminInfo = new HashMap<>();
			adminInfo.put("synth", synth);
			adminInfo.put("recoverList", recoverList);
			adminInfo.put("deleteList", deleteList);
			adminInfo.put("waitList", waitList);
				request.setAttribute("adminInfo", adminInfo);
				page = "/views/admin/adminHome.jsp";
		}
			
		else {
		request.setAttribute("msg", "관리자 페이지 불러오기 실패!");
		page = "/views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
