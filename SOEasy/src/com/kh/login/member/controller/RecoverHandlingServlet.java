package com.kh.login.member.controller;

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

import com.kh.login.member.model.service.MemberService;
import com.kh.login.member.model.vo.RecoverMember;

//복구 처리 결과를 메일로 전송해주고 데이터베이스에 결과를 업데이트 해주는 서블릿
@WebServlet("/recoverHandling.me")
public class RecoverHandlingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RecoverHandlingServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userId = request.getParameter("userId");
		String userEmail = request.getParameter("userEmail");
		int processType = Integer.parseInt(request.getParameter("processType"));

		String emailContent = request.getParameter("emailContent");// 이메일 내용

		RecoverMember recoverMem = new RecoverMember();

		recoverMem.setMemberNo(userNo);
		recoverMem.setUserId(userId);
		recoverMem.setEmail(userEmail);
		recoverMem.setrStatus(processType);

		int result = new MemberService().updateRecover(recoverMem);
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
				msg.setSubject("[SO EASY]  " + userId + "님의 회원복구 요청 결과 안내");
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
