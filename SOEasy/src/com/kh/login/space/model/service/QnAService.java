package com.kh.login.space.model.service;

import static com.kh.login.common.JDBCTemplate.close;
import static com.kh.login.common.JDBCTemplate.commit;
import static com.kh.login.common.JDBCTemplate.getConnection;
import static com.kh.login.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.login.space.model.dao.QnADao;
import com.kh.login.space.model.dao.ReviewDao;
import com.kh.login.space.model.vo.QnA;

public class QnAService {

	public int insertQnA(QnA requestMember) {

		Connection con = getConnection();
		QnADao qadao = new QnADao();
		int result = qadao.insertQnA(con, requestMember);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
		
	}

}
