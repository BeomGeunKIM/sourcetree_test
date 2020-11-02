package com.kh.login.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.common.Certified;
import com.kh.login.member.model.service.MemberService;

/**
 * Servlet implementation class CertificationServlet
 */
@WebServlet("/certification.me")
public class CertificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CertificationServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phoneNum = request.getParameter("phoneNum");
		String name = request.getParameter("name");
		//System.out.println(phoneNum);
		//System.out.println(name);
		PrintWriter out = response.getWriter();
		int result = new MemberService().checkYou(phoneNum, name);
		
		if(name == "" || name==null) {
			out.append("fail2");

		
		}else if(result > 0) {
			out.append("fail");
		}
		else {
		
		String key = new Certified().CertifiedSMS(phoneNum);
		
		//System.out.println(key);
		//System.out.println(phoneNum);
		
		
		out.append(key);
		out.flush();
		out.close();
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
