package com.kh.login.space.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class InsertSpaceStep1
 */
@WebServlet("/insertSpaceStep1")
public class InsertSpaceStep1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSpaceStep1Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		System.out.println("들어오십니까?");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			Member loginUser = (Member) request.getSession().getAttribute("loginUser");
			int memberNo = loginUser.getMemberNo();
			String memberId = loginUser.getmId();
			
			//이미지 파일들 불러오기
			int maxSize = 1024 * 1024 * 100;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String savePath = "/uploadFiles/space";
			String realPath = root + savePath;
			
			MultipartRequest multiRequest = new MultipartRequest(request, realPath, maxSize, "UTF-8", new SoEasyFileRenamePolicy("space" + memberId));
			
			ArrayList<Integer> fileLevel = new ArrayList<>();
			ArrayList<String> saveFiles = new ArrayList<>();
			ArrayList<String> originFiles = new ArrayList<>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				System.out.println("insertTagName : " + name);
				System.out.println("servlet sysname : " + multiRequest.getFilesystemName(name));
				System.out.println("servlet originname : " + multiRequest.getOriginalFileName(name));
				//가져온 파일 이름이 null인 경우 add하지 않도록 처리
				if(multiRequest.getFilesystemName(name) == null) {
					
				} else {
					int fileLev = Integer.parseInt(name.substring(name.length()-1, name.length()));
					fileLevel.add(fileLev);
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
			}
			//이미지 파일리스트
			ArrayList<Image> fileList = new ArrayList<>();
			
			for(int i = saveFiles.size()-1; i >= 0; i--) {

				Image img = new Image();
				img.setFilePath(savePath);
				img.setOriginName(originFiles.get(i));
				img.setChangeName(saveFiles.get(i));
				img.setFileLevel(fileLevel.get(i));

				fileList.add(img);
				
			}
			
			String kinds = multiRequest.getParameter("kinds");
			//System.out.println("insertSpaceStep1 kinds : " + kinds);
			
			//공간정보 vo
			SpaceInfo si = new SpaceInfo();
			int kind = -1;
			if(kinds.equals("office")) {
				kind = 1;
				double spaceSize = Double.parseDouble(multiRequest.getParameter("space-size"));
				int spaceRoomCount = Integer.parseInt(multiRequest.getParameter("space-room-count"));
				int spaceContainCount = Integer.parseInt(multiRequest.getParameter("space-contain-count"));
				si.setSpaceSize(spaceSize);
				si.setSpaceRoomCount(spaceRoomCount);
				si.setSpaceContainCount(spaceContainCount);
			} else if(kinds.equals("cowork")) {
				kind = 2;
				int unfixSeat = Integer.parseInt(multiRequest.getParameter("unfix-seat"));
				int fixSeat = Integer.parseInt(multiRequest.getParameter("fix-seat"));
				int totalSeat = unfixSeat + fixSeat;
				int maxReserv = Integer.parseInt(multiRequest.getParameter("max-reserv"));
				si.setUnfixSeat(unfixSeat);
				si.setFixSeat(fixSeat);
				si.setTotalSeat(totalSeat);
				si.setMaxReserv(maxReserv);
			}
			
			String spaceName = multiRequest.getParameter("space-name");
			String spaceIntro = multiRequest.getParameter("space-intro");
			String spaceShortIntro = multiRequest.getParameter("space-short-intro");
			String[] conv = multiRequest.getParameterValues("conv");
			String spaceAddress = multiRequest.getParameter("space-address");
			String spaceLocationFilter = multiRequest.getParameter("roadAddrPart1") + "," + multiRequest.getParameter("siNm") + "," + multiRequest.getParameter("sggNm") + "," + multiRequest.getParameter("emdNm");
			
			
			si.setHostNo(memberNo);
			si.setSpaceName(spaceName);
			si.setSpaceIntro(spaceIntro);
			si.setSpaceShortIntro(spaceShortIntro);
			si.setSpaceKind(kind);
			
			si.setConv(conv);
			si.setSpaceAddress(spaceAddress);
			si.setSpaceLocationFilter(spaceLocationFilter);
			
			
			//System.out.println("insertSpace1 fileList : " + fileList);
			//System.out.println("insertSpace1 si : " + si);
			
			SpaceInfo returnSi = new SpaceService().insertSpaceStep1(fileList, si);
			
			//System.out.println(returnSi);
			
			if(returnSi != null) {
				request.getSession().setAttribute("spaceInfo", returnSi);
				response.sendRedirect(request.getContextPath() + "/views/space/insertSpaceStep2.jsp");
			} else {
				for(int i = 0; i < fileList.size(); i++) {
					File failedFile = new File(realPath + "/" + saveFiles.get(i));
					
					failedFile.delete();
				}
				request.setAttribute("msg", "공간등록 실패!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
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
