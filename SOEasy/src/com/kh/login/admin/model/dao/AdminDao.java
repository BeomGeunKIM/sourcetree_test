package com.kh.login.admin.model.dao;

import java.io.FileNotFoundException;
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

import com.kh.login.host.manageReserve.model.vo.PageInfo;
import com.kh.login.member.model.vo.RecoverMember;

import static com.kh.login.common.JDBCTemplate.*;

public class AdminDao {
	 private Properties prop = new Properties();
	public AdminDao() {
		String fileName = AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
		
		
	
	
	
	public int getImageCount(Connection con) {
		Statement stmt = null;
		int imageCount = -1;
		ResultSet rset = null;
		String query = prop.getProperty("getImageCount");
		
		try {
			stmt= con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				imageCount = rset.getInt(1);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return imageCount;
	}






	public int getHostCount(Connection con) {
		int hostCount = -1;
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getHostCount");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				hostCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return hostCount;
	}






	public int getNewSpaceCount(Connection con) {
		int newSpaceCount = -1;
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getNewSpaceCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				newSpaceCount = rset.getInt(1);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		
		return newSpaceCount;
	}






	public int getNewMembersCount(Connection con) {
		int newMembersCount = -1;
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getNewMembersCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				newMembersCount = rset.getInt(1);
			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return newMembersCount;
	}






	public String getTodaysBenefit(Connection con) {
		//환불건만 가득 있으면 수익이 음수가 나올 수 있기 떄문에 문자열 형으로 받아서 null처리하여 에러를 구분후
		//나중에 파싱한 결과값을 집어넣는다.
		
		String getTodaysBenefit = "10000";
		
		return getTodaysBenefit;
	}






	public ArrayList<RecoverMember> getLatestRecoverList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<RecoverMember> recoverList = null;
		
		String query = prop.getProperty("getLatestRecoverList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			recoverList = new ArrayList<RecoverMember>();
			while(rset.next()) {
				RecoverMember m = new RecoverMember();
				m.setrNum(rset.getInt("RESTORE_NO"));
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setUserId(rset.getString("M_ID"));
				m.setDropReason(rset.getString("M_DROP_REASON"));
				m.setEmail(rset.getString("RESTORE_EMAIL"));
				m.setRequestDate(rset.getDate("RESTORE_REQUEST_DATE"));
				m.setrStatus(rset.getInt("RESTORE_STATUS"));
				recoverList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return recoverList;
	}






	public int getDeleteRequestListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String query = prop.getProperty("getDeleteRequestCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		
		return listCount;
	}






	public ArrayList<HashMap<String, Object>> selectAllDeleteList(Connection con, PageInfo pi) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<HashMap<String, Object>> deleteList = null;
			String query = prop.getProperty("selectAllDeleteList");
			int startRow =(pi.getCurrentPage()-1)*pi.getLimit()+1;
			int endRow = startRow + pi.getLimit()-1;
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2,endRow);
				rset = pstmt.executeQuery();
				deleteList = new ArrayList<>();
				while(rset.next()) {
					HashMap<String, Object> hmap = new HashMap<>();
					hmap.put("spaceNo", rset.getInt("SPACE_NO"));
					hmap.put("spaceName", rset.getString("SPACE_NAME"));
					if(rset.getInt("SPACE_KIND")==1) {
						hmap.put("spaceKind", "독립오피스");
					}else if(rset.getInt("SPACE_KIND")==2) {
						hmap.put("spaceKind", "코워킹스페이스");
					}
					hmap.put("userId", rset.getString("M_ID"));
					hmap.put("userEmail", rset.getString("M_EMAIL"));
					hmap.put("userPhone", rset.getString("M_PHONE"));
					if(rset.getString("S_STATUS").equals("DW")) {
					 hmap.put("status", "삭제 대기 중");
					}else if(rset.getString("S_STATUS").equals("D")) {
						hmap.put("status", "삭제 완료");
					}
					
					
					deleteList.add(hmap);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
			
		
		return deleteList;
	}






	public int insertDeleteSpaceTable(Connection con, int spaceNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertDeleteSpaceTable");
		
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






	public int updateSpaceStatus(Connection con, int spaceNo, String status) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateSpaceStatus");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, status);
			pstmt.setInt(2, spaceNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}






	public int getDeleteRequestListCount(Connection con, String dStatus) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String query = prop.getProperty("getDeleteRequestListCount2")+" "+dStatus;
		System.out.println(query);
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	
	}






	public ArrayList<HashMap<String, Object>> selectAllDeleteList(Connection con, PageInfo pi, String dStatus) {

		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> deleteList = null;
		int startRow =(pi.getCurrentPage()-1)*pi.getLimit()+1;
		int endRow = startRow + pi.getLimit()-1;
		String query1 = prop.getProperty("selectAllDeleteList2");
		String query2 = dStatus+" ORDER BY SPACE_NO DESC)) WHERE RNUM BETWEEN "+startRow+ " AND "+endRow; 
		String query = query1+" "+query2;
		System.out.println(query);
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			deleteList = new ArrayList<>();
			while(rset.next()) {
				HashMap<String, Object> hmap = new HashMap<>();
				hmap.put("spaceNo", rset.getInt("SPACE_NO"));
				hmap.put("spaceName", rset.getString("SPACE_NAME"));
				if(rset.getInt("SPACE_KIND")==1) {
					hmap.put("spaceKind", "독립오피스");
				}else if(rset.getInt("SPACE_KIND")==2) {
					hmap.put("spaceKind", "코워킹스페이스");
				}
				hmap.put("userId", rset.getString("M_ID"));
				hmap.put("userEmail", rset.getString("M_EMAIL"));
				hmap.put("userPhone", rset.getString("M_PHONE"));
				if(rset.getString("S_STATUS").equals("DW")) {
				 hmap.put("status", "삭제 대기 중");
				}else if(rset.getString("S_STATUS").equals("D")) {
					hmap.put("status", "삭제 완료");
				}
				
				
				deleteList.add(hmap);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
	
	return deleteList;
	}






	public int getWaitingSpaceListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String query = prop.getProperty("getWaitingRequestCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		
		return listCount;
	
	}






	public ArrayList<HashMap<String, Object>> selectAllWaitingList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> deleteList = null;
		String query = prop.getProperty("selectAllWaitingList");
		int startRow =(pi.getCurrentPage()-1)*pi.getLimit()+1;
		int endRow = startRow + pi.getLimit()-1;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2,endRow);
			rset = pstmt.executeQuery();
			deleteList = new ArrayList<>();
			while(rset.next()) {
				HashMap<String, Object> hmap = new HashMap<>();
				hmap.put("spaceNo", rset.getInt("SPACE_NO"));
				hmap.put("spaceName", rset.getString("SPACE_NAME"));
				if(rset.getInt("SPACE_KIND")==1) {
					hmap.put("spaceKind", "독립오피스");
				}else if(rset.getInt("SPACE_KIND")==2) {
					hmap.put("spaceKind", "코워킹스페이스");
				}
				hmap.put("memberNo", rset.getInt("MEMBER_NO"));
				hmap.put("userId", rset.getString("M_ID"));
				hmap.put("userEmail", rset.getString("M_EMAIL"));
				hmap.put("userPhone", rset.getString("M_PHONE"));
				if(rset.getString("S_STATUS").equals("DW")) {
				 hmap.put("status", "삭제 대기중");
				}else if(rset.getString("S_STATUS").equals("D")) {
					hmap.put("status", "삭제 완료");
				}else if(rset.getString("S_STATUS").equals("IW")) {
					hmap.put("status", "검수 대기중");
				}else if(rset.getString("S_STATUS").equals("N")) {
					hmap.put("status", "작성중");
				}else if(rset.getString("S_STATUS").equals("Y")) {
					hmap.put("status", "활성화");
				}else if(rset.getString("S_STATUS").equals("ID")) {
					hmap.put("status", "검수 거절됨");
				}
				
				
				deleteList.add(hmap);
			}
			System.out.println(deleteList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
	
	return deleteList;
	}





	//가장 최근 5개의 공간 삭제 요청을 보여주는 메소드
	public ArrayList<HashMap<String, Object>> getLatestDeleteList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> deleteList = null;
		String query = prop.getProperty("selectAllDeleteList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, 5);
			rset = pstmt.executeQuery();
			deleteList = new ArrayList<>();
			
			while(rset.next()) {
				int count = 0;  //최신 목록 5개만 삽입
				if(count == 5) {
					break;
				}
				HashMap<String, Object> hmap = new HashMap();
				
				hmap.put("spaceNo", rset.getInt("SPACE_NO"));
				hmap.put("spaceName", rset.getString("SPACE_NAME"));
				if(rset.getInt("SPACE_KIND")==1) {
					hmap.put("spaceKind", "독립오피스");
				}else if(rset.getInt("SPACE_KIND")==2) {
					hmap.put("spaceKind", "코워킹스페이스");
				}
				hmap.put("userId", rset.getString("M_ID"));
				hmap.put("userEmail", rset.getString("M_EMAIL"));
				hmap.put("userPhone", rset.getString("M_PHONE"));
				if(rset.getString("S_STATUS").equals("DW")) {
				 hmap.put("status", "삭제 대기 중");
				}else if(rset.getString("S_STATUS").equals("D")) {
					hmap.put("status", "삭제 완료");
				}
				
				
				deleteList.add(hmap);
				count++;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
	
 		
		return deleteList;
	}






	public int updatingSpaceStatus(Connection con, String processType, int spaceNo) {
			PreparedStatement pstmt = null;
			int result = 0;
			String query = prop.getProperty("updateSpaceStatus");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, processType);
				pstmt.setInt(2, spaceNo);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			
		
		return result;
	}






	public int updateMemberStatus(Connection con, String userId) {
			PreparedStatement pstmt = null;
			int result = 0;
			String query = prop.getProperty("updateToHost");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, userId);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			
		
		return result;
	}






	public ArrayList<HashMap<String, Object>> getLatestWaitList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String,Object>> waitList = null;
		String query = prop.getProperty("getLatestWaitList");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			waitList = new ArrayList<>();
			while(rset.next()) {
				HashMap<String,Object> hmap = new HashMap<>();
				hmap.put("spaceNo", rset.getInt("SPACE_NO"));
				hmap.put("spaceName", rset.getString("SPACE_NAME"));
				if(rset.getInt("SPACE_KIND")==1) {
					hmap.put("spaceKind", "독립오피스");
				}else if(rset.getInt("SPACE_KIND")==2) {
					hmap.put("spaceKind", "코워킹스페이스");
				}
				hmap.put("memberNo", rset.getInt("MEMBER_NO"));
				hmap.put("userId", rset.getString("M_ID"));
				hmap.put("userEmail", rset.getString("M_EMAIL"));
				hmap.put("userPhone", rset.getString("M_PHONE"));
				if(rset.getString("S_STATUS").equals("IW")) {
					hmap.put("status", "검수 대기중");
				}
				
				waitList.add(hmap);
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
			
		return waitList;
	}






	

}
