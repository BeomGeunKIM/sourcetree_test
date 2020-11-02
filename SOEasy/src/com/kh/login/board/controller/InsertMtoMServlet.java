package com.kh.login.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.login.board.model.service.BoardService;
import com.kh.login.board.model.vo.Qna;
import com.kh.login.member.model.vo.Member;

@WebServlet("/insert.mm")
public class InsertMtoMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     public InsertMtoMServlet() {
        super();
    }
	
     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 String id = request.getParameter("id");
 		String title = request.getParameter("title");
 		String content = request.getParameter("content");
 		int category = Integer.parseInt(request.getParameter("category"));
 		HttpSession session = request.getSession();
 		Member loginUser = (Member) session.getAttribute("loginUser");
 		
 		int qMemberNo = loginUser.getMemberNo(); 
 		String nick = loginUser.getmNick();
 		String page = "";
 		Qna qna = new Qna();
 		qna.setQcontent(content);
 		qna.setQtitle(title);
 		qna.setQkind(category);
 		qna.setQmember(qMemberNo);
 		qna.setqMnick(nick);
 		System.out.println("1대1 문의 제목 : " + title);
 		System.out.println("1대1 문의 분류 : " + category);
 		System.out.println("1대1 문의 내용 : " + content);
 		System.out.println("1대1 문의 질문자닉 : " + nick);
 		System.out.println("1대1 문의 질문자 번호 : " + qMemberNo);
 		int result = new BoardService().insertM(qna);
		System.out.println("qna : " + qna);
		if(result>0 ) {
			response.sendRedirect("/login/select.mtm");
		}
		 else {
			request.setAttribute("msg", "게시판 작성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
     }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
