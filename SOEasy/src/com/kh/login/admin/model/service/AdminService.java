package com.kh.login.admin.model.service;

import static com.kh.login.common.JDBCTemplate.close;
import static com.kh.login.common.JDBCTemplate.commit;
import static com.kh.login.common.JDBCTemplate.getConnection;
import static com.kh.login.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.login.admin.model.dao.AdminDao;
import com.kh.login.admin.model.vo.SoEasyPaymentException;
import com.kh.login.admin.model.vo.Synthesis;
import com.kh.login.host.manageReserve.model.vo.PageInfo;
import com.kh.login.member.model.dao.MemberDao;
import com.kh.login.member.model.vo.RecoverMember;
import com.kh.login.space.model.dao.MainDao;
public class AdminService {

	public Synthesis getAllSynth() {
		Connection con = getConnection();
		Synthesis synth = null;
		
		int memberQty = new MemberDao().getListCount(con); 
		System.out.println("memberQty : "+memberQty );
		int spaceQty = new MainDao().getListCount(con);
		System.out.println("spaceQty : "+spaceQty);
		int imagesQty = new AdminDao().getImageCount(con);
		System.out.println("imagesQty :"+imagesQty);
		int hostQty = new AdminDao().getHostCount(con);
		System.out.println("hostQty : "+hostQty);
		int todayAcceptSpace = new AdminDao().getNewSpaceCount(con);
		System.out.println("todayAcceptSpace : "+todayAcceptSpace);
		int todayJoinMembers = new AdminDao().getNewMembersCount(con);
		System.out.println("todayJoinMembers : "+todayJoinMembers);
		String stringBenefits = new AdminDao().getTodaysBenefit(con);
		int todaysBenefit = 1;
		if(stringBenefits != null) {
			todaysBenefit = Integer.parseInt(stringBenefits);
		}else {
			 try {
				throw new SoEasyPaymentException("결제 정보가  유효하지 않은 값 발생");
			} catch (SoEasyPaymentException e) {
				e.printStackTrace();
			}
		}
		int[] checkArr = new int[] {hostQty,todayAcceptSpace,todayJoinMembers,todaysBenefit};
		int errorCount = 0;
		for(int a : checkArr) {
			if(a < 0 ) {
				errorCount++;
			}
		}
		
		if(errorCount == 0) {
		synth = new Synthesis(memberQty, spaceQty, imagesQty, hostQty, todayAcceptSpace,
				todayJoinMembers, todaysBenefit);
		} 
		
		errorCount = 0;
		
		close(con);
		
		return synth;
	}

	public ArrayList<RecoverMember> getLatestRecoverList() {
		Connection con = getConnection();
		
		ArrayList<RecoverMember> recoverList = null;
	
		recoverList = new AdminDao().getLatestRecoverList(con);
		
		
		close(con);
		
		return recoverList;
	}

	public int getDeleteRequestListCount() {
		Connection con = getConnection();
		int listCount = new AdminDao().getDeleteRequestListCount(con);
		
		close(con);
		
		return listCount;
		
		
	}

	public ArrayList<HashMap<String, Object>> selectAllDeleteList(PageInfo pi) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> deleteList = new AdminDao().selectAllDeleteList(con,pi);
		
		close(con);
		return deleteList;
		
		
		
	}

	public int insertDeleteSpaceTable(int spaceNo, String status) {
		Connection con = getConnection();
		int result1 = new AdminDao().insertDeleteSpaceTable(con, spaceNo);
		int result2 = new AdminDao().updateSpaceStatus(con,spaceNo,status);
		int result = 0;
		if(result1>0 && result2>0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int getDeleteRequestListCount(String dStatus) {
		Connection con = getConnection();
		int listCount = new AdminDao().getDeleteRequestListCount(con,dStatus);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectAllDeleteList(PageInfo pi, String dStatus) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> deleteList = new AdminDao().selectAllDeleteList(con,pi,dStatus);
		
		close(con);
		
		return deleteList;
		
		
	}

	public int getWaitingSpaceListCount() {
		Connection con = getConnection();
		int listCount = new AdminDao().getWaitingSpaceListCount(con);
		
		close(con);
		
		return listCount;
		
		
	}

	public ArrayList<HashMap<String, Object>> selectAllWaitingList(PageInfo pi) {

		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> waitingList = new AdminDao().selectAllWaitingList(con,pi);
		
		close(con);
		
		return waitingList;
	}

	public ArrayList<HashMap<String, Object>> getLatestDeleteList() {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> deleteList = new AdminDao().getLatestDeleteList(con);
		
		close(con);
		return deleteList;
	}

	public int SpacingCheckUp(String userId, String processType, int spaceNo) {
		Connection con = getConnection();
		int result1 = 0;
		int result2 = 0;
		int result = 0;
		
		result1 = new AdminDao().updatingSpaceStatus(con,processType,spaceNo);
		if(processType.equals("Y")) {
			result2 = new AdminDao().updateMemberStatus(con,userId);
		}else if(processType.equals("ID")) {
			result2 = 1;
		}
		
		if(result1>0 && result2>0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
			
		close(con);
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> getLatestWaitList() {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> waitList = new AdminDao().getLatestWaitList(con);
		
		close(con);
		return waitList;
	}

}
