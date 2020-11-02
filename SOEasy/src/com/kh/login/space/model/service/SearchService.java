package com.kh.login.space.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.login.host.manageReserve.model.vo.PageInfo;
import com.kh.login.space.model.dao.SearchDao;
import com.kh.login.space.model.vo.SearchFilter;
import com.kh.login.space.model.vo.SpaceInfo;

import static com.kh.login.common.JDBCTemplate.*;

public class SearchService {


	public int getListCount(String search) {
		Connection con = getConnection();
		
		int listCount = new SearchDao().getListCount(con, search);
		
		close(con);
		
		
		return listCount;
	}


	public ArrayList<HashMap<String, Object>> selectList(PageInfo pi, String search) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new SearchDao().selectList(con, pi, search);
		
		close(con);
		
		return list;
	}


	public ArrayList<HashMap<String, Object>> filterSelectList(PageInfo pi, String search, SearchFilter sf) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new SearchDao().filterSelectList(con, pi, sf);
		
		close(con);
		
		return list;
	}


	public int getFilterListCount(SearchFilter sf) {
		Connection con = getConnection();
		
		int listCount = new SearchDao().getFilterListCount(con, sf);
		
		close(con);
		
		
		return listCount;
	}
	
}
