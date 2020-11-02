package com.kh.login.space.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.member.model.vo.Member;
import com.kh.login.space.model.service.QnAService;
import com.kh.login.space.model.vo.QnA;

/**
 * Servlet implementation class InsertQnAServlet
 */
@WebServlet("/insertQnA")
public class InsertQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQnAServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		질문번호
//		문의자번호
//		답변자번호
//		작성일자
//		문의내용
//		답변내용
//		답변일자
//		질문유형코드
//		공간번호
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		//qNo = 시퀀스
		int qMemNo = loginUser.getMemberNo();
		int rMemNo = loginUser.getMemberNo();
		String qEnrollDate = "SYSDATE";
		String qContent = request.getParameter("qContent");
		String rContent = request.getParameter("rContent");
		String rEnrollDate = "SYSDATE";
		int qKind = Integer.parseInt(request.getParameter(""));
		int spaceNo = Integer.parseInt(request.getParameter(""));
		
		QnA requestMember = new QnA();
		requestMember.setqMemNo(qMemNo);
		requestMember.setrMemNo(rMemNo);
		requestMember.setqEnrollDate(qEnrollDate);
		requestMember.setqContent(qContent);
		requestMember.setrContent(rContent);
		requestMember.setrEnrollDate(rEnrollDate);
		requestMember.setqKind(qKind);
		requestMember.setSpaceNo(spaceNo);
		
		int result = new QnAService().insertQnA(requestMember);
		
		String page = "";
		if(result > 0) {
			page = "/views/common/successPage.jsp";
			request.setAttribute("successCode", "insertQnA");
			request.getRequestDispatcher(page).forward(request, response);
		} else {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "QnA 등록 실패");
			request.getRequestDispatcher(page).forward(request, response);
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
