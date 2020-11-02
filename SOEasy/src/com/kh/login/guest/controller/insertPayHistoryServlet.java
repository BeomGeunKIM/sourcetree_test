package com.kh.login.guest.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.guest.model.service.GuestService;

/**
 * Servlet implementation class insertPayHistoryServlet
 */
@WebServlet("/payments/complete")
public class insertPayHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public insertPayHistoryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//org.json.simple.parser.JSONParser jsonparsor = new org.json.simple.parser.JSONParser();
		
		String payNo = request.getParameter("payNo");
		int amount = Integer.parseInt(request.getParameter("amount"))*1000;
		int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
		String methodCode = request.getParameter("methodCode");
		
		System.out.println(payNo);
		System.out.println(amount);
		System.out.println(reserveNo);
		System.out.println(methodCode);
		
		HashMap<String,Object> payHistory = new HashMap<>();
		payHistory.put("payNo", payNo);
		payHistory.put("amount", amount);
		payHistory.put("reserveNo", reserveNo);
		payHistory.put("methodCode", methodCode);
		
		
		int result =  new GuestService().insertPayHistory(payHistory);
		
		
		if(result >0) {
			response.sendRedirect("../SelectUserReservHistory");
		}else {
			request.setAttribute("msg", "결제정보 업데이트 실패!");
			request.getRequestDispatcher("/views/common/errorPage.jsp");
		}
		

		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		doGet(request, response);
	}

}
