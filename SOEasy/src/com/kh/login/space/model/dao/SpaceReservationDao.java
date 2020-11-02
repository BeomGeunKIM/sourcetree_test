package com.kh.login.space.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import static com.kh.login.common.JDBCTemplate.*;

import com.kh.login.space.model.vo.SpaceInfo;
import com.kh.login.space.model.vo.SpaceReservation;

public class SpaceReservationDao {
	
	private Properties prop = new Properties();
	
	public SpaceReservationDao() {
		
		String propName = SpaceDao.class.getResource("/sql/space/spaceReserv-query.properties").getPath();
		
		try {
			prop.load(new FileReader(propName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public int insertReservationCowork(Connection con, SpaceReservation requestMember, SpaceInfo si) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertReservCo");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, requestMember.getGuestNo());
			pstmt.setInt(2, si.getSpaceNo());
			pstmt.setString(3, requestMember.getFixUnfix());
			pstmt.setString(4, requestMember.getStartDate());
			pstmt.setString(5, requestMember.getEndDate());
			pstmt.setInt(6, requestMember.getReservPersonCount());
			pstmt.setInt(7, requestMember.getExpectPay());
			pstmt.setString(8, requestMember.getUserName());
			pstmt.setString(9, requestMember.getUserPhone());
			pstmt.setString(10, requestMember.getUserEmail());
			pstmt.setString(11, requestMember.getRequestContent());
			
			result = pstmt.executeUpdate();
			 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertReservationIndepen(Connection con, SpaceReservation requestMember, SpaceInfo si) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertReservIdepen");
		
		try {
			pstmt = con.prepareStatement(query);
			
			//(SEQ_RESERV.NEXTVAL, ?, ?, NULL, ?, TO_CHAR(?, 'YYYYMMDD'), TO_CHAR(?, 'YYYYMMDD'), ?, DEFAULT, DEFAULT, DEFAULT, SYSDATE, ?, ?, ?, ?, ?);
			pstmt.setInt(1, requestMember.getGuestNo());
			pstmt.setInt(2, si.getSpaceNo());
			pstmt.setString(3, requestMember.getOfficeNo());
			pstmt.setString(4, requestMember.getStartDate());
			pstmt.setString(5, requestMember.getEndDate());
			pstmt.setInt(6, requestMember.getReservPersonCount());
			pstmt.setInt(7, requestMember.getExpectPay());
			pstmt.setString(8, requestMember.getUserName());
			pstmt.setString(9, requestMember.getUserPhone());
			pstmt.setString(10, requestMember.getUserEmail());
			pstmt.setString(11, requestMember.getRequestContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<SpaceReservation> selectAllMyReser(Connection con, int guestNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SpaceReservation> returnList = null;
		
		String query = prop.getProperty("selectMyReserv");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, guestNo);
			rset = pstmt.executeQuery();
			
			returnList = new ArrayList<>();
			
			while(rset.next()) {
				
				SpaceReservation sr = new SpaceReservation();
				//sr.set
				
				//returnList.add(sr);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return returnList;
	}

}

















