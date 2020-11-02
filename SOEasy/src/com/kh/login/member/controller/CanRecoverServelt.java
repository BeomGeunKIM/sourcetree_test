package com.kh.login.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.member.model.service.MemberService;

//탈퇴한 회원이 아직  복구가 가능한지 조회하는 서블릿
@WebServlet("/canRecover.me")
public class CanRecoverServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CanRecoverServelt() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("user");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		PrintWriter out = response.getWriter();
		int result = new MemberService().canRecover(userId, userNo);
		
		if(result==0) {
			out.append("disable");
		
		}else if(result==-1) {
			out.append("error");
		}else if(result==1) {
			out.append("able");
		}else {
			out.append("yet");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
