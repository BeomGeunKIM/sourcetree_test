package com.kh.login.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.login.admin.model.service.AdminService;

@WebServlet("/deleteSpaceHandling.ad")
public class deleteSpaceHandlingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public deleteSpaceHandlingServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int spaceNo = Integer.parseInt(request.getParameter("spaceNo"));
		String userId = request.getParameter("userId");
		String userEmail = request.getParameter("userEmail");
		int processType = Integer.parseInt(request.getParameter("processType"));
		int result = 0;
		String status = "";
		String emailContent = request.getParameter("emailContent");// 이메일 내용
		System.out.println("processType : "+processType);
		if(processType ==1) {
			
			status = "D";
		}else {
			
			status = "DW";
		}
		result = new AdminService().insertDeleteSpaceTable(spaceNo,status);
		PrintWriter out = response.getWriter();
		if (result > 0) {
			String toEmail = userEmail;
			String host = "smtp.naver.com";
			String user = "hg121500@naver.com";
			String password = "비밀번호";

			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 465);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

			try {
				MimeMessage msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(user, "SO Easy 관리자"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

				// 메일 제목
				msg.setSubject("[SO EASY]  " + userId + "님의 공간 삭제 요청 결과 안내");
				// 메일 내용
				msg.setText(emailContent);

				Transport.send(msg);
				
				out.append("success");

			} catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}

		} else {
			out.append("fail");
		}
		out.flush();
		out.close();
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
