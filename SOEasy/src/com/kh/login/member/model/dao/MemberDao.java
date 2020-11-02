package com.kh.login.member.model.dao;

import static com.kh.login.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.login.host.manageReserve.model.vo.PageInfo;
import com.kh.login.member.controller.LoginServlet;
import com.kh.login.member.model.vo.Member;
import com.kh.login.member.model.vo.RecoverMember;

public class MemberDao {

	private Properties prop = new Properties();

	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();

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
	//사용자가 입력한 정보가 어떤 권한을 가지고 있는지 조회
	public int checkStatus(Connection con, Member requestMember) {
		PreparedStatement pstmt = null;
		int result = LoginServlet.LOGIN_FAILED;
		
		ResultSet rset = null;
		
		String query = prop.getProperty("checkStatus");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getmId());
			
			rset = pstmt.executeQuery();
			
			String userId ="";
			String password = "";
			int power = 0;
			
			if(rset.next()) {
				userId = rset.getString("M_ID");
				password = rset.getString("M_PASSWORD");
				power = rset.getInt("P_TYPE");
			}
			

			
			if (requestMember.getmId().equals(userId) && requestMember.getmPassword().equals(password)) {

				if (power==3) {
					result = LoginServlet.LOGIN_ADMIN;
				} else if (power==2) {
					result = LoginServlet.LOGIN_HOST;
				} else {
					result = LoginServlet.LOGIN_GUEST;
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return result;
	}
	//사용자가 입력한 로그인값과 일치하는 값이  존재하는지 조회
	public Member selectOne(Connection con, Member requestMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;

		String query = prop.getProperty("selectOne");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getmId());
			pstmt.setString(2, requestMember.getmPassword());

			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginUser = new Member();
				loginUser.setMemberNo(rset.getInt("MEMBER_NO"));
				loginUser.setpType(rset.getInt("P_TYPE"));
				loginUser.setmName(rset.getString("M_NAME"));
				loginUser.setmId(rset.getString("M_ID"));
				loginUser.setmNick(rset.getString("M_NICK"));
				loginUser.setmPassword(rset.getString("M_PASSWORD"));
				loginUser.setmPhone(rset.getString("M_PHONE"));
				loginUser.setmEmail(rset.getString("M_EMAIL"));
				loginUser.setEnrollDate(rset.getDate("M_ENROLL_DATE"));
				loginUser.setmStatus(rset.getString("M_STATUS"));
				loginUser.setImgNo(rset.getInt("IMG_NO"));
				loginUser.setOriginName(rset.getString("ORIGIN_NAME"));
				loginUser.setFilePath(rset.getString("FILE_PATH"));
				loginUser.setChangeName(rset.getString("CHANGE_NAME"));
				loginUser.setImgDiv(rset.getInt("IMG_DIV"));
				loginUser.setSpaceNo(rset.getInt("SPACE_NO"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return loginUser;
	}

	//아이디 중복 체크 하는 메소드
	public int idCheck(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("idCheck");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	
		
		return result;
	}
	//동일한 닉네임이 존재하는지 확인
	public int nickCheck(Connection con, String nickName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("nickCheck");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, nickName);
			rset = pstmt.executeQuery();
			if(rset.next()){
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	//동일한 이메일로 가입이 되어있는지 확인
	public int checkEmail(Connection con, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result =0;
		String query = prop.getProperty("checkEmail");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			if(rset.next()){
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	
	}
	//동일한 이름과 연락처로 가입된 적이 있는지 확인
	public int checkYou(Connection con, String phoneNum, String name) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result =0;
		String query = prop.getProperty("checkYou");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, phoneNum);
			pstmt.setString(2, name);
			rset = pstmt.executeQuery();
			if(rset.next()){
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	//회원 정보를 데이터 베이스에 삽입하는 메소드
	public int insertMember(Connection con, Member requestMember) {
		PreparedStatement pstmt = null;
		int insertResult = 0;
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getmName());
			pstmt.setString(2, requestMember.getmId());
			pstmt.setString(3, requestMember.getmNick());
			pstmt.setString(4, requestMember.getmPassword());
			pstmt.setString(5, requestMember.getmPhone());
			pstmt.setString(6, requestMember.getmEmail());
			
			insertResult= pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return insertResult;
	}
 //회원 생성시 기본 프로필 이미지를 생성해주는 메소드
	public int insertDefaultProfile(Connection con, Member requestMember) {
		PreparedStatement pstmt = null;
		int insertResult = 0;
		String query = prop.getProperty("insertDefaultProfile");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getOriginName());
			pstmt.setString(2, requestMember.getFilePath());
			pstmt.setString(3, requestMember.getChangeName());
		
			insertResult = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return insertResult;
	}
	//사용자의 아이디를 찾는 메소드
	public String findId(Connection con, String name, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String resultId = null;
		
		String query = prop.getProperty("findId");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				resultId = rset.getString("M_ID");
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
			close(rset);
		}
		
		return resultId;
	}
	//사용자의 비밀번호를 찾는 메소드
	public int findPwd(Connection con, String id, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int resultPwd = 0;
		String query = prop.getProperty("findPwd");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				resultPwd = rset.getInt("MEMBER_NO");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return resultPwd;
	}
	//사용자의 비밀번호를 변경하는 메소드
	public int updatePwd(Connection con, String password, int memNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updatePwd");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, password);
			pstmt.setInt(2, memNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	//비밀번호가 일치한지 확인
	public int correctPwd(Connection con, String password, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("correctPwd");
		int result = 0;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, password);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result=rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	//회원 탈퇴를 진행한 회원의 비활성화 메소드
	public int deleteMember(Connection con, String userId, String password, String reason) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reason);
			pstmt.setString(2, userId);
			pstmt.setString(3, password);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} close(pstmt);
		
		return result;
	}
	//비밀번호 변경을 진행하지 않은 회원의 개인정보 수정 메소드
	public int updateMember1(Connection con, Member updateMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateMember1");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,updateMember.getmNick());
			pstmt.setString(2,updateMember.getmName());
			pstmt.setString(3,updateMember.getmPhone());
			pstmt.setString(4, updateMember.getmEmail());
			pstmt.setString(5, updateMember.getmId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	//비밀번호 변경을 같이 진행한 회원의 개인정보 수정
	public int updateMember2(Connection con, Member updateMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateMember3");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,updateMember.getmNick());
			pstmt.setString(2,updateMember.getmName());
			pstmt.setString(3,updateMember.getmPassword());
			pstmt.setString(4,updateMember.getmPhone());
			pstmt.setString(5, updateMember.getmEmail());
			pstmt.setString(6, updateMember.getmId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	//프로필 사진을 업데이트 하는 메소드
	public int updateProfile(Connection con, Member updateMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateProfile");
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, updateMember.getOriginName());
			pstmt.setString(2, updateMember.getFilePath());
			pstmt.setString(3, updateMember.getChangeName());
			pstmt.setInt(4, updateMember.getMemberNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	//모든 회원 목록의 갯수를 조회하는 메소드
	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount1");
		
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
	//모든 회원 목록을 조회하는 메소드
	public ArrayList<Member> selectAllList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> memberList = null;
		String query = prop.getProperty("selectAllList");
		
		
		try {
			pstmt = con.prepareStatement(query);
			int startRow =(pi.getCurrentPage()-1)*pi.getLimit()+1;
			int endRow = startRow + pi.getLimit()-1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2,endRow);
			
			rset = pstmt.executeQuery();
			memberList = new ArrayList<>();
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setpType(rset.getInt("P_TYPE"));
				m.setmName(rset.getString("M_NAME"));
				m.setmId(rset.getString("M_ID"));
				m.setmNick(rset.getString("M_NICK"));
				m.setmPhone(rset.getString("M_PHONE"));
				m.setmEmail(rset.getString("M_EMAIL"));
				m.setEnrollDate(rset.getDate("M_ENROLL_DATE"));
				m.setmStatus(rset.getString("M_STATUS"));
				
				memberList.add(m);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return memberList;
	}
	//변경되기전 프로필 이미지의 주소값을 구해오는 메소드
	public String findImg(Connection con, Member updateMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("findImg");
		String deleteFileName="";
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, updateMember.getMemberNo());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				deleteFileName=rset.getString("CHANGE_NAME");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return deleteFileName;
	}
	//선택된 회원을 정지하는 메소드
	public int blockMember(Connection con, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("blockMember");
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
	//필터 값에 부합하는 회원 목록 검색 결과 수를 찾는 메소드
	public int getListCount(Connection con, String isActive, String power) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount2")+" "+isActive+" "+power;
		
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
		}finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
		
	}
	//필터 옵션 값에 부합하는 회원 목록을 조회하는 메소드
	public ArrayList<Member> selectAllList(Connection con, PageInfo pi, String isActive, String power) {

		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Member> memberList = null;
		int startRow =(pi.getCurrentPage()-1)*pi.getLimit()+1;
		int endRow = startRow + pi.getLimit()-1;
		String query2=" "+isActive+" "+power+"ORDER BY MEMBER_NO DESC )) WHERE RNUM BETWEEN "+startRow+" AND "+endRow;
		String query = prop.getProperty("selectAllList2")+" "+query2;
		System.out.println(query);
		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(query);
			
			memberList = new ArrayList<>();
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setpType(rset.getInt("P_TYPE"));
				m.setmName(rset.getString("M_NAME"));
				m.setmId(rset.getString("M_ID"));
				m.setmNick(rset.getString("M_NICK"));
				m.setmPhone(rset.getString("M_PHONE"));
				m.setmEmail(rset.getString("M_EMAIL"));
				m.setEnrollDate(rset.getDate("M_ENROLL_DATE"));
				m.setmStatus(rset.getString("M_STATUS"));
				
				memberList.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return memberList;
	}
	//키워드에 따른 검색결과의 결과 수를 파악하는 메소드
	public int getListCount(Connection con, String keyword) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount3");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, keyword);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
				
		
		return listCount;
	}
	//키워드에 따른 회원목록 검색결과를 조회하는 메소드
	public ArrayList<Member> selectAllList(Connection con, PageInfo pi, String keyword) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> memberList = null;
		int startRow =(pi.getCurrentPage()-1)*pi.getLimit()+1;
		int endRow = startRow + pi.getLimit()-1;
		
		String query = prop.getProperty("selectAllList3");
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			memberList = new ArrayList<>();
			while(rset.next()) {
				Member m = new Member();
				
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setpType(rset.getInt("P_TYPE"));
				m.setmName(rset.getString("M_NAME"));
				m.setmId(rset.getString("M_ID"));
				m.setmNick(rset.getString("M_NICK"));
				m.setmPhone(rset.getString("M_PHONE"));
				m.setmEmail(rset.getString("M_EMAIL"));
				m.setEnrollDate(rset.getDate("M_ENROLL_DATE"));
				m.setmStatus(rset.getString("M_STATUS"));
				
				memberList.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return memberList;
	}
	//복구 요청 목록의 갯수가 몇개인지 파악하는 메소드
	public int getListRecoverCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount4");
		
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
	//모든 회원 복구 요청 내역을 조회
	public ArrayList<RecoverMember> selectRecover(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<RecoverMember> recoverList = null;
		String query = prop.getProperty("selectAllRecoverList");
		int startRow =(pi.getCurrentPage()-1)*pi.getLimit()+1;
		int endRow = startRow + pi.getLimit()-1;
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2,endRow);
			
			rset = pstmt.executeQuery();
			recoverList = new ArrayList<>();
			
			while(rset.next()) {
				RecoverMember rm = new RecoverMember();
				rm.setMemberNo(rset.getInt("MEMBER_NO"));
				rm.setrNum(rset.getInt("RESTORE_NO"));
				rm.setUserId(rset.getString("M_ID"));
				rm.setDropReason(rset.getString("M_DROP_REASON"));
				rm.setEmail(rset.getString("RESTORE_EMAIL"));
				rm.setRequestDate(rset.getDate("RESTORE_REQUEST_DATE"));
				rm.setrStatus(rset.getInt("RESTORE_STATUS"));
				recoverList.add(rm);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return recoverList;
	}
	//회원 복구가 가능한 계정인지 파악하는 메소드
	public int canRecover(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int howLongAgo = -1;//에러가나면 0일이라 합격되기때문
		String query = prop.getProperty("canRecover");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				howLongAgo = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return howLongAgo;
	}

	//복구 요청한 사람의 정보를 복구 요청 테이블에 인서트
	public int requestRecover(Connection con, int memberNo, String email) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("requestRecover");
		
		try {
			pstmt= con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			pstmt.setString(2,email);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} close(pstmt);
		
		
		
		return result;
	}
	//복구 요청중으로 멤버의 상태를 변경하는 메소드
	public int updateRecoverStatus(Connection con, int memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateRecoverStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	//복구 요청을 이미한 적이 있는지 조회
	public int isFirstTime(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("isFirstTime");
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	//복구요청 기록에서 처리 여부를 업데이트 하는 메소드
	public int updateRecover(Connection con, RecoverMember recoverMem) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateRecover");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, recoverMem.getrStatus());
			pstmt.setInt(2, recoverMem.getMemberNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	//복구승인 누른 녀석의 회원 활성화 여부를 Y로 변경하는 메소드
	public int recoverStatus(Connection con, RecoverMember recoverMem) {
			PreparedStatement pstmt = null;
			int result = 0;
			String query = prop.getProperty("recoverStatus");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, recoverMem.getMemberNo());
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			return result;
	}
	//또 리스트 카운트를 구하고 있음;
	public int getListOptionCount(Connection con, int status) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getListOptionCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, status);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return listCount;
	}
	//셀렉트바 옵션에 맞춘 정보를 가진 복구요청 회원 명단을 가져오는 메소드
	public ArrayList<RecoverMember> searchRecoverOption(Connection con, PageInfo pi, int status) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<RecoverMember> recoverList = null;
		String query = prop.getProperty("searchRecoverOption");
		int startRow =(pi.getCurrentPage()-1)*pi.getLimit()+1;
		int endRow = startRow + pi.getLimit()-1;
		
		System.out.println("status : "+status);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, status);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3,endRow);
			
			rset = pstmt.executeQuery();
			recoverList = new ArrayList<>();
			
			while(rset.next()) {
				RecoverMember rm = new RecoverMember();
				rm.setMemberNo(rset.getInt("MEMBER_NO"));
				rm.setrNum(rset.getInt("RESTORE_NO"));
				rm.setUserId(rset.getString("M_ID"));
				rm.setDropReason(rset.getString("M_DROP_REASON"));
				rm.setEmail(rset.getString("RESTORE_EMAIL"));
				rm.setRequestDate(rset.getDate("RESTORE_REQUEST_DATE"));
				rm.setrStatus(rset.getInt("RESTORE_STATUS"));
				recoverList.add(rm);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return recoverList;
		
	}

}
