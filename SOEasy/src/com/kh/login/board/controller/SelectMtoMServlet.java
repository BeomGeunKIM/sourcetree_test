package com.kh.login.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.board.model.service.BoardService;
import com.kh.login.board.model.vo.Board;
import com.kh.login.board.model.vo.Qna;

@WebServlet("/selectBoard.mm")
public class SelectMtoMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectMtoMServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		
		int qno = 0;
		if(num != "" && num != null) {
			qno = Integer.parseInt(num);
		}
		
		Qna qna = new BoardService().detailQna(qno);
		
		
		String page = "";
		if(qna != null) {
			//page = "views/board/updateboard.jsp";
			//request.setAttribute("board", board);
			page = "views/board/mtmupdateboard.jsp";
			request.setAttribute("qna", qna);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "문의 답변용 상세 보기 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
