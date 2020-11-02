package com.kh.login.common;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @class ExampleSend
 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API
 *        PHP
 */
public class Certified {

	private String api_key = "apikey";
	private String api_secret = "apisecret";
	private Message coolsms = new Message(api_key, api_secret);
	private final String MY_PHONE = "전화번호";

	public Certified() {

	}

	public String CertifiedSMS(String phoneNum) {
		HashMap<String, String> params = new HashMap<String, String>();
		String key = makeKey();
		params.put("to", phoneNum);
		params.put("from", MY_PHONE); // 무조건 자기번호 (인증)
		params.put("type", "SMS");
		params.put("text", "SO Easy 인증번호는 "+key+" 입니다.");
		params.put("app_version", "test app 1.2"); // application name and version
	try

		{
			// send() 는 메시지를 보내는 함수
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		return key;
	}
	
	public String makeKey() {
		int length = 6; // 6자리 인증 번호
		Random rand = new Random();
		String key = "";
		
		
		for(int i=0; i<length; i++) {
			
			key+=Integer.toString(rand.nextInt(10));
		}
		
		return key;
	}
}