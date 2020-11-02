package com.kh.login.space.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import static com.kh.login.common.JDBCTemplate.*;
import com.kh.login.space.model.vo.Review;

public class ReviewDao {

	private Properties prop = new Properties();
	
	public ReviewDao() {
		
		String propName = SpaceDao.class.getResource("/sql/space/review-query.properties").getPath();
		
		try {
			prop.load(new FileReader(propName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int insertReview(Connection con, Review requestMember) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertReview");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, requestMember.getSpaceNo());
			pstmt.setInt(2, requestMember.getMemberNo());
			pstmt.setString(3, requestMember.getReviewContent());
			pstmt.setInt(4, requestMember.getrPoint());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
