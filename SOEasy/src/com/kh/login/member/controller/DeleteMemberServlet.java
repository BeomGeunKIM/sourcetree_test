package com.kh.login.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.member.model.service.MemberService;

@WebServlet("/deleteMember.me")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String reason = request.getParameter("reason");
		
		System.out.println("userId : "+userId);
		System.out.println("password : "+password);
		System.out.println("reason :"+reason);
		
		int result = new MemberService().deleteMember(userId, password,reason);
		
		
	
		String page = "";
		if(result>0) {
			page = request.getContextPath()+"/logout.me";
			response.sendRedirect(page);
		
			
		}else {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "회원탈퇴에 실패하였습니다");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
