package com.kh.login.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.login.common.SoEasyFileRenamePolicy;
import com.kh.login.member.model.service.MemberService;
import com.kh.login.member.model.vo.Member;
import com.kh.login.wrapper.LoginWrapper;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/updateMember.me")
public class updateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//프로필 사진을 업데이트 해주는 서블렛
	public updateMemberServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int result = 0;
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 20;
			Member loginUser = (Member) request.getSession().getAttribute("loginUser");
			String userId = loginUser.getmId();
			String beforePw = loginUser.getmPassword();
			int memberNo = loginUser.getMemberNo();
			// 웹 서버 컨테이너 경로 추출
			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println(root);
			String savePath ="/uploadFiles/profile/";
			String realPath = root+savePath;
			// 파일 저장 경로 설청

			MultipartRequest multiRequest = new MultipartRequest(request, realPath, maxSize, "UTF-8",
					new SoEasyFileRenamePolicy(userId));
			String saveFile = "";
			String originFile = "";

			Enumeration<String> files = multiRequest.getFileNames();

			System.out.println("files : " + files);

			if (files.hasMoreElements()) {
				String name = files.nextElement();
				System.out.println("name : " + name);
				saveFile = multiRequest.getFilesystemName(name);
				originFile = multiRequest.getOriginalFileName(name);
			}
			System.out.println(saveFile);
			System.out.println(originFile);
			int kind = Integer.parseInt(multiRequest.getParameter("swPassword"));

			String nickName = multiRequest.getParameter("nickName");
			String name = multiRequest.getParameter("name");
			String password = LoginWrapper.getSha512(multiRequest.getParameter("password"));// kind가 1이면 사용하지 않음
			String phoneNum = multiRequest.getParameter("phoneNum");
			String email = multiRequest.getParameter("email");

			System.out.println(kind);
			Member updatingMember = new Member(); //변경이 완료된 멤버
			Member updateMember = new Member();
			System.out.println("id : " + userId);
			System.out.println("nick : " + nickName);
			System.out.println("name : " + name);
			System.out.println("password : " + password);
			System.out.println("phoneNum : " + phoneNum);
			System.out.println("email : " + email);
			String deleteFileName = "";
			// 비밀번호 수정을 진행하지 않았을때
			if (kind == 1) {
				//프로필 사진을 업데이트 하지않았을때
				if(originFile==null) {
					updateMember.setMemberNo(memberNo);
					updateMember.setmId(userId);
					updateMember.setmNick(nickName);
					updateMember.setmName(name);
					updateMember.setmPassword(beforePw);
					updateMember.setmPhone(phoneNum);
					updateMember.setmEmail(email);
					updatingMember = new MemberService().updateMember1(updateMember);
				//프로필 사진을 업데이트 했을때	
				}else {
					updateMember.setMemberNo(memberNo);
					updateMember.setmId(userId);
					updateMember.setmNick(nickName);
					updateMember.setmName(name);
					updateMember.setmPassword(beforePw);
					updateMember.setmPhone(phoneNum);
					updateMember.setmEmail(email);
					updateMember.setOriginName(originFile);
					updateMember.setChangeName(saveFile);
					updateMember.setFilePath(savePath);
					deleteFileName = new MemberService().findImg(updateMember);
					if(!deleteFileName.equals("soeasyProf.png") && !deleteFileName.equals("")) {
						File deleteFile = new File(realPath + deleteFileName);
						
						deleteFile.delete();
					}
					
					updatingMember = new MemberService().updateMember2(updateMember);
				}
				

			}
			// 비밀번호 수정이 됬을 때
			else {
				//프로필 사진을 변경하지 않았을때
				if(originFile==null) {
					updateMember.setMemberNo(memberNo);
					updateMember.setmId(userId);
					updateMember.setmNick(nickName);
					updateMember.setmName(name);
					updateMember.setmPassword(password);
					updateMember.setmPhone(phoneNum);
					updateMember.setmEmail(email);
					updatingMember = new MemberService().updateMember3(updateMember);
				}
				//변경 했을 때
				else {
					updateMember.setMemberNo(memberNo);
					updateMember.setmId(userId);
					updateMember.setmNick(nickName);
					updateMember.setmName(name);
					updateMember.setmPassword(password);
					updateMember.setmPhone(phoneNum);
					updateMember.setmEmail(email);
					updateMember.setOriginName(originFile);
					updateMember.setChangeName(saveFile);
					updateMember.setFilePath(savePath);
					deleteFileName = new MemberService().findImg(updateMember);
					if(!deleteFileName.equals("soeasyProf.png") && !deleteFileName.equals("")) {
						File deleteFile = new File(realPath + deleteFileName);
						
						deleteFile.delete();
					}
					updatingMember = new MemberService().updateMember4(updateMember);
				}
			
			}
			if(updatingMember!=null) {
				request.getSession().setAttribute("loginUser", updatingMember);
				response.sendRedirect(request.getContextPath()+"/views/member/updateMember2.jsp");
			}else {
					File failedFile = new File(savePath + saveFile);
					failedFile.delete();
					request.setAttribute("msg", "회원 정보 수정 실패!");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
