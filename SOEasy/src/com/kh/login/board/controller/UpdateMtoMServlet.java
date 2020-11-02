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

@WebServlet("/updateBoard.mm")
public class UpdateMtoMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateMtoMServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rcontent = request.getParameter("rcontent");
		String num = request.getParameter("qno");
		
		int qno = 0;
		if(num != "" && num!= null) {
			qno = Integer.parseInt(num);
		}
		System.out.println("qno" + qno);
		Qna requestQna = new Qna();
		requestQna.setRcontent(rcontent);
		requestQna.setQno(qno);
		
		int result = new BoardService().updateqna(requestQna);
		
		
		
		String page = "";
		if(result > 0 ) {
			Qna qna =  new BoardService().detailQna(qno);
			
			if(qna != null) {
				page = "views/board/mtmdetailboard.jsp";
				request.setAttribute("qna", qna);
			} else {
				page = "views/common/errorPage.jps";
				request.setAttribute("msg", "공지사항 수정 실패");
			}
			
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
