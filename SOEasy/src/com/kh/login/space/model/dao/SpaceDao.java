package com.kh.login.space.model.dao;

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

import com.kh.login.space.model.vo.Image;
import com.kh.login.space.model.vo.QnA;
import com.kh.login.space.model.vo.Review;
import com.kh.login.space.model.vo.SpaceInfo;

import static com.kh.login.common.JDBCTemplate.*;

public class SpaceDao {
	
	private Properties prop = new Properties();
	
	public SpaceDao() {
		String propName = SpaceDao.class.getResource("/sql/space/space-query.properties").getPath();
		
		try {
			prop.load(new FileReader(propName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	//SPACE_INF - HOST_NO, SPACE_NAME, SPACE_KIND, SPACE_ADDRESS, SPACE_INTRO, SPACE_LOCATION_FILTER 입력용 메소드
	public int insertSpaceInfo(Connection con, SpaceInfo si) {
		
		PreparedStatement pstmt = null;
		int spaceInfResult = 0;
		
		String query = prop.getProperty("insertSpaceInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, si.getHostNo());
			pstmt.setString(2, si.getSpaceName());
			pstmt.setInt(3, si.getSpaceKind());
			pstmt.setString(4, si.getSpaceAddress());
			pstmt.setString(5, si.getSpaceIntro());
			pstmt.setString(6, si.getSpaceShortIntro());
			pstmt.setString(7, si.getSpaceLocationFilter());
			
			spaceInfResult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return spaceInfResult;
	}
	
	//SPACE_NO 조회용 메소드
	public int selectSNoCurrval(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int sNo = -1;
		
		String query = prop.getProperty("selectSNoCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				sNo = rset.getInt("currval");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return sNo;
	}
	
	//SPACE_KIND 가 OFFICE인 경우 입력용 메소드
	public int insertOffice(Connection con, SpaceInfo si, String officeNo) {
		
		PreparedStatement pstmt = null;
		int kind1Result = 0;
		
		String query = prop.getProperty("insertOffice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, si.getSpaceNo());
			pstmt.setString(2, officeNo);
			pstmt.setDouble(3, si.getSpaceSize());
			pstmt.setInt(4, si.getSpaceContainCount());
			
			kind1Result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return kind1Result;
	}
	
	//SPACE_KIND 가 COWORK인 경우 입력용 메소드
	public int insertCowork(Connection con, SpaceInfo si) {
		
		PreparedStatement pstmt = null;
		int kind2Result = 0;
		
		String query = prop.getProperty("insertCowork");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, si.getSpaceNo());
			pstmt.setInt(2, si.getTotalSeat());
			pstmt.setInt(3, si.getMaxReserv());
			pstmt.setInt(4, si.getFixSeat());
			pstmt.setInt(5, si.getUnfixSeat());
			
			kind2Result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return kind2Result;
	}
	
	//CONV_DETAIL 조회용 메소드
	public String selectConvDetail(Connection con, String convName) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String convNo = "";
		
		String query = prop.getProperty("selectConvDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, convName);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				convNo = rset.getString("CONV_NO");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return convNo;
	}
	
	//SPACE_CONV 입력용 메소드
	public int insertSpaceConv(Connection con, int spaceNo, String convNo) {
		
		PreparedStatement pstmt = null;
		int convResult = 0;
		
		String query = prop.getProperty("insertSpaceConv");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, spaceNo);
			pstmt.setString(2, convNo);
			
			convResult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return convResult;
	}

	//IMAGE 입력용 메소드
	public int insertSpaceImg(Connection con, Image image) {
		
		PreparedStatement pstmt = null;
		int imgResult = 0;
		
		String query = prop.getProperty("insertSpaceImg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, image.getOriginName());
			pstmt.setString(2, image.getFilePath());
			pstmt.setString(3, image.getChangeName());
			pstmt.setInt(4, image.getImgDiv());
			pstmt.setInt(5, image.getSpaceNo());
			pstmt.setInt(6, image.getFileLevel());
			
			imgResult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return imgResult;
	}
	
	//SPACE_NO와 일치하는 공간정보 조회용 메소드
	public SpaceInfo selectCurrentSpaceInfo(Connection con, int sNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		SpaceInfo si = null;
		
		String query = prop.getProperty("selectCurrentSpaceInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				si = new SpaceInfo();
				
				si.setSpaceNo(rset.getInt("SPACE_NO"));
				si.setHostNo(rset.getInt("HOST_NO"));
				si.setSpaceName(rset.getString("SPACE_NAME"));
				si.setSpaceKind(rset.getInt("SPACE_KIND"));
				si.setSpaceAddress(rset.getString("SPACE_ADDRESS"));
				si.setsStatus(rset.getString("S_STATUS"));
				si.setSpaceIntro(rset.getString("SPACE_INTRO"));
				si.setSpaceShortIntro(rset.getString("SPACE_SHORT_INTRO"));
				si.setDidDayReserv(rset.getString("DID_DAY_RESERV"));
				si.setDayPay(rset.getInt("DAY_PAY"));
				si.setDidMonthReserv(rset.getString("DID_MONTH_RESERV"));
				si.setMonthPay(rset.getInt("MONTH_PAY"));
				si.setSpaceLocationFilter(rset.getString("SPACE_LOCATION_FILTER"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return si;
	}

	//SPACE_INF DID_DAY_RESERV, DAY_PAY, DID_MONTH_RESERV, MONTH_PAY 입력용 메소드.
	//기존에 있는 공간번호에 작성하기 때문에 UPDATE문을 사용한다.
	public int insertSpaceInfOp(Connection con, SpaceInfo si) {
		
		PreparedStatement pstmt = null;
		int spaceInfOpResult = 0;
		
		String query = prop.getProperty("insertSpaceInfOp");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, si.getDidDayReserv());
			pstmt.setInt(2, si.getDayPay());
			pstmt.setString(3, si.getDidMonthReserv());
			pstmt.setInt(4, si.getMonthPay());
			pstmt.setInt(5, si.getSpaceNo());
			
			spaceInfOpResult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return spaceInfOpResult;
	}

	//SPACE_OPTIME SPACE_NO, DAY, START_TIME, END_TIME, OPEN_CHECK 입력용 메소드
	public int insertSpaceOptime(Connection con, int sNo, int day, int startTime, int endTime, String openCheck) {
		
		PreparedStatement pstmt = null;
		int optimeResult = 0;
		
		String query = prop.getProperty("insertSpaceOptime");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sNo);
			pstmt.setInt(2, day);
			pstmt.setInt(3, startTime);
			pstmt.setInt(4, endTime);
			pstmt.setString(5, openCheck);
			
			optimeResult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return optimeResult;
	}

	//REFUND_POLICY SPACE_NO, DATE_REFUND_RATE, REFUND_DATE 입력용 메소드
	public int insertRefundPolicy(Connection con, int sNo, double rate, int date) {
		
		PreparedStatement pstmt = null;
		int refundResult = 0;
		
		String query = prop.getProperty("insertRefundPolicy");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sNo);
			pstmt.setDouble(2, rate);
			pstmt.setInt(3, date);
			
			refundResult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return refundResult;
	}

	//HOST_INF BSNS_NAME, BSNS_LICENSE_NO, BSNS_TYPE, BSNS_CONDITION, BSNS_EVENT, BSNS_ADDRESS, CAL_EMAIL,
	//CAL_PHONE, CAL_BANK, CAL_ACCT_HOLDER, CAL_ACCT_NO, BSNS_REPRESENT_NAME 입력
	public int insertHostInf(Connection con, SpaceInfo si) {
		
		PreparedStatement pstmt = null;
		int hostInfResult = 0;
		
		String query = prop.getProperty("insertHostInf");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, si.getHostNo());
			pstmt.setString(2, si.getBsnsName());
			pstmt.setString(3, si.getBsnsLicenseNo());
			pstmt.setInt(4, si.getBsnsType());
			pstmt.setString(5, si.getBsnsCondition());
			pstmt.setString(6, si.getBsnsEvent());
			pstmt.setString(7, si.getBsnsAddress());
			pstmt.setString(8, si.getCalEmail());
			pstmt.setString(9, si.getCalPhone());
			pstmt.setString(10, si.getCalBank());
			pstmt.setString(11, si.getCalAcctHolder());
			pstmt.setString(12, si.getCalAcctNo());
			pstmt.setString(13, si.getRepresentName());
			
			hostInfResult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return hostInfResult;
	}


	public int insertBusinessImg(Connection con, Image licenseImage) {
		
		PreparedStatement pstmt = null;
		int imgResult = 0;
		
		String query = prop.getProperty("insertBusinessImg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, licenseImage.getOriginName());
			pstmt.setString(2, licenseImage.getFilePath());
			pstmt.setString(3, licenseImage.getChangeName());
			pstmt.setInt(4, licenseImage.getImgDiv());
			pstmt.setInt(5, licenseImage.getMemberNo());
			
			imgResult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return imgResult;
	}

	//공간 종류 조회용 메소드
	public int selectKind(Connection con, int sNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int kind = 0;
		
		String query = prop.getProperty("selectKind");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				kind = rset.getInt("SPACE_KIND");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return kind;
	}

	
	//OFFICE 인 경우 spaceInfo 조회용 메소드
	public SpaceInfo selectOfficeSpaceIntro(Connection con, SpaceInfo si) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		SpaceInfo returnSi = null;
		
		String query = prop.getProperty("selectOfficeSpaceIntro");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, si.getSpaceNo());
			
			rset = pstmt.executeQuery();
			
			returnSi = new SpaceInfo();
			returnSi.setSpaceNo(si.getSpaceNo());
			returnSi.setSpaceKind(si.getSpaceKind());
			String[] officeNo;
			String temp = "";
			while(rset.next()) {
				returnSi.setHostNo(rset.getInt("HOST_NO"));
				returnSi.setSpaceName(rset.getString("SPACE_NAME"));
				returnSi.setSpaceAddress(rset.getString("SPACE_ADDRESS"));
				returnSi.setSpaceIntro(rset.getString("SPACE_INTRO"));
				returnSi.setSpaceShortIntro(rset.getString("SPACE_SHORT_INTRO"));
				returnSi.setDidDayReserv(rset.getString("DID_DAY_RESERV"));
				returnSi.setDayPay(rset.getInt("DAY_PAY"));
				returnSi.setDidMonthReserv(rset.getString("DID_MONTH_RESERV"));
				returnSi.setMonthPay(rset.getInt("MONTH_PAY"));
				returnSi.setSpaceLocationFilter(rset.getString("SPACE_LOCATION_FILTER"));
				temp += rset.getString("OFFICE_NO") + "$";
				returnSi.setSpaceSize(rset.getInt("OFFICE_SIZE"));
				returnSi.setSpaceContainCount(rset.getInt("OFFICE_CAPACITY"));
			}
			officeNo = temp.split("\\$");
			returnSi.setSpaceRoomCount(officeNo.length);
			returnSi.setOfficeNo(officeNo);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return returnSi;
	}

	
	//COWORK 인 경우 spaceInfo 조회용 메소드
	public SpaceInfo selectCoworkSpaceIntro(Connection con, SpaceInfo si) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		SpaceInfo returnSi = null;
		
		String query = prop.getProperty("selectCoworkSpaceIntro");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, si.getSpaceNo());
			
			rset = pstmt.executeQuery();
			
			returnSi = new SpaceInfo();
			returnSi.setSpaceNo(si.getSpaceNo());
			returnSi.setSpaceKind(si.getSpaceKind());
			
			while(rset.next()) {
				returnSi.setHostNo(rset.getInt("HOST_NO"));
				returnSi.setSpaceName(rset.getString("SPACE_NAME"));
				returnSi.setSpaceAddress(rset.getString("SPACE_ADDRESS"));
				returnSi.setSpaceIntro(rset.getString("SPACE_INTRO"));
				returnSi.setSpaceShortIntro(rset.getString("SPACE_SHORT_INTRO"));
				returnSi.setDidDayReserv(rset.getString("DID_DAY_RESERV"));
				returnSi.setDayPay(rset.getInt("DAY_PAY"));
				returnSi.setDidMonthReserv(rset.getString("DID_MONTH_RESERV"));
				returnSi.setMonthPay(rset.getInt("MONTH_PAY"));
				returnSi.setSpaceLocationFilter(rset.getString("SPACE_LOCATION_FILTER"));
				returnSi.setTotalSeat(rset.getInt("NUMBER_SEATS"));
				returnSi.setMaxReserv(rset.getInt("MAX_CAPACITY"));
				returnSi.setFixSeat(rset.getInt("FIX_SEATS"));
				returnSi.setUnfixSeat(rset.getInt("UNFIX_SEATS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return returnSi;
	}


	//공간의 편의시설명을 조회용 메소드
	public String[] selectSpaceConv(Connection con, int sNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String[] conv = null;
		
		String query = prop.getProperty("selectSpaceConv");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sNo);
			
			rset = pstmt.executeQuery();
			String returns = "";
			while(rset.next()) {
				returns += rset.getString(1) + "$";
			}
			
			conv = returns.split("\\$");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return conv;
	}

	//공간 운영시간 조회용 메소드
	public SpaceInfo selectSpaceOptime(Connection con, SpaceInfo si) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		SpaceInfo returnSi = null;
		
		String query = prop.getProperty("selectSpaceOptime");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, si.getSpaceNo());
			
			rset = pstmt.executeQuery();
			returnSi = new SpaceInfo();
			
			int i = 0;
			int[] startTimes = new int[7];
			int[] endTimes = new int[7];
			String[] openChecks = new String[7];
			
			while(rset.next()) {
				startTimes[i] = rset.getInt("START_TIME");
				endTimes[i] = rset.getInt("END_TIME");
				openChecks[i] = rset.getString("OPEN_CHECK");
				i++;
			}
			
			returnSi.setStartTimes(startTimes);
			returnSi.setEndTimes(endTimes);
			returnSi.setOpenChecks(openChecks);
			returnSi.setSpaceNo(si.getSpaceNo());
			returnSi.setSpaceKind(si.getSpaceKind());
			returnSi.setHostNo(si.getHostNo());
			returnSi.setSpaceName(si.getSpaceName());
			returnSi.setSpaceAddress(si.getSpaceAddress());
			returnSi.setSpaceIntro(si.getSpaceIntro());
			returnSi.setSpaceShortIntro(si.getSpaceShortIntro());
			returnSi.setDidDayReserv(si.getDidDayReserv());
			returnSi.setDayPay(si.getDayPay());
			returnSi.setDidMonthReserv(si.getDidMonthReserv());
			returnSi.setMonthPay(si.getMonthPay());
			returnSi.setSpaceLocationFilter(si.getSpaceLocationFilter());
			returnSi.setOfficeNo(si.getOfficeNo());
			returnSi.setSpaceSize(si.getSpaceSize());
			returnSi.setSpaceRoomCount(si.getSpaceRoomCount());
			returnSi.setSpaceContainCount(si.getSpaceContainCount());
			returnSi.setTotalSeat(si.getTotalSeat());
			returnSi.setMaxReserv(si.getMaxReserv());
			returnSi.setFixSeat(si.getFixSeat());
			returnSi.setUnfixSeat(si.getUnfixSeat());
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return returnSi;
	}

	//환불정책 조회용 메소드
	public SpaceInfo selectRefundPolicy(Connection con, SpaceInfo si) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		SpaceInfo returnSi = null;
		
		String query = prop.getProperty("selectRefundPolicy");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, si.getSpaceNo());
			
			rset = pstmt.executeQuery();
			returnSi = new SpaceInfo();
			double[] spaceRefundPolicy = new double[9];
			int i = 0;
			
			while(rset.next()) {
				spaceRefundPolicy[i] = rset.getInt("DATE_REFUND_RATE");
				i++;
			}
			returnSi.setSpaceNo(si.getSpaceNo());
			returnSi.setSpaceKind(si.getSpaceKind());
			returnSi.setHostNo(si.getHostNo());
			returnSi.setSpaceName(si.getSpaceName());
			returnSi.setSpaceAddress(si.getSpaceAddress());
			returnSi.setSpaceIntro(si.getSpaceIntro());
			returnSi.setSpaceShortIntro(si.getSpaceShortIntro());
			returnSi.setDidDayReserv(si.getDidDayReserv());
			returnSi.setDayPay(si.getDayPay());
			returnSi.setDidMonthReserv(si.getDidMonthReserv());
			returnSi.setMonthPay(si.getMonthPay());
			returnSi.setSpaceLocationFilter(si.getSpaceLocationFilter());
			returnSi.setOfficeNo(si.getOfficeNo());
			returnSi.setSpaceSize(si.getSpaceSize());
			returnSi.setSpaceRoomCount(si.getSpaceRoomCount());
			returnSi.setSpaceContainCount(si.getSpaceContainCount());
			returnSi.setTotalSeat(si.getTotalSeat());
			returnSi.setMaxReserv(si.getMaxReserv());
			returnSi.setFixSeat(si.getFixSeat());
			returnSi.setUnfixSeat(si.getUnfixSeat());
			returnSi.setStartTimes(si.getStartTimes());
			returnSi.setEndTimes(si.getEndTimes());
			returnSi.setOpenChecks(si.getOpenChecks());
			returnSi.setSpaceRefundPolicy(spaceRefundPolicy);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return returnSi;
	}
	
	//호스트 정보 조회
	public SpaceInfo selectHostInf(Connection con, SpaceInfo si) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		SpaceInfo returnSi = null;
		
		String query = prop.getProperty("selectHostInf");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, si.getHostNo());
			
			rset = pstmt.executeQuery();
			returnSi = new SpaceInfo();
			while(rset.next()) {
				returnSi.setBsnsName(rset.getString("BSNS_NAME"));
				returnSi.setBsnsLicenseNo(rset.getString("BSNS_LICENSE_NO"));
				returnSi.setBsnsType(rset.getInt("BSNS_TYPE"));
				returnSi.setBsnsCondition(rset.getString("BSNS_CONDITION"));
				returnSi.setBsnsEvent(rset.getString("BSNS_EVENT"));
				returnSi.setBsnsAddress(rset.getString("BSNS_ADDRESS"));
				returnSi.setCalEmail(rset.getString("CAL_EMAIL"));
				returnSi.setCalPhone(rset.getString("CAL_PHONE"));
				returnSi.setCalBank(rset.getString("CAL_BANK"));
				returnSi.setCalAcctHolder(rset.getString("CAL_ACCT_HOLDER"));
				returnSi.setCalAcctNo(rset.getString("CAL_ACCT_NO"));
				returnSi.setRepresentName(rset.getString("BSNS_REPRESENT_NAME"));
			}
			returnSi.setSpaceNo(si.getSpaceNo());
			returnSi.setSpaceKind(si.getSpaceKind());
			returnSi.setHostNo(si.getHostNo());
			returnSi.setSpaceName(si.getSpaceName());
			returnSi.setSpaceAddress(si.getSpaceAddress());
			returnSi.setSpaceIntro(si.getSpaceIntro());
			returnSi.setSpaceShortIntro(si.getSpaceShortIntro());
			returnSi.setDidDayReserv(si.getDidDayReserv());
			returnSi.setDayPay(si.getDayPay());
			returnSi.setDidMonthReserv(si.getDidMonthReserv());
			returnSi.setMonthPay(si.getMonthPay());
			returnSi.setSpaceLocationFilter(si.getSpaceLocationFilter());
			returnSi.setOfficeNo(si.getOfficeNo());
			returnSi.setSpaceSize(si.getSpaceSize());
			returnSi.setSpaceRoomCount(si.getSpaceRoomCount());
			returnSi.setSpaceContainCount(si.getSpaceContainCount());
			returnSi.setTotalSeat(si.getTotalSeat());
			returnSi.setMaxReserv(si.getMaxReserv());
			returnSi.setFixSeat(si.getFixSeat());
			returnSi.setUnfixSeat(si.getUnfixSeat());
			returnSi.setStartTimes(si.getStartTimes());
			returnSi.setEndTimes(si.getEndTimes());
			returnSi.setOpenChecks(si.getOpenChecks());
			returnSi.setSpaceRefundPolicy(si.getSpaceRefundPolicy());
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return returnSi;
	}

	// review list 조회용 메소드
	public ArrayList<Review> selectSpaceReviewList(Connection con, int sNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = null;
		
		String query = prop.getProperty("selectSpaceReviewList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sNo);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
			while(rset.next()) {
				Review r = new Review();
				
				r.setReviewNo(rset.getInt("REVIEW_NO"));
				r.setSpaceNo(rset.getInt("SPACE_NO"));
				r.setSpaceName(rset.getString("SPACE_NAME"));
				r.setMemberNo(rset.getInt("MEMBER_NO"));
				r.setMemberNick(rset.getString("M_NICK"));
				r.setReviewContent(rset.getString("REVIEW_CONTENT"));
				r.setrPoint(rset.getInt("R_POINT"));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String enrollDate = sdf.format(rset.getTimestamp("R_ENROLL_DATE"));
				r.setEnrollDate(enrollDate);
				
				list.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}


	public ArrayList<Image> selectSpaceImgList(Connection con, int sNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Image> list = null;
		
		String query = prop.getProperty("selectSpaceImgList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sNo);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
			while(rset.next()) {
				Image i = new Image();
				i.setImgNo(rset.getInt("IMG_NO"));
				i.setOriginName(rset.getString("ORIGIN_NAME"));
				i.setFilePath(rset.getString("FILE_PATH"));
				i.setChangeName(rset.getString("CHANGE_NAME"));
				i.setImgDiv(rset.getInt("IMG_DIV"));
				i.setSpaceNo(rset.getInt("SPACE_NO"));
				i.setFileLevel(rset.getInt("FILE_LEVEL"));
				
				list.add(i);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	//공간 QnA 조회용 메소드
	public ArrayList<QnA> selectSpaceQnaList(Connection con, int sNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<QnA> list = null;
		
		String query = prop.getProperty("selectSpaceQnaList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sNo);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
			while(rset.next()) {
				QnA q = new QnA();
				
				q.setqNo(rset.getInt("Q_NO"));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String qEnrollDate = sdf.format(rset.getTimestamp("Q_ENROLL_DATE"));
				q.setqEnrollDate(qEnrollDate);
				q.setqMemNo(rset.getInt("Q_MEM_NO"));
				q.setqMemNick(rset.getString("Q_MEM_NICK"));
				String rEnrollDate = sdf.format(rset.getTimestamp("R_ENROLL_DATE"));
				q.setrEnrollDate(rEnrollDate);
				q.setrMemNo(rset.getInt("R_MEM_NO"));
				q.setrMemNick(rset.getString("R_MEM_NICK"));
				q.setqContent(rset.getString("Q_CONTENT"));
				q.setrContent(rset.getString("R_CONTENT"));
				q.setqKind(rset.getInt("Q_KIND"));
				q.setSpaceNo(rset.getInt("SPACE_NO"));
				
				list.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	//해당 회원의 공간정보 갯수 조회용 메소드
	public int haveTempSpaceInfo(Connection con, int memberNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("haveTempSpaceInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

	//회원번호를 가진 공간정보 전체를 조회
	public ArrayList<SpaceInfo> selectTempSpaceOfOneMember(Connection con, int memberNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SpaceInfo> list = null;
		
		String query = prop.getProperty("selectTempSpaceOfOneMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
			while(rset.next()) {
				SpaceInfo s = new SpaceInfo();
				s.setSpaceNo(rset.getInt("SPACE_NO"));
				s.setSpaceName(rset.getString("SPACE_NAME"));
				s.setsStatus(rset.getString("S_STATUS"));
				s.setSpaceKind(rset.getInt("SPACE_KIND"));
				s.setSpaceShortIntro(rset.getString("SPACE_SHORT_INTRO"));
				
				list.add(s);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	//삭제 요청 처리용 메소드
	public int deleteRequest(Connection con, int sNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteRequest");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//수정된 SPACE_INF 업데이트 메소드
	public int updateSpaceInfo(Connection con, SpaceInfo si) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateSpaceInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, si.getSpaceName());
			pstmt.setInt(2, si.getSpaceKind());
			pstmt.setString(3, si.getSpaceAddress());
			pstmt.setString(4, si.getSpaceIntro());
			pstmt.setString(5, si.getSpaceShortIntro());
			pstmt.setString(6, si.getSpaceLocationFilter());
			pstmt.setInt(7, si.getSpaceNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	//기존 OFFICE 정보 삭제용 메소드
	public int deleteOldOffice(Connection con, int spaceNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteOldOffice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, spaceNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	//COWORK 업데이트용 메소드
	public int updateCowork(Connection con, SpaceInfo si) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCowork");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, si.getTotalSeat());
			pstmt.setInt(2, si.getMaxReserv());
			pstmt.setInt(3, si.getFixSeat());
			pstmt.setInt(4, si.getUnfixSeat());
			pstmt.setInt(5, si.getSpaceNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	//기존 편의시설 삭제용 메소드
	public int deleteConv(Connection con, int spaceNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteConv");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, spaceNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	//기존 사진 업데이트용 메소드
	public int updateSpaceImg(Connection con, Image image) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateSpaceImg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, image.getOriginName());
			pstmt.setString(2, image.getFilePath());
			pstmt.setString(3, image.getChangeName());
			pstmt.setInt(4, image.getSpaceNo());
			pstmt.setInt(5, image.getImgNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

//	//공간 운영시간 업데이트
//	public int updateSpaceOptime(Connection con, int sNo, int day, int startTime, int endTime, String openCheck) {
//		
//		PreparedStatement pstmt = null;
//		int result = 0;
//		
//		String query = prop.getProperty("updateSpaceOptime");
//		System.out.println(sNo + ", " + day + ", " + startTime + ", " + endTime + ", " + openCheck);
//		try {
//			pstmt = con.prepareStatement(query);
//			pstmt.setInt(1, startTime);
//			pstmt.setInt(2, endTime);
//			pstmt.setString(3, openCheck);
//			pstmt.setInt(4, sNo);
//			pstmt.setInt(5, day);
//			
//			result = pstmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		
//		return result;
//	}


//	public int updateRefundPolicy(Connection con, int sNo, double rate, int date) {
//		
//		PreparedStatement pstmt = null;
//		int result = 0;
//		
//		String query = prop.getProperty("updateRefundPolicy");
//		
//		try {
//			pstmt = con.prepareStatement(query);
//			pstmt.setInt(1, date);
//			pstmt.setInt(2, sNo);
//			pstmt.setInt(3, date);
//			
//			result = pstmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		
//		return result;
//	}

	//검수 신청 업데이트용 메소드
	public int updateInspection(Connection con, int spaceNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateInspection");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, spaceNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	//코웤 삭제용 메소드
	public int deleteOldCowork(Connection con, int spaceNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteOldCowork");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, spaceNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int deleteOptime(Connection con, int spaceNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteOptime");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, spaceNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int deleteRefund(Connection con, int spaceNo) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteRefund");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, spaceNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int deleteImg(Connection con, int spaceNo) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteImg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, spaceNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int deleteSpaceInf(Connection con, int spaceNo) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteSpaceInf");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, spaceNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//삭제 요청 취소용 메소드
	public int cancleDelReq(Connection con, int spaceNo) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("cancleDelReq");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, spaceNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//검수 신청 취소용 메소드
	public int cancleInspection(Connection con, int spaceNo) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("cancleInspection");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, spaceNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int haveHostInf(Connection con, SpaceInfo si) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectHostInf");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, si.getHostNo());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = 1;
			} else {
				result = 0;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

	
	//정산정보 업데이트 전 삭제용 메소드
	public int deleteHostInf(Connection con, SpaceInfo si) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteHostInf");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, si.getHostNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//정산정보 업데이트 전 삭제용 메소드
	public int deleteBusinessImg(Connection con, Image licenseImage) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteBusinessImg");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, licenseImage.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
