package com.kh.login.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.member.model.service.MemberService;

@WebServlet("/blockMember.me")
public class BlockMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BlockMemberServlet() {
        super();

        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("blockUser");
		
		
		System.out.println("userId :"+ userId);
	
		
		int result = new MemberService().blockMember(userId);
		
		PrintWriter out = response.getWriter();
		if(result>0) {
		out.append("ok"); //업데이트 성공을 알림
		}else {
		out.append("no"); //업데이트 실패를 알림
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
