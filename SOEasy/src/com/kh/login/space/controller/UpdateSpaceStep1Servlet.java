package com.kh.login.space.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

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
import com.kh.login.space.model.vo.QnA;
import com.kh.login.space.model.vo.Review;
import com.kh.login.space.model.vo.SpaceInfo;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UpdateSpaceStep1Servlet
 */
@WebServlet("/updateSpaceStep1")
public class UpdateSpaceStep1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSpaceStep1Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			Member loginUser = (Member) request.getSession().getAttribute("loginUser");
			int memberNo = loginUser.getMemberNo();
			String memberId = loginUser.getmId();
			
			ArrayList<HashMap<String,Object>> siList = (ArrayList<HashMap<String,Object>>) request.getSession().getAttribute("siList");
			HashMap<String, Object> hmap = siList.get(0);
			SpaceInfo oriSi = (SpaceInfo) hmap.get("spaceInfo");
			ArrayList<Image> imgList = (ArrayList<Image>) hmap.get("imgList");
			int imgListLen = imgList.size();
			System.out.println("기존 이미지리스트 : " + imgList);
			System.out.println("기존 이미지리스트 길이 : " + imgListLen);
			//이미지 파일들 불러오기
			int maxSize = 1024 * 1024 * 100;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String savePath = "/uploadFiles/space";
			String realPath = root + savePath;
			
			MultipartRequest multiRequest = new MultipartRequest(request, realPath, maxSize, "UTF-8", new SoEasyFileRenamePolicy("space" + memberId));
			
			
			ArrayList<Integer> allFileLevels = new ArrayList<>();
			ArrayList<String> allSaveFiles = new ArrayList<>();
			ArrayList<String> allOriginFiles = new ArrayList<>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			ArrayList<Image> updateImgList = new ArrayList<>();
			ArrayList<Image> insertImgList = new ArrayList<>();
			
			HashMap<String,Object> imgHmap = new HashMap<>();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				if(multiRequest.getFilesystemName(name) == null) {
					
				} else {
					int fileLev = Integer.parseInt(name.substring(name.length()-1, name.length()));
					allFileLevels.add(fileLev);
					allSaveFiles.add(multiRequest.getFilesystemName(name));
					allOriginFiles.add(multiRequest.getOriginalFileName(name));
				}
			}
			for(int i = allFileLevels.size()-1; i >= 0; i--) {
				for(int j = 0; j < imgList.size(); j++) {
					if(allFileLevels.get(i) == imgList.get(j).getFileLevel()) {
						Image img = new Image();
						img.setImgNo(imgList.get(j).getImgNo());
						img.setFilePath(savePath);
						img.setFileLevel(allFileLevels.get(i));
						img.setChangeName(allSaveFiles.get(i));
						img.setOriginName(allOriginFiles.get(i));
						updateImgList.add(img);
					}
				}
			}
			for(int i = allFileLevels.size()-1; i >= 0; i--) {
				if(updateImgList.size() == 0) {
					Image img = new Image();
					
					img.setFileLevel(allFileLevels.get(i));
					img.setFilePath(savePath);
					img.setChangeName(allSaveFiles.get(i));
					img.setOriginName(allOriginFiles.get(i));
					insertImgList.add(img);
				} else {
					for(int j = 0; j < updateImgList.size(); j++) {
						if(allFileLevels.get(i) != updateImgList.get(j).getFileLevel()) {
							Image img = new Image();
							
							img.setFileLevel(allFileLevels.get(i));
							img.setFilePath(savePath);
							img.setChangeName(allSaveFiles.get(i));
							img.setOriginName(allOriginFiles.get(i));
							insertImgList.add(img);
						}
					}
				}
			}
			
			
			imgHmap.put("updateImgList", updateImgList);
			imgHmap.put("insertImgList", insertImgList);
			
			
			String kinds = multiRequest.getParameter("kinds");
			
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
			
			si.setSpaceNo(oriSi.getSpaceNo());
			si.setHostNo(memberNo);
			si.setSpaceName(spaceName);
			si.setSpaceIntro(spaceIntro);
			si.setSpaceShortIntro(spaceShortIntro);
			si.setSpaceKind(kind);
			
			si.setConv(conv);
			si.setSpaceAddress(spaceAddress);
			si.setSpaceLocationFilter(spaceLocationFilter);
			
			int updateResult = new SpaceService().updateSpaceStep1(imgHmap, si);
			
			ArrayList<HashMap<String,Object>> returnList = null;
			
			if(updateResult > 0) {
				returnList = new SpaceService().selectOneSpaceInfo(si.getSpaceNo());
				request.getSession().setAttribute("siList", returnList);
				response.sendRedirect(request.getContextPath() + "/views/space/updateSpaceStep2.jsp");
			} else {
				request.setAttribute("msg", "공간 정보 수정 실패.");
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
