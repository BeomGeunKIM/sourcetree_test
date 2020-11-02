package com.kh.login.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

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

@WebServlet("/eCert.me")
public class EmailCertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmailCertServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String email = request.getParameter("email");

		String toEmail = "";
		int result = 0;
		System.out.println(email);
		result = new MemberService().checkEmail(email);
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.append("fail");
		} else {
			toEmail = email;
			String host = "smtp.naver.com";
			String user = "hg121500@naver.com";
			String password = "비밀번호";

			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 465);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");

			String AuthenticationKey =makeKey();
			System.out.println(AuthenticationKey);

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
				msg.setSubject("안녕하세요 SO Easy 인증 메일입니다");
				// 메일 내용
				msg.setText("인증 번호는 :" + AuthenticationKey);

				Transport.send(msg);
				System.out.println("이메일 전송");

			
				out.append(AuthenticationKey);
				out.flush();
				out.close();

			} catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public static String makeKey() {
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String AuthenticationKey = temp.toString();
		
		return AuthenticationKey;
	}

}
