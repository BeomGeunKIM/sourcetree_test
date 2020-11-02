package com.kh.login.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.login.board.model.dao.BoardDao;
import com.kh.login.board.model.vo.Board;
import com.kh.login.board.model.vo.Qna;
import com.kh.login.host.manageReserve.model.vo.PageInfo;

import static com.kh.login.common.JDBCTemplate.*;


public class BoardService {
	
//		public ArrayList<Board> selectList() {
//			
//			Connection con = getConnection();
//			
//			ArrayList<Board> list = new BoardDao().selectList(con);
//			
//			close(con);
//			
//			
//		return list;
//}
//		public ArrayList<Board> selectFAQList(){
//			
//			Connection con = getConnection();
//			
//			ArrayList<Board> list = new BoardDao().selectFAQList(con);
//			
//			close(con);
//			
//		return list;
//		}
//		
		public int insertBoard(Board board) {

			Connection con = getConnection();
			
			int result = new BoardDao().insertBoard(con,board);
			
			if(result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			close(con);
			return result;
		}
		
		
		public Board detailBoard(int nno) {

			Connection con = getConnection();
			
			
			Board board = new BoardDao().detailBoard(con, nno);
			
			if(board != null) {
					commit(con);
			} else {
					rollback(con);
			} 
			close(con);
			
			return board;
		}

		public int updateboard(Board requestBoard) {
			Connection con = getConnection();
			int result = new BoardDao().updateboard(con,requestBoard);
			
			if(result>0) {
				commit(con);
			} else {
				rollback(con);
			}
			close(con);
			
			return result;
		}

		public int deleteBoard(int nno) {
			Connection con = getConnection();
			int result = new BoardDao().deleteBoard(con, nno);
			
			if(result > 0 ) {
				commit(con);
			} else {
				rollback(con);
			}
			close(con);
			
			return result;
		}
		
		public int getListCount() {
			Connection con = getConnection();
			int listCount = new BoardDao().getListCount(con);
			
			close(con);
			
			return listCount;
		}
		public ArrayList<Board> selectList(PageInfo pi) {
			
		     Connection con = getConnection();
		      
		      ArrayList<Board> list = new BoardDao().selectList(con,pi);
		      
		      close(con);
		      
		      return list;
		   }

		public ArrayList<Board> selectFAQList(PageInfo pi) {
			
			Connection con = getConnection();
		      
		      ArrayList<Board> list = new BoardDao().selectFAQList(con,pi);
		      
		      close(con);
		      
		      return list;
			
		}


		public int getFAQListCount() {
			
			Connection con = getConnection();
			int listCount = new BoardDao().getFAQListCount(con);
			
			close(con);
			
			return listCount;
		}


		public int postBoard(int nno) {
			Connection con = getConnection();
			int result = new BoardDao().postBoard(con,nno);
			
			if(result >0 ) {
				commit(con);
			} else {
				rollback(con);
			}
			
			return result;
			
		}


		public int postDownBoard(int nno) {
			Connection con = getConnection();
			int result = new BoardDao().postDownBoard(con,nno);
			
			if(result >0 ) {
				commit(con);
			} else {
				rollback(con);
			}
			
			return result;
			
		}


		public int insertM(Qna qna) {
			Connection con = getConnection();
			int result = new BoardDao().insertM(con,qna);
			
			if(result>0) {
				commit(con);
			} else {
				rollback(con);
			}
			
			return result;
		}


		public int getMtoMListCount() {
			Connection con = getConnection();
			int listCount = new BoardDao().getMtoMListCount(con);
			
			close(con);
			
			return listCount;	
		}


		public ArrayList<Qna> selectMtoMList(int memberNo, PageInfo pi) {
			
			  Connection con = getConnection();
		      
		      ArrayList<Qna> list = new BoardDao().selectMtoMList(con, memberNo, pi);
		      
		      close(con);
		      
		      return list;
			
		}


		public Qna detailQna(int qno) {
				Connection con = getConnection();
			
			
			Qna qna = new BoardDao().detailQna(con, qno);
			
			if(qna != null) {
					commit(con);
			} else {
					rollback(con);
			} 
			close(con);
			
			return qna;
		}


		public int updateqna(Qna requestQna) {
			Connection con = getConnection();
			int result = new BoardDao().updateqna(con,requestQna);
			
			if(result > 0 ) {
				commit(con);
			} else {
				rollback(con);
			}
			
			return result;
		}


	
		
}

	

		

