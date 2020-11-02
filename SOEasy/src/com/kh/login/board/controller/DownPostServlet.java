package com.kh.login.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.board.model.service.BoardService;
import com.kh.login.board.model.vo.Board;

@WebServlet("/downpost.no")
public class DownPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DownPostServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String num = request.getParameter("nno");
		String content = request.getParameter("content");
		int category = Integer.parseInt(request.getParameter("category"));
		
		int nno = 0;
		if(num != "" && num!= null) {
			nno = Integer.parseInt(num);
		}
		Board requestBoard = new Board();
		
		requestBoard.setnTitle(title);
		requestBoard.setNoticeNo(nno);
		requestBoard.setnContent(content);
		requestBoard.setnCategory(category);
		
		int result = new BoardService().postDownBoard(nno);
		
		
		System.out.println("게시물 내리기 완료 ");
		
		String page = "";
		if(result > 0 ) {
			
			Board board =  new BoardService().detailBoard(nno);
			if(board != null) {
				page = "views/board/detailboard.jsp";
				request.setAttribute("board", board);
			} else {
				page = "views/common/errorPage.jps";
				request.setAttribute("msg", "공지사항 최종게시 실패");
			}
			
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
