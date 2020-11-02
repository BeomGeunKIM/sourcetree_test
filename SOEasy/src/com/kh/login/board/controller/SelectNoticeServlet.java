package com.kh.login.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.board.model.service.BoardService;
import com.kh.login.board.model.vo.Board;

@WebServlet("/selectBoard.no")
public class SelectNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectNoticeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String num = request.getParameter("num");
		
		int nno = 0;
		if(num != "" && num != null) {
			nno = Integer.parseInt(num);
		}
		
		Board board = new BoardService().detailBoard(nno);
		
		
		String page = "";
		if(board != null) {
			//page = "views/board/updateboard.jsp";
			//request.setAttribute("board", board);
			page = "views/board/updateboard.jsp";
			request.setAttribute("board", board);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 수정용 상세 보기 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
