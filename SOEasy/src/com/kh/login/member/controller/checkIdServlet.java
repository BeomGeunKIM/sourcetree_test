package com.kh.login.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.member.model.service.MemberService;

@WebServlet("/checkId.me")
public class checkIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public checkIdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("userId");
		System.out.println("userId : "+userId);
		
		int result = new MemberService().idCheck(userId);
		
		PrintWriter out = response.getWriter();
		
		if(result>0) {
			out.append("fail");
		}else {
			out.append("success");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
