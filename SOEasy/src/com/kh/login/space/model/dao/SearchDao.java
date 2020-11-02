package com.kh.login.space.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.login.host.manageReserve.model.vo.PageInfo;
import com.kh.login.space.model.vo.SearchFilter;
import com.kh.login.space.model.vo.SpaceInfo;

import static com.kh.login.common.JDBCTemplate.*;

public class SearchDao {

	private Properties prop = new Properties();
	
	public SearchDao() {
		String fileName = SearchDao.class.getResource("/sql/space/search-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public int getListCount(Connection con, String search) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("searchListCount");
		System.out.println("search dao list count : " + search);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			pstmt.setString(4, search);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
				System.out.println("search list count : " + listCount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return listCount;
	}


	public ArrayList<HashMap<String, Object>> selectList(Connection con, PageInfo pi, String search) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		
		String query = prop.getProperty("selectSpace");
		
		try {
			pstmt = con.prepareStatement(query);
			System.out.println(pi.getCurrentPage());
			int startRow = (pi.getCurrentPage() -1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() -1;
			
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			pstmt.setString(4, search);
			pstmt.setInt(5, startRow);
			pstmt.setInt(6, endRow);
			
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<> ();
			
			while(rset.next()) {
				hmap = new HashMap<>();
				hmap.put("spaceNo", rset.getInt("SPACE_NO"));
				hmap.put("hostNo", rset.getInt("HOST_NO"));
				hmap.put("spaceName", rset.getString("SPACE_NAME"));
				hmap.put("spaceKind", rset.getInt("SPACE_KIND"));
				hmap.put("spaceAddress", rset.getString("SPACE_ADDRESS"));
				hmap.put("sStatus", rset.getString("S_STATUS"));
				hmap.put("spaceIntro", rset.getString("SPACE_INTRO"));
				hmap.put("spaceShortIntro", rset.getString("SPACE_SHORT_INTRO"));
				hmap.put("didPayReserve", rset.getString("DID_DAY_RESERV"));
				hmap.put("dayPay", rset.getInt("DAY_PAY"));
				hmap.put("didMonthReserve", rset.getString("DID_MONTH_RESERV"));
				hmap.put("monthPay", rset.getInt("MONTH_PAY"));
				hmap.put("spaceLocationFilter", rset.getString("SPACE_LOCATION_FILTER"));
				hmap.put("imgNo", rset.getInt("IMG_NO"));
				hmap.put("originName", rset.getString("ORIGIN_NAME"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("imgDiv", rset.getInt("IMG_DIV"));
				hmap.put("memberNo", rset.getInt("MEMBER_NO"));
				hmap.put("fileLevel", rset.getInt("FILE_LEVEL"));
				
				list.add(hmap);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}


	public int getFilterListCount(Connection con, SearchFilter sf) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = "SELECT COUNT(*) FROM SPACE_INF S JOIN IMAGE I ON(S.SPACE_NO = I.SPACE_NO) WHERE I.FILE_LEVEL=0 AND S.S_STATUS = 'Y' AND IMG_DIV = 0";
		if(!sf.getSearch().equals(null)) {
		query += " AND (SPACE_LOCATION_FILTER LIKE '%' || '" + sf.getSearch() + "' || '%' OR S.SPACE_INTRO LIKE '%' || '" + sf.getSearch() + "' || '%' OR S.SPACE_SHORT_INTRO LIKE '%' || '" + sf.getSearch() + "' || '%' OR S.SPACE_NAME LIKE '%' || '" + sf.getSearch() + "' || '%')";
		}
		if(!sf.getSpaceKind().equals("null")) {
			query += " AND S.SPACE_KIND LIKE '%' || " + sf.getSpaceKind() + " || '%'";
		}
		if(!sf.getSpaceLocationFilter().equals("null")) {
			query += " AND S.SPACE_LOCATION_FILTER LIKE '%' || '" + sf.getSpaceLocationFilter() + "' || '%'";
		}
//		if(sf.getDidHostOk().equals("3")) {
//			query += " AND S.DID_HOST_OK LIKE '%' || 3 || '%'";
//		}
		if(sf.getTerm().equals("DAY_PAY")) {
			query += " AND S.DAY_PAY IS NOT NULL";
		}
		if(sf.getTerm().equals("MONTH_PAY")) {
			query += " AND S.MONTH_PAY IS NOT NULL";
		}
		query += " AND (S.DAY_PAY BETWEEN " + sf.getLowPrice() + " AND " + sf.getHighPrice() + " OR S.MONTH_PAY BETWEEN " + sf.getLowPrice() + " AND " + sf.getHighPrice() + ")";
		
		if(sf.getSort().equals("recommendSort")) {
			
		}
		if(sf.getSort().equals("lowPriceSort")) {
			query += " ORDER BY DAY_PAY ASC, MONTH_PAY ASC";
		}
		if(sf.getSort().equals("highPriceSort")) {
			query += " ORDER BY DAY_PAY DESC, MONTH_PAY DESC";
		}
		
		
		System.out.println("query : " + query);
		
		
		
		try {
			pstmt = con.prepareStatement(query);
			
			
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				listCount = rset.getInt(1);
				System.out.println("search filter list count : " + listCount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> filterSelectList(Connection con, PageInfo pi, SearchFilter sf) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		System.out.println(pi.getCurrentPage());
		int startRow = (pi.getCurrentPage() -1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() -1;
		
		String query = "SELECT RNUM , SPACE_NO , HOST_NO , SPACE_NAME , SPACE_KIND , SPACE_ADDRESS , S_STATUS , SPACE_INTRO , SPACE_SHORT_INTRO , DID_DAY_RESERV , DAY_PAY , DID_MONTH_RESERV , MONTH_PAY , SPACE_LOCATION_FILTER , IMG_NO , ORIGIN_NAME , FILE_PATH , CHANGE_NAME , IMG_DIV , MEMBER_NO , FILE_LEVEL FROM (SELECT ROWNUM RNUM , SPACE_NO , HOST_NO , SPACE_NAME , SPACE_KIND , SPACE_ADDRESS , S_STATUS , SPACE_INTRO , SPACE_SHORT_INTRO , DID_DAY_RESERV , DAY_PAY , DID_MONTH_RESERV , MONTH_PAY , SPACE_LOCATION_FILTER , IMG_NO , ORIGIN_NAME , FILE_PATH , CHANGE_NAME , IMG_DIV , MEMBER_NO , FILE_LEVEL FROM (SELECT S.SPACE_NO , S.HOST_NO , S.SPACE_NAME , S.SPACE_KIND , S.SPACE_ADDRESS , S.S_STATUS , S.SPACE_INTRO , S.SPACE_SHORT_INTRO , S.DID_DAY_RESERV , S.DAY_PAY , S.DID_MONTH_RESERV , S.MONTH_PAY , S.SPACE_LOCATION_FILTER , I.IMG_NO , I.ORIGIN_NAME , I.FILE_PATH , I.CHANGE_NAME , I.IMG_DIV , I.MEMBER_NO , I.FILE_LEVEL FROM SPACE_INF S JOIN IMAGE I ON(S.SPACE_NO = I.SPACE_NO) WHERE I.FILE_LEVEL=0 AND S.S_STATUS = 'Y' AND IMG_DIV = 0";
		if(!sf.getSearch().equals(null)) {
		query += " AND (SPACE_LOCATION_FILTER LIKE '%' || '" + sf.getSearch() + "' || '%' OR S.SPACE_INTRO LIKE '%' || '" + sf.getSearch() + "' || '%' OR S.SPACE_SHORT_INTRO LIKE '%' || '" + sf.getSearch() + "' || '%' OR S.SPACE_NAME LIKE '%' || '" + sf.getSearch() + "' || '%')";
		}
		if(!sf.getSpaceKind().equals("null")) {
			query += " AND S.SPACE_KIND LIKE '%' || " + sf.getSpaceKind() + " || '%'";
		}
		if(!sf.getSpaceLocationFilter().equals("null")) {
			query += " AND S.SPACE_LOCATION_FILTER LIKE '%' || '" + sf.getSpaceLocationFilter() + "' || '%'";
		}
//		if(sf.getDidHostOk().equals("3")) {
//			query += " AND S.DID_HOST_OK LIKE '%' || 3 || '%'";
//		}
		if(sf.getTerm().equals("DAY_PAY")) {
			query += " AND S.DAY_PAY IS NOT NULL";
		}
		if(sf.getTerm().equals("MONTH_PAY")) {
			query += " AND S.MONTH_PAY IS NOT NULL";
		}
		query += " AND (S.DAY_PAY BETWEEN " + sf.getLowPrice() + " AND " + sf.getHighPrice() + " OR S.MONTH_PAY BETWEEN " + sf.getLowPrice() + " AND " + sf.getHighPrice() + ")";
		
		if(sf.getSort().equals("recommendSort")) {
			
		}
		if(sf.getSort().equals("lowPriceSort")) {
			query += " ORDER BY DAY_PAY ASC, MONTH_PAY ASC";
		}
		if(sf.getSort().equals("highPriceSort")) {
			query += " ORDER BY DAY_PAY DESC, MONTH_PAY DESC";
		}
		
		query += ")) WHERE RNUM BETWEEN " + startRow + " AND + " + endRow;
		
		System.out.println("query : " + query);
		
		try {
			pstmt = con.prepareStatement(query);
			
			
			
//			pstmt.setString(1, sf.getSearch());
//			pstmt.setString(2, sf.getSpaceKind());
//			pstmt.setString(3, sf.getSpaceLocationFilter());
//			pstmt.setString(4, sf.getTerm());
//			pstmt.setInt(5, sf.getLowPrice());
//			pstmt.setInt(6, sf.getHighPrice());
//			pstmt.setInt(7, sf.getLowPrice());
//			pstmt.setInt(8, sf.getHighPrice());
//			pstmt.setInt(9, startRow);
//			pstmt.setInt(10, endRow);
			
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<> ();
			
			while(rset.next()) {
				hmap = new HashMap<>();
				hmap.put("spaceNo", rset.getInt("SPACE_NO"));
				hmap.put("hostNo", rset.getInt("HOST_NO"));
				hmap.put("spaceName", rset.getString("SPACE_NAME"));
				hmap.put("spaceKind", rset.getInt("SPACE_KIND"));
				hmap.put("spaceAddress", rset.getString("SPACE_ADDRESS"));
				hmap.put("sStatus", rset.getString("S_STATUS"));
				hmap.put("spaceIntro", rset.getString("SPACE_INTRO"));
				hmap.put("spaceShortIntro", rset.getString("SPACE_SHORT_INTRO"));
				hmap.put("didPayReserve", rset.getString("DID_DAY_RESERV"));
				hmap.put("dayPay", rset.getInt("DAY_PAY"));
				hmap.put("didMonthReserve", rset.getString("DID_MONTH_RESERV"));
				hmap.put("monthPay", rset.getInt("MONTH_PAY"));
				hmap.put("spaceLocationFilter", rset.getString("SPACE_LOCATION_FILTER"));
				hmap.put("imgNo", rset.getInt("IMG_NO"));
				hmap.put("originName", rset.getString("ORIGIN_NAME"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("imgDiv", rset.getInt("IMG_DIV"));
				hmap.put("memberNo", rset.getInt("MEMBER_NO"));
				hmap.put("fileLevel", rset.getInt("FILE_LEVEL"));
				
				list.add(hmap);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

}
