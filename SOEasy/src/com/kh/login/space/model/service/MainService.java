package com.kh.login.space.model.service;

import static com.kh.login.common.JDBCTemplate.close;
import static com.kh.login.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.login.host.manageReserve.model.vo.PageInfo;
import com.kh.login.space.model.dao.MainDao;
import com.kh.login.space.model.vo.SpaceInfo;

public class MainService {

	public ArrayList<HashMap<String,Object>> selectAll(PageInfo pi) {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> spaceList = new MainDao().selectAllList(con,pi);
		
		close(con);
		
		return spaceList;
		
		
		
	}

	public int getListCount() {

		Connection con = getConnection();
		int listCount = new MainDao().getListCount(con);
		
		close(con);
		
		return listCount;
		
	}

}
