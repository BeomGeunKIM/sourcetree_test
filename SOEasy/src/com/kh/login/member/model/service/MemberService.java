package com.kh.login.member.model.service;

import static com.kh.login.common.JDBCTemplate.close;
import static com.kh.login.common.JDBCTemplate.commit;
import static com.kh.login.common.JDBCTemplate.getConnection;
import static com.kh.login.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.login.host.manageReserve.model.vo.PageInfo;
import com.kh.login.member.controller.LoginServlet;
import com.kh.login.member.model.dao.MemberDao;
import com.kh.login.member.model.vo.Member;
import com.kh.login.member.model.vo.RecoverMember;

public class MemberService {
	//권한 을 조회 하는 서비스
	public Member loginCheck(Member requestMember) {
		Connection con = getConnection();
		
		MemberDao md = new MemberDao();
		int result = md.checkStatus(con,requestMember);
		
		Member loginUser = new Member();
		
		if(result >= LoginServlet.LOGIN_GUEST) {
			
			loginUser = md.selectOne(con,requestMember);
			loginUser.setpType(result);
		}else {
			loginUser.setpType(LoginServlet.LOGIN_FAILED);
		}
	
		
		return loginUser;
	}
	//중복 아이디를 체크하는 메소드
	public int idCheck(String userId) {
		Connection con = getConnection();
		
		int result = new MemberDao().idCheck(con, userId);
		
		close(con);
		
		return result;
		
		
	}
	//중복 닉네임을 체크하는 메소드
	public int nickCheck(String nickName) {
		Connection con = getConnection();
		
		int result = new MemberDao().nickCheck(con, nickName);
		
		close(con);
		
		return result;
	}
	//같은 이메일로 가입된 회원이 있는지 확인하는 메소드
	public int checkEmail(String email) {
		Connection con = getConnection();
		
		int result = new MemberDao().checkEmail(con,email);
		
		close(con);
		
		return result;
	}
	//같은 이름과 연락처로 가입된 회원이 있는지 확인하는 메소드
	public int checkYou(String phoneNum, String name) {
		Connection con = getConnection();
		
		int result = new MemberDao().checkYou(con,phoneNum,name);
		
		close(con);
		
		return result;
	}
	//회원가입 메소드
	public int insertMember(Member requestMember) {
		Connection con = getConnection();
		
		int insertResult=0;
		int insertResult2=0;
		insertResult=new MemberDao().insertMember(con, requestMember);
		if(insertResult > 0) {
			insertResult2= new MemberDao().insertDefaultProfile(con,requestMember);
		}
		
		if(insertResult>0 && insertResult2>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return insertResult;
	}
	//아이디 찾기 메소드
	public String findId(String name, String email) {
		Connection con = getConnection();
		
		String resultId = new MemberDao().findId(con,name,email);
		
		close(con);
		
		return resultId;
	}
	//비밀번호 찾기 메소드
	public int findPwd(String id, String email) {
		Connection con = getConnection();
		int resultPwd = new MemberDao().findPwd(con,id,email);
		
		close(con);
		
		return resultPwd;
		
		
	}
	
	//비밀번호 찾기 후 비밀번호를 변경하는 메소드
	public int updatePwd(String password, int memNo) {
		Connection con = getConnection();
		
		int result = new MemberDao().updatePwd(con, password, memNo);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	//비밀번호가 일치하는지 확인하는 메소드
	public int correctPwd(String password, String userId) {
		Connection con = getConnection();
		
		int result = new MemberDao().correctPwd(con, password, userId);
		
		close(con);
		
		return result;
	}
	//회원 탈퇴 메소드
	public int deleteMember(String userId, String password, String reason) {
		Connection con = getConnection();
		
		int result = new MemberDao().deleteMember(con,userId, password, reason);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
		
		
	}
	//비밀번호 프로필 사진 변경을 하지 않은 개인정보 수정 메소드
	public Member updateMember1(Member updateMember) {
		Connection con = getConnection();
		
		int result = 0;
		Member updatingMember = null;
		result = new MemberDao().updateMember1(con,updateMember);
		
		if(result > 0) {
			commit(con);
			updatingMember = new MemberDao().selectOne(con, updateMember);
		} else {
			rollback(con);
		}
		close(con);
		return updatingMember;
	}
	//비밀번호는 변경하지 않고 프로필 사진은 변경한 개인정보 수정 메소드
	public Member updateMember2(Member updateMember) {
		Connection con = getConnection();
		
		int result1 = 0;
		int result2 = 0;
		Member updatingMember = null;
		
		result1 = new MemberDao().updateMember1(con, updateMember);
		if(result1>0) {
			
			result2 = new MemberDao().updateProfile(con,updateMember);
		}
		
		if(result1>0 && result2>0) {
			commit(con);
			updatingMember = new MemberDao().selectOne(con, updateMember);
		}else {
			rollback(con);
		}
		
		
		return updatingMember;
	}
	//비밀번호는 변경하고 프로필 사진은 변경하지 않은 개인정보 수정 메소드
	public Member updateMember3(Member updateMember) {
		Connection con = getConnection();
		Member updatingMember = null;
		int result = 0;
		result = new MemberDao().updateMember2(con, updateMember);
		if(result > 0) {
			commit(con);
			updatingMember = new MemberDao().selectOne(con, updateMember);
		} else {
			rollback(con);
		}
		close(con);
		return updatingMember;
	}
	//비밀번호도 변경하고 프로필 사진도 변경한 개인정보 수정 메소드
	public Member updateMember4(Member updateMember) {
		Connection con = getConnection();
		Member updatingMember = null;
		int result1 = 0;
		int result2 = 0;
		
		
		result1 = new MemberDao().updateMember2(con, updateMember);
		if(result1>0) {
			
			result2 = new MemberDao().updateProfile(con,updateMember);
		}
		
		if(result1>0 && result2>0) {
			commit(con);
			updatingMember = new MemberDao().selectOne(con, updateMember);
		}else {
			rollback(con);
		}
		
		
		return updatingMember;
	}
	
	//전체 회원수를 조회하는 메소드
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new MemberDao().getListCount(con);
		
		close(con);
		
		return listCount;
		
		
	}
	//전체 회원정보를 조회하는 메소드
	public ArrayList<Member> selectAllList(PageInfo pi) {
		Connection con = getConnection();
		ArrayList<Member> memberList = new MemberDao().selectAllList(con,pi);
		
		close(con);
		
		return memberList;
		
		
	}
	//삭제할 프로필 사진의 주소를 조회하는 메소드
	public String findImg(Member updateMember) {
		Connection con = getConnection();
		String deleteFileName = new MemberDao().findImg(con, updateMember);
		
		close(con);
		return deleteFileName;
	}
	
	//회원을 영구정지 시키는 메소드
	public int blockMember(String userId) {
		Connection con = getConnection();
		int result = new MemberDao().blockMember(con,userId);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}
	
	//검색 조건에 맞는 전체 결과갯수를 조회하는 메소드
	public int getListCount(String isActive, String power) {
		Connection con = getConnection();
		int listCount = new MemberDao().getListCount(con,isActive,power);
		
		close(con);
		
		return listCount;
	}
	
	
	//검색 조건에 맞는 전체 결과를 조회하는 메소드
	public ArrayList<Member> selectAllList(PageInfo pi, String isActive, String power) {
		Connection con = getConnection();
		ArrayList<Member> memberList = new MemberDao().selectAllList(con,pi,isActive,power);
		
		close(con);
		
		return memberList;
	
	}
	//키워드 검색에 해당하는 갯수를 조회하는 메소드
	public int getListCount(String keyword) {
		Connection con = getConnection();
		int listCount = new MemberDao().getListCount(con,keyword);
		close(con);
		
		return listCount;
	}
	
	//키워드 검색에 해당하는 정보를 조회하는 메소드
	public ArrayList<Member> selectAllList(PageInfo pi, String keyword) {
		Connection con = getConnection();
		ArrayList<Member> memberList = new MemberDao().selectAllList(con,pi,keyword);
		
		close(con);
		
		return memberList;
	}
	
	//복구 요청이 온 모든 회원의 갯수를 조회하는 메소드
	public int getListRecoverCount() {
		Connection con = getConnection();
		int listCount = new MemberDao().getListRecoverCount(con);
		close(con);
		return listCount;
	}
	
	//복구 요청이 온 모든 회원의 정보를 조회하는 메소드
	public ArrayList<RecoverMember> selectRecover(PageInfo pi) {
		Connection con = getConnection();
		ArrayList<RecoverMember> recoverList = new MemberDao().selectRecover(con,pi);
		
		close(con);
		
		return recoverList;
	}
	//회원 복구 요청을 할 수 있는지 알아보는 메소드
	public int canRecover(String userId, int userNo) {
		Connection con = getConnection();
		int result = -1;
		int howLongAgo = new MemberDao().canRecover(con, userId);
		//탈퇴한지 30일이 지났는가?
		System.out.println("howLongAgo : " +howLongAgo);
		if (howLongAgo < 30) {

			int isFirstTime = new MemberDao().isFirstTime(con, userNo);
			System.out.println("firstTime : " +isFirstTime);
			if (isFirstTime > 0) { //회원복구를 이미 신청했는가?
				
				result = 2;
			} else {
				result = 1;
			}

		} else {
			result = 0;
		}

		close(con);

		return result;
	}
	//회원 복구 요청을 인서트하고 회원 정보에서 상태를 w로 바꿈
	public int requestRecover(int memberNo, String email) {
		Connection con = getConnection();
		int result = 0;
		int result1 = new MemberDao().requestRecover(con,memberNo,email);
		
		int result2 = new MemberDao().updateRecoverStatus(con,memberNo);
		
		if(result1>0 && result2>0) {
			
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}
	public int updateRecover(RecoverMember recoverMem) {
		Connection con = getConnection();
		int result =0;
		int result1 = 0;
		int result2 = 0;
		result1 = new MemberDao().updateRecover(con,recoverMem);
		
		if(recoverMem.getrStatus()==2 && result1>0){//복구승인을 했다면
			result2 = new MemberDao().recoverStatus(con,recoverMem);
		}
		else {//복구 승인 거절이라면
			result2 = 1;
		}
		if(result1>0 && result2>0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}
	
	public int getListOptionCount(int status) {
		Connection con = getConnection();
		int listCount = new MemberDao().getListOptionCount(con,status);
		close(con);
		
		return listCount;
	}
	public ArrayList<RecoverMember> searchRecoverOption(PageInfo pi, int status) {

		Connection con = getConnection();
		ArrayList<RecoverMember> recoverList = new MemberDao().searchRecoverOption(con,pi,status);
		
		close(con);
		return recoverList;
	}

}
