package com.kh.login.guest.model.service;

import static com.kh.login.common.JDBCTemplate.*;
import static com.kh.login.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import com.kh.login.guest.model.dao.GuestDao;
import com.kh.login.guest.model.vo.ReserveHistory;

public class GuestService {

	public ArrayList<ReserveHistory> getYourReserveList(int memberNo) {
		Connection con = getConnection();
		ArrayList<ReserveHistory> reserveList = null;
		reserveList = new GuestDao().getYourReserveList(con,memberNo); 
		close(con);
		return reserveList;
	}

	public int getListReserveCount(int memberNo) {
		Connection con = getConnection();
		int reserveListCount = new GuestDao().getReserveListCount(con,memberNo);
		
		return reserveListCount;
	}

	public int insertPayHistory(HashMap<String, Object> payHistory) {
		Connection con = getConnection();
		
		int result = new GuestDao().insertPayHistory(con,payHistory);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

	public int updateRstatus(ArrayList<HashMap<Integer, Integer>> rstatusArr, int length) {
		Connection con = getConnection();
		int result = 0;
		int result1 = 0;
		for(int i =0; i<length; i++) {
			HashMap<Integer,Integer> hmap = rstatusArr.get(i);
		int reservNo = 0;	
		Iterator<Integer> keys = hmap.keySet().iterator();
		if(keys.hasNext()) {
			reservNo = keys.next();
		}
			
		int rStatus = hmap.get(reservNo);
		
		result1 += new GuestDao().updateRstatus(con,reservNo,rStatus);
		}
		
		if(result1>=length) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		
		
		return result;
	}

}
