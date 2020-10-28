package com.group.by.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.group.by.dbconnection.connection;
import com.group.by.dto.usersDTO;

public class usersDAO {
	private Connection conn = connection.getInstance().getConnection();
	protected PreparedStatement pstmt;
	protected ResultSet rs;
	private StringBuffer query;
	protected String sql;
	protected Boolean result = false;
	
	public usersDTO getUserInfo(String email, String name) throws ClassNotFoundException, SQLException {
		usersDTO userData = new usersDTO();
		sql = "select * from users where email = ?";
	    query = new StringBuffer();
	    query.append(sql);
	    pstmt = conn.prepareStatement(query.toString());
	    pstmt.setString(1, email);
	    rs = pstmt.executeQuery();
	    if(rs.next()) {
	    	userData.setId(rs.getInt("id"));;
	    	userData.setEmail(email);
	    	userData.setName(name);
	    	userData.setAge(rs.getInt("age"));;
	    	userData.setIntroduce(rs.getString("introduce"));
	    }else {
	    	userData.setEmail(email);
	    	userData.setName(name);
	    	insertUserInfo(userData);
	    }
	    updateLogin(userData.getId());
		return userData;
	    
	}
	
	public void updateLogin(int id) throws ClassNotFoundException, SQLException {
		sql = "UPDATE users SET lastLoginDate = now(), loginCount=loginCount+1 WHERE id = ?;";
		query = new StringBuffer();
	    query.append(sql);
	    pstmt = conn.prepareStatement(query.toString());
	    pstmt.setInt(1, id);
	    pstmt.executeUpdate();
	}
	public void setUserInfo(usersDTO updateData) throws ClassNotFoundException, SQLException {
		sql = "UPDATE users SET email = ?, name = ?, age = ?, introduce = ?, modifyDate = now() WHERE id = ?;";
	    query = new StringBuffer();
	    query.append(sql);
	    pstmt = conn.prepareStatement(query.toString());
	    pstmt.setString(1, updateData.getEmail());
	    pstmt.setString(2, updateData.getName());
	    pstmt.setInt(3, updateData.getAge());
	    pstmt.setString(4, updateData.getIntroduce());
	    pstmt.setInt(5, updateData.getId());
	    pstmt.executeUpdate();
	}
	public void insertUserInfo(usersDTO insertData) throws ClassNotFoundException, SQLException {
		sql = "INSERT INTO users (email, name)"
				+ "VALUES (?, ?)";
	    query = new StringBuffer();
	    query.append(sql);
	    pstmt = conn.prepareStatement(query.toString());
	    pstmt.setString(1, insertData.getEmail());
	    pstmt.setString(2, insertData.getName());
	    pstmt.executeUpdate();
	}
}
