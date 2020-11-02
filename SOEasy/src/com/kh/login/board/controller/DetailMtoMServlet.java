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

@WebServlet("/detail.mm")
public class DetailMtoMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetailMtoMServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		System.out.println("num : " + num);
		int qno = 0;
		if(num != "" && num != null) {
		qno = Integer.parseInt(num);
		System.out.println("qno : " + qno);
	}

		Qna qna = new BoardService().detailQna(qno);
	
	String page ="";
	System.out.println("detailQna : 출력 " + qna);
	if(qna != null ) {
		page = "views/board/mtmdetailboard.jsp";
		request.setAttribute("qna", qna);
	} else {
		page = "views/common/errorPage.jsp";
		request.setAttribute("msg", "1대1문의 상세 핵실패");
	}
	
	request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
