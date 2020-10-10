package com.group.by;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class mySQLtest {
	 private static final String DRIVER = "com.mysql.jdbc.Driver";
	 private static final String URL = "jdbc:mysql://db4free.net:3306/seunga"; // jdbc:mysql://127.0.0.1:3306/여러분이 만드신 스키마이름
	 private static final String USER = "ch8925"; //DB 사용자명
	 private static final String PW = "ch123456";   //DB 사용자 비밀번호

	@Test
	void test() throws Exception{
		 Statement stmt = null;
	     ResultSet rs = null;
			  Class.forName(DRIVER);
			  
			  try(Connection conn = DriverManager.getConnection(URL, USER, PW)){
			   System.out.println("성공");
			   System.out.println(conn);
			   stmt = conn.createStatement();
			   String sql = "SELECT * FROM users;";
			   rs = stmt.executeQuery(sql);
			   while(rs.next()){
	                // 레코드의 칼럼은 배열과 달리 0부터 시작하지 않고 1부터 시작한다.
	                // 데이터베이스에서 가져오는 데이터의 타입에 맞게 getString 또는 getInt 등을 호출한다.
	                String name = rs.getString(1);
	                String owner = rs.getString(2);
	                String date = rs.getString(3);

	                System.out.println(name + " " + owner + " " + date);
	            }
			  }catch (Exception e) {
			   System.out.println("에러발생");
			   e.printStackTrace();
			  }
	}

}
