package com.kh.login.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.board.model.service.BoardService;
import com.kh.login.board.model.vo.Board;

@WebServlet("/detail.no")
public class DetailNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetailNoticeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
			System.out.println("num : " + num);
		int nno = 0;
		if(num != "" && num != null) {
			nno = Integer.parseInt(num);
			System.out.println("nno : " + nno);
		}
	
		Board board = new BoardService().detailBoard(nno);
		
		String page ="";
		System.out.println(board);
		if(board != null ) {
			page = "views/board/detailboard.jsp";
			request.setAttribute("board", board);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 상세 핵실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
