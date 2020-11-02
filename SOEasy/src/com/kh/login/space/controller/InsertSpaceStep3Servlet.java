package com.kh.login.space.controller;

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
import com.kh.login.member.model.vo.Member;
import com.kh.login.space.model.service.SpaceService;
import com.kh.login.space.model.vo.Image;
import com.kh.login.space.model.vo.SpaceInfo;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertSpaceStep3Servlet
 */
@WebServlet("/insertSpaceStep3")
public class InsertSpaceStep3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSpaceStep3Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			Member loginUser = (Member) request.getSession().getAttribute("loginUser");
			SpaceInfo si = (SpaceInfo) request.getSession().getAttribute("spaceInfo");
			
			int maxSize = 1024 * 1024 * 20;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = "/uploadFiles/businessRegist";
			String realPath = root + savePath;
			
			MultipartRequest multiRequest = new MultipartRequest(request, realPath, maxSize, "UTF-8", new SoEasyFileRenamePolicy("license" + loginUser.getmId()));
			
			String saveFile = "";
			String originFile = "";

			Enumeration<String> files = multiRequest.getFileNames();

			if (files.hasMoreElements()) {
				String name = files.nextElement();
				System.out.println("name : " + name);
				saveFile = multiRequest.getFilesystemName(name);
				originFile = multiRequest.getOriginalFileName(name);
			}
			
			Image licenseImage = new Image();
			licenseImage.setOriginName(originFile);
			licenseImage.setFilePath(savePath);
			licenseImage.setChangeName(saveFile);
			licenseImage.setImgDiv(1);
			licenseImage.setMemberNo(loginUser.getMemberNo());
			
			String bsnsName = multiRequest.getParameter("bsns-name");
			String representName = multiRequest.getParameter("bsns-represent-name");
			String bsnsLicenseNo = multiRequest.getParameter("bsns-license-no");
			int bsnsType = -1;
			if(multiRequest.getParameter("bsns-type") == null || multiRequest.getParameter("bsns-type") == "") {
				
			} else {
				bsnsType = Integer.parseInt(multiRequest.getParameter("bsns-type"));
			}
			
			String bsnsCondition = multiRequest.getParameter("bsns-condition");
			String bsnsEvent = multiRequest.getParameter("bsns-event");
			String bsnsAddress = multiRequest.getParameter("bsns-address");
			
			String email1 = multiRequest.getParameter("cal-email1");
			String email2 = multiRequest.getParameter("cal-email2");
			
			String calEmail = email1 + "@" + email2;
			
			String phone1 = multiRequest.getParameter("cal-phone1");
			String phone2 = multiRequest.getParameter("cal-phone2");
			String phone3 = multiRequest.getParameter("cal-phone3");
			
			String calPhone = phone1 + "-" + phone2 + "-" + phone3;
			String calBank = multiRequest.getParameter("cal-bank");
			String calAcctHolder = multiRequest.getParameter("cal-acct-holder");
			String calAcctNo = multiRequest.getParameter("cal-acct-no");
			
			si.setHostNo(loginUser.getMemberNo());
			si.setBsnsName(bsnsName);
			si.setRepresentName(representName);
			si.setBsnsLicenseNo(bsnsLicenseNo);
			si.setBsnsType(bsnsType);
			si.setBsnsCondition(bsnsCondition);
			si.setBsnsEvent(bsnsEvent);
			si.setBsnsAddress(bsnsAddress);
			si.setCalEmail(calEmail);
			si.setCalPhone(calPhone);
			si.setCalBank(calBank);
			si.setCalAcctHolder(calAcctHolder);
			si.setCalAcctNo(calAcctNo);
			
			int result = new SpaceService().insertSpaceStep3(si, licenseImage);
			
			request.getSession().removeAttribute("spaceInfo");
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/selectTempSpace?memberNo=" + loginUser.getMemberNo());
			} else {
				File failedFile = new File(savePath + saveFile);
				failedFile.delete();
				request.setAttribute("msg", "공간 정산 정보 등록 실패!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
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
