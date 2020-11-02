package com.kh.login.host.manageReserve.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.login.host.manageReserve.model.vo.HostReservation;
import com.kh.login.host.manageReserve.model.vo.HostReserve;
import com.kh.login.host.manageReserve.model.vo.PageInfo;
import com.kh.login.host.manageReserve.model.vo.PaymentRequest;
import com.kh.login.space.model.vo.SpaceReservation;

import static com.kh.login.common.JDBCTemplate.*;

public class HostReserveDao {
	private Properties prop = new Properties();

	public HostReserveDao() {
		String fileName = HostReserveDao.class.getResource("/sql/host/host-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//예약 승인 리스트 번호 조회
	public int getListCount(Connection con, int hostNo) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("listCount");
		System.out.println(query);

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, hostNo);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			System.out.println("Dao ListCount : " + listCount);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		

		return listCount;
	}

	//예약대기 리스트 카운트
	public int getRequestCount(Connection con, int hostNo) {
		PreparedStatement pstmt = null;
		int requestCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("requestCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, hostNo);
			
			System.out.println("wpqkf hostno : " + hostNo);
			rset = pstmt.executeQuery();

			if(rset.next()) {
				requestCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		System.out.println("Dao requestCount : " + requestCount);

		return requestCount;
	}



	//예약 승인 요청 관리 목록 조회
	public ArrayList<PaymentRequest> selectList(Connection con, PageInfo pi, int hostNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PaymentRequest> list = null;

		String query = prop.getProperty("selectList");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (pi.getCurrentPage() -1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() -1;

			pstmt.setInt(1, 1);
			pstmt.setInt(2, 2);
			pstmt.setInt(3, hostNo);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<>();

			while(rset.next()) {
				PaymentRequest pr = new PaymentRequest();
				pr.setReserveNo(rset.getInt("RESERV_NO"));
				pr.setGuestId(rset.getString("M_ID"));
				pr.setGuestName(rset.getString("M_NAME"));
				pr.setStartDay(rset.getDate("START_DATE"));
				pr.setEndDay(rset.getDate("END_DATE"));
				pr.setReservePersonCount(rset.getInt("RESERV_PERSON_COUNT"));
				pr.setSpaceName(rset.getString("SPACE_NAME"));
				pr.setOfficeNo(rset.getString("OFFICE_NO"));
				pr.setExpectPay(rset.getInt("EXPECT_PAY"));
				pr.setDidHostOk(rset.getInt("DID_HOST_OK"));

				list.add(pr);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}


		return list;
	}

	//호스트 예약승인 여부 업데이트
	public int updateReserveRequest(Connection con, int nno, int rno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateReserveRequest");
		System.out.println("dao nno : " + nno);
		System.out.println("dao rno : " + rno);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nno);
			pstmt.setInt(2, rno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println("update dao : " + result);
		
		
		return result;
	}

	//호스트 예약내역 조회
	public ArrayList<HostReserve> selectHostReserve(Connection con, int hostNo, int spaceNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HostReserve> list = new ArrayList<HostReserve>();
		
		String query = prop.getProperty("selectHostReserve");
		
		System.out.println("호스트 예약정보 테이블 출력 : " + query);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, spaceNo);
			pstmt.setInt(2, hostNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				HostReserve hostReserve = new HostReserve();
				
				hostReserve.setSpaceNo(rset.getInt("SPACE_NO"));				
				hostReserve.setHostNo(rset.getInt("HOST_NO"));
				hostReserve.setReserveNo(rset.getInt("RESERV_NO"));
				hostReserve.setOfficeNo(rset.getString("OFFICE_NO"));
				hostReserve.setSpaceName(rset.getString("SPACE_NAME"));
				hostReserve.setSpaceKind(rset.getInt("SPACE_KIND"));
				hostReserve.setDidHostOk(rset.getInt("DID_HOST_OK"));
				hostReserve.setReservePersonCount(rset.getInt("RESERV_PERSON_COUNT"));
				hostReserve.setReserveStatus(rset.getInt("RESERV_STATUS"));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String sDay = sdf.format(rset.getTimestamp("START_DATE"));
				String eDay = sdf.format(rset.getTimestamp("END_DATE"));
				String rDay = sdf.format(rset.getTimestamp("RESERV_DATE"));
				hostReserve.setStartDay(sDay);
				hostReserve.setEndDay(eDay);
				hostReserve.setReserveDate(rDay);
				hostReserve.setUserName(rset.getString("USER_NAME"));
				
				list.add(hostReserve);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public int insertHostReserve(Connection con, HostReservation requestMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertHostReserve");
		
		
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, requestMember.getHostNo());
			pstmt.setInt(2, requestMember.getSpaceNo());
			pstmt.setString(3, requestMember.getFixUnfix());
			pstmt.setString(4, requestMember.getOfficeNo());
			pstmt.setString(5, requestMember.getStartDate());
			pstmt.setString(6, requestMember.getEndDate());
			pstmt.setInt(7, requestMember.getReservPersonCount());
			pstmt.setInt(8, requestMember.getExpectPay());
			pstmt.setString(9, requestMember.getUserName());
			pstmt.setString(10, requestMember.getUserPhone());
			pstmt.setString(11, requestMember.getUserEmail());
			pstmt.setString(12, requestMember.getRequestContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getOfficeCount(Connection con, int spaceNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("selectOfficeCount");
		System.out.println("dao spaceNo : " + spaceNo);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, spaceNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println("officeCount dao : " + result);
		
		
		return result;
	}

	public ArrayList<HostReserve> selectRoungeInfo(Connection con, int hostNo, int spaceNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HostReserve>  list = null;
		
		String query = prop.getProperty("selectRoungeInfo");
		
		try {
			pstmt = con.prepareStatement(query);
//			pstmt.setInt(1, spaceNo);
			pstmt.setInt(1, hostNo);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<HostReserve>();
			while(rset.next()) {
				
				HostReserve hostReserve = new HostReserve();
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String sDay = sdf.format(rset.getTimestamp("START_DATE"));
				String eDay = sdf.format(rset.getTimestamp("END_DATE"));
				hostReserve.setStartDay(sDay);
				hostReserve.setEndDay(eDay);
				hostReserve.setReserveDate(rset.getString("RESERV_DATE"));
				hostReserve.setSpaceNo(rset.getInt("SPACE_NO"));			
				hostReserve.setHostNo(rset.getInt("HOST_NO"));
				hostReserve.setReserveNo(rset.getInt("RESERV_NO"));
				hostReserve.setOfficeNo(rset.getString("OFFICE_NO"));
				hostReserve.setSpaceName(rset.getString("SPACE_NAME"));
				hostReserve.setSpaceKind(rset.getInt("SPACE_KIND"));
				hostReserve.setDidHostOk(rset.getInt("DID_HOST_OK"));
				hostReserve.setReservePersonCount(rset.getInt("RESERV_PERSON_COUNT"));
				hostReserve.setReserveStatus(rset.getInt("RESERV_STATUS"));
				hostReserve.setUserName(rset.getString("USER_NAME"));
				
				list.add(hostReserve);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public int updateCount(Connection con, int reserveNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateReserve");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reserveNo);
			pstmt.setInt(2, reserveNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public HostReserve selectOne(Connection con, int reserveNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HostReserve  list = new HostReserve();
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reserveNo);
			pstmt.setInt(2, reserveNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				HostReserve hostReserve = new HostReserve();
				
				hostReserve.setSpaceNo(rset.getInt("SPACE_NO"));			
				hostReserve.setHostNo(rset.getInt("HOST_NO"));
				hostReserve.setReserveNo(rset.getInt("RESERV_NO"));
				hostReserve.setOfficeNo(rset.getString("OFFICE_NO"));
				hostReserve.setSpaceName(rset.getString("SPACE_NAME"));
				hostReserve.setSpaceKind(rset.getInt("SPACE_KIND"));
				hostReserve.setDidHostOk(rset.getInt("DID_HOST_OK"));
				hostReserve.setReservePersonCount(rset.getInt("RESERV_PERSON_COUNT"));
				hostReserve.setReserveStatus(rset.getInt("RESERV_STATUS"));
				hostReserve.setStartDay(rset.getString("START_DATE"));
				hostReserve.setEndDay(rset.getString("END_DATE"));
				hostReserve.setReserveDate(rset.getString("RESERV_DATE"));
				hostReserve.setUserName(rset.getString("USER_NAME"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public int updateOne(Connection con, int reserveNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reserveNo);
			
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int findSpaceNo(Connection con, int hostNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int spaceNo = -1;
		String query = prop.getProperty("findSpaceNo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, hostNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				spaceNo = rset.getInt("SPACE_NO");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return spaceNo;
	}


	//호스트 예약 승인 버튼 눌렀을 때 결과 불러오기
	
	
	
	


}











