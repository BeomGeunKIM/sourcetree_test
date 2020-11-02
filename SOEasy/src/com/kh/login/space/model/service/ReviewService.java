package com.kh.login.space.model.service;

import static com.kh.login.common.JDBCTemplate.getConnection;
import static com.kh.login.common.JDBCTemplate.*;
import java.sql.Connection;

import com.kh.login.space.model.dao.ReviewDao;
import com.kh.login.space.model.vo.Review;

public class ReviewService {

	public int insertReview(Review requestMember) {
	
		Connection con = getConnection();
		ReviewDao rd = new ReviewDao();
		int result = rd.insertReview(con, requestMember);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
