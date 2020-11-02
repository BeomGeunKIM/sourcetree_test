package com.kh.login.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class SoEasyFileRenamePolicy implements FileRenamePolicy {

	private String memberNick;
	
	public SoEasyFileRenamePolicy() {}
	
	public SoEasyFileRenamePolicy(String memberNick) {
		this.memberNick = memberNick;
	}

	@Override
	public File rename(File f) {
		
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");
		int randomNumber = (int) (Math.random() * 100000);
		
		String name = f.getName();
		String body = "";
		String ext = "";
		
		int dot = name.lastIndexOf(".");
		if(dot != -1) {
			body = name.substring(0, dot);
			ext = name.substring(dot);
		} else {
			body = name;
		}
		
		String fileName = memberNick + ft.format(new Date(currentTime)) + randomNumber + ext;
		
		File newFile = new File(f.getParent(), fileName);
		
		return newFile;
	}
	
	
}
