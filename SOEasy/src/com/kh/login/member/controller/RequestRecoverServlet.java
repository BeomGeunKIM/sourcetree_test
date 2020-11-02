package com.kh.login.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.member.model.service.MemberService;

//에이잭스를 활용하여 비동기 방식으로 복구요청정보를 데이터 베이스에게 전송하는 서블렛
@WebServlet("/requestRecover.me")
public class RequestRecoverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RequestRecoverServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String email = request.getParameter("email");
		
		System.out.println("memberNo : "+memberNo);
		System.out.println("email : "+ email);
		PrintWriter out = response.getWriter();
		int result = new MemberService().requestRecover(memberNo, email);
		
		if(result>0) {
			out.append("success");
		}else {
			out.append("fail");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
