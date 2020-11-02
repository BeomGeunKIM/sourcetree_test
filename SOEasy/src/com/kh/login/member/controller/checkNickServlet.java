package com.kh.login.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.member.model.service.MemberService;

/**
 * Servlet implementation class checkNickServlet
 */
@WebServlet("/checkNick.me")
public class checkNickServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public checkNickServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String nickName = request.getParameter("nickName");
		System.out.println(nickName);
		int result = new MemberService().nickCheck(nickName);
		
		PrintWriter out = response.getWriter();
		
		if(result>0) {
			out.append("fail");
		}else {
			out.append("success");
		}
		out.flush();
		out.close();
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
