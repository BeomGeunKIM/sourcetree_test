package com.kh.login.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class LoginWrapper extends HttpServletRequestWrapper {

	public LoginWrapper(HttpServletRequest request) {
		super(request);
		
	}
	
	@Override
	public String getParameter(String key) {
		String value = "";
		if(key != null && key.equals("password")) {
			value = getSha512(super.getParameter("password"));
			
		}else {
			value = super.getParameter(key);
			
		}
		return value;
	}
	
	public static String getSha512(String pwd) {
		String encPwd = "";
		
		try {
			//단방향 해쉬 암호화 알고리즘
			//평문을 암호화 한것을 digest 라고 함
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			
			byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);
			
			encPwd = Base64.getEncoder() .encodeToString(md.digest()); 
			
			
			
			
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return encPwd;
	}

}
