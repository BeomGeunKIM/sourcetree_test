package com.kh.login.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.member.model.service.MemberService;

/**
 * Servlet implementation class FindIdServlet
 */
@WebServlet("/findId.me")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindIdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		int kind = Integer.parseInt(request.getParameter("kindOf"));
		String page = "";
		
		//값이 제대로 넘어왔는지 확인
		System.out.println(name +"   "+ email+ " "+kind);
		
		//아이디 찾기 인경우
		if(kind == 1) {
			String resultId = new MemberService().findId(name,email);
			System.out.println(resultId);
			if(resultId != null) {
				page="views/member/foundId.jsp";
				request.setAttribute("resultId", resultId);
				
			}else {
				page="views/member/findId.jsp";
				request.setAttribute("msg", "일치하는 정보가 없습니다");
			}
			
		}
		//비밀번호 찾기 인경우
		else {
		    String id = name;
			int result = new MemberService().findPwd(id,email);
			System.out.println(result);
			if(result !=0) {
				page="views/member/foundPwd.jsp";
				request.setAttribute("resultPwd", result);
			
			}else {
				page="views/member/findId.jsp";
				request.setAttribute("msg", "일치하는 정보가 없습니다");
			}
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
