package com.kh.login.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.login.board.model.service.BoardService;
import com.kh.login.board.model.vo.Board;
import com.kh.login.member.model.vo.Member;
@WebServlet("/insert.no")
public class InsertNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertNoticeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int category = Integer.parseInt(request.getParameter("category"));
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		int mno = loginUser.getMemberNo();
		String nickname = loginUser.getmNick();
		
		System.out.println("title : " + title );
		System.out.println("content : " + content);
		System.out.println("category : " + category );
		System.out.println("mno : " + mno);
		System.out.println("nickname : " + nickname);
		
		Board board = new Board();
		board.setnCategory(category);
		board.setAdminNo(mno);
		board.setnContent(content);
		board.setmNick(nickname);
		board.setnTitle(title);
		int result = new BoardService().insertBoard(board);
		System.out.println("board : " + board);
		if(result>0 && category < 5) {
			response.sendRedirect("/login/selectList.no");
		}
		// result>0이고, category의 value가 5이면 selectLIst.faq로 보내줘라
		else if (result>0 && category == 5){
			response.sendRedirect("/login/selectList.faq");
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
