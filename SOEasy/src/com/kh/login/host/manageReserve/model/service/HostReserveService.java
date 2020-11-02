package com.kh.login.host.manageReserve.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.login.host.manageReserve.model.dao.HostReserveDao;
import com.kh.login.host.manageReserve.model.vo.HostReservation;
import com.kh.login.host.manageReserve.model.vo.HostReserve;
import com.kh.login.host.manageReserve.model.vo.PageInfo;
import com.kh.login.host.manageReserve.model.vo.PaymentRequest;
import com.kh.login.space.model.vo.SpaceReservation;

import static com.kh.login.common.JDBCTemplate.*;

public class HostReserveService {

	public int getListCount(int hostNo) {
		Connection con = getConnection();
		
		int listCount = new HostReserveDao().getListCount(con, hostNo);
		
		close(con);
		
		System.out.println(listCount);
		
		return listCount;
	}
	
	public int getRequestCount(int hostNo) {
		Connection con = getConnection();
		
		int requestCount = new HostReserveDao().getRequestCount(con, hostNo);
		
		close(con);
		
		System.out.println(requestCount);
		
		return requestCount;
	}

	public ArrayList<PaymentRequest> selectList(PageInfo pi, int hostNo) {
		Connection con = getConnection();
		
		ArrayList<PaymentRequest> list = new HostReserveDao().selectList(con, pi, hostNo);
		
		close(con);
		
		return list;
	}
	
	
	
	
	public ArrayList<PaymentRequest> updateReserveRequest(PageInfo pi, int nno, int rno) {
		Connection con = getConnection();
		
		int result = new HostReserveDao().updateReserveRequest(con, nno, rno);
		
		ArrayList<PaymentRequest> updateList = null;
		
		
		
		if(result > 0) {
			commit(con);
			updateList = new HostReserveDao().selectList(con, pi, rno);
		} else {
			rollback(con);
		}
		
		
		close(con);
		
		return updateList;
	}

	public ArrayList<HostReserve> selectReserveInfo(int hostNo, int spaceNo) {
		Connection con = getConnection();
		
		ArrayList<HostReserve> selectHostReserve = new HostReserveDao().selectHostReserve(con, hostNo, spaceNo);
		
		
		
		close(con);
		
		return selectHostReserve;
	}

	public ArrayList<HashMap<String, Object>> insertHostReserve(HostReservation hostReservation, int hostNo, int spaceNo) {
		Connection con = getConnection();
		HostReserveDao hrd = new HostReserveDao();
		int result = 0;
		
		result = new HostReserveDao().insertHostReserve(con, hostReservation);
		
		ArrayList<HashMap<String, Object>> selectList = new ArrayList<>();
		HashMap<String, Object> hmap = new HashMap<>();
		ArrayList<HostReserve> hr = new ArrayList<>();
		
		System.out.println("서비스 ??");
		
		if(result > 0) {
			commit(con);
			hr = new HostReserveDao().selectHostReserve(con, hostNo, spaceNo);
			for(HostReserve h : hr) {
				System.out.println(h);
			}
		} else {
			rollback(con);
		}
		
		close(con);
		
		return selectList;
	}

	public int selectOfficeCount(int spaceNo) {
		Connection con = getConnection();
		
		int officeCount = new HostReserveDao().getOfficeCount(con, spaceNo);
		
		close(con);
		
		System.out.println(officeCount);
		
		return officeCount;
	}

	public ArrayList<HostReserve> selectRoungeInfo(int hostNo, int spaceNo) {
		Connection con = getConnection();
		
		ArrayList<HostReserve> selectHostReserve = new HostReserveDao().selectRoungeInfo(con, hostNo, spaceNo);
		
		
		
		close(con);
		
		return selectHostReserve;
	}

	public HostReserve selectOne(int reserveNo) {
		Connection con = getConnection();
		
		HostReserve hostReserve = null;
		int result = 0;
		
		hostReserve = new HostReserveDao().selectOne(con, reserveNo);
		result = new HostReserveDao().updateCount(con, reserveNo);
		
		if(result > 0 && hostReserve != null) {
			commit(con);
		} else {
			rollback(con);
			hostReserve = null;
		}
		
		close(con);
		
		return hostReserve;
	}

	public HostReserve updateReserve(int reserveNo) {
		Connection con = getConnection();
		
		int result = new HostReserveDao().updateOne(con, reserveNo);
		
		HostReserve updateOne = null;
		
		
		
		if(result > 0) {
			commit(con);
			updateOne = new HostReserveDao().selectOne(con, reserveNo);
		} else {
			rollback(con);
		}
		
		
		close(con);
		
		return updateOne;
	}

	public int findspaceNo(int hostNo) {
		Connection con = getConnection();
		int spaceNo = new HostReserveDao().findSpaceNo(con, hostNo);
		close(con);
		return spaceNo;
	}
	
//	public int updateReserveRequest(int nno, int rno) {
//		Connection con = getConnection();
//		
//		int result = new HostReserveDao().updateReserveRequest(con, nno, rno);
//		
//		int pr = 0;
//		
//		PageInfo pi = new PageInfo();
//		
//		if(result > 0) {
//			commit(con);
//			pr = new HostReserveDao().selectList(con, nno);
//		} else {
//			rollback(con);
//		}
//		
//		System.out.println("upadate service : " + pr);
//		
//		close(con);
//		
//		return pr;
//	}
}




















