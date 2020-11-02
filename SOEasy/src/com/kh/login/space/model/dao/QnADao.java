package com.kh.login.space.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.login.space.model.vo.QnA;

public class QnADao {
	
	private Properties prop = new Properties();
	
	public QnADao() {
		
		String propName = SpaceDao.class.getResource("/sql/space/qna-query.properties").getPath();
		
		try {
			prop.load(new FileReader(propName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public int insertQnA(Connection con, QnA requestMember) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("");
		
		try {
			pstmt = con.prepareStatement(query);
			
			//미완성
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
