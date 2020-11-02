package com.kh.login.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.member.model.service.MemberService;

@WebServlet("/isCorrectPassword.me")
public class isCorrectPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public isCorrectPasswordServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password = request.getParameter("password");
		String userId = request.getParameter("userId");
		
		System.out.println("password : "+password);
		System.out.println("userId :"+userId);
		PrintWriter out = response.getWriter();
		int result = new MemberService().correctPwd(password,userId);
		System.out.println(result);
		if(result>0) {
			out.append(password);
		}
		else {
			out.append("fail");
		}
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
