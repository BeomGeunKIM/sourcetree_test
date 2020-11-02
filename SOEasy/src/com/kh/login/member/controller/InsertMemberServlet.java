package com.kh.login.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.member.model.service.MemberService;
import com.kh.login.member.model.vo.Member;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/insert.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String nickName= request.getParameter("nickName");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String phoneNum= request.getParameter("phoneNum");
		String email = request.getParameter("email");
		String root = request.getSession().getServletContext().getRealPath("/");
		String filePath = "/images/etc/";
		String defaultProfile = "soeasyProf.png";
		Member requestMember = new Member();
		requestMember.setmId(userId);
		requestMember.setmNick(nickName);
		requestMember.setmName(name);
		requestMember.setmPassword(password);
		requestMember.setmPhone(phoneNum);
		requestMember.setmEmail(email);
		requestMember.setFilePath(filePath);
		requestMember.setOriginName(defaultProfile);
		requestMember.setChangeName(defaultProfile);
		
		//System.out.println(requestMember);
		
		
		int result = new MemberService().insertMember(requestMember);
		
		String page = "";
		
		if(result > 0) {
			page="views/common/successPage.jsp";
			request.setAttribute("successCode", "insertMember");
			request.getRequestDispatcher(page).forward(request, response);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg","회원 가입 실패!");
			request.getRequestDispatcher(page).forward(request, response);
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
