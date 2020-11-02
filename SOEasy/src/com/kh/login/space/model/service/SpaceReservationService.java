package com.kh.login.space.model.service;

import static com.kh.login.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.login.space.model.dao.SpaceReservationDao;
import com.kh.login.space.model.vo.SpaceInfo;
import com.kh.login.space.model.vo.SpaceReservation;

public class SpaceReservationService {

	public ArrayList<HashMap<String, Object>> insertReservation(SpaceReservation requestMember, SpaceInfo si) {

		Connection con = getConnection();
		SpaceReservationDao srd = new SpaceReservationDao();
		int result = 0;
		
		if(si.getSpaceKind() == 1) {
			result = srd.insertReservationIndepen(con, requestMember, si);
		} else if(si.getSpaceKind() == 2) {
			result = srd.insertReservationCowork(con, requestMember, si);
		}
		
		ArrayList<HashMap<String, Object>> returnList = new ArrayList<>();
		HashMap<String, Object> hmap = new HashMap<>();
		ArrayList<SpaceReservation> sr = null;
		
		if(result > 0) {
//			commit(con);	//테스트용 풀지말것.
			sr = new SpaceReservationDao().selectAllMyReser(con, requestMember.getGuestNo());
				if(sr != null && si != null) {
					commit(con);
				} else {
					rollback(con);
					returnList = null;
				}
		} else { 
			//rollback(con);
			returnList = null; //혹시몰라서
		}
		
		hmap.put("spaceReser", sr); 
		hmap.put("spaceInfo", si);
		returnList.add(hmap);
		
		close(con);
		
		return returnList;
	}

}
