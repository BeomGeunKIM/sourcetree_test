package com.kh.login.guest.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.guest.model.service.GuestService;

@WebServlet("/updateRstatus")
public class updateRstatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public updateRstatusServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int length = Integer.parseInt(request.getParameter("length"));
		
		System.out.println("length : "+length);
	
		ArrayList<HashMap<Integer,Integer>> rstatusArr = new ArrayList<>();
		
		for(int i=0; i<length; i++) {
			HashMap<Integer, Integer> hmap = new HashMap<>();
			hmap.put(Integer.parseInt(request.getParameter("reservNo"+i)), Integer.parseInt(request.getParameter("reserv"+i)));
			
			rstatusArr.add(hmap);
		}
		System.out.println(rstatusArr);
		
		int result = new GuestService().updateRstatus(rstatusArr, length);
		PrintWriter out = response.getWriter();
		if(result>0) {
			out.append("success");
		}else {
			out.append("fail");
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
