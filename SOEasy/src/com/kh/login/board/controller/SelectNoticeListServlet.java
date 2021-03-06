package com.kh.login.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.board.model.service.BoardService;
import com.kh.login.board.model.vo.Board;
import com.kh.login.host.manageReserve.model.vo.PageInfo;

@WebServlet("/selectList.no")
public class SelectNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectNoticeListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  int currentPage; //현재 페이지를 표시할 변수
	      int limit; // 한 페이지에 게시글이 몇 개 보여질 것인지 표시
	      int maxPage; //전체 페이지에서 가장 마지막 페이지
	      int startPage; //한번에 표시될 페이지가 시작할 페이지
	      int endPage; //한번에 표시될 페이지가 끝나는 페이지
	   
	      //게시판은 1부터 시작함
	      currentPage = 1;
	      
	      //전달받은 request가 있다면 전달받은 값을 덮어씀
	      
	      if(request.getParameter("currentPage") != null ) {
	         currentPage = Integer.parseInt(request.getParameter("currentPage"));
	      }
	      
	      //한 페이지에 보여질 목록 갯수
	      limit = 10;

	      //전체 목록 갯수를 조회 -> 총 페이지 수를 계산하려고 필요하다
	      int listCount = new BoardService().getListCount();
	      System.out.println("공지사항 게시글 수 : " + listCount);
	      //총 페이지 수 계산
	      //예를 들면 목록 갯수가 123개이면,
	      //총 필요한 페이지수는 13개 임
	      
	      //맥스페이지 계산
	      maxPage = (int)((double) listCount / limit + 0.9);
	      
	      //현재 페이지에 보여줄 시작 페이지 수(10개씩 보여지게 할 경우)
	      //아래 쪽 페이지 수가 10개씩 보여진다면
	      //1, 11, 21, 31, .....
	      startPage = (((int) ((double) currentPage / 10 + 0.9)) -1) * 10 + 1;
	      
	      //목록 아래 쪽에 보여질 마지막 페이지 수 (10,20,30, ....)
	                           //보여지는 버튼의 수 
	      endPage = startPage       +       10       - 1;
	      
	      if(maxPage < endPage) {
	         endPage = maxPage;
	      }
	      
	      PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
	      
	      //재 조회
	      ArrayList<Board> list = new BoardService().selectList(pi);
	   
	      String page = "";
	      if(list != null) {
	         page = "views/board/board.jsp";
	         request.setAttribute("list", list);
	         request.setAttribute("pi", pi);
	      } else {
	         page = "views/common/errorPage.jsp";
	         request.setAttribute("msg", "게시판 조회 실패!");
	      }
	      
	      request.getRequestDispatcher(page).forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
