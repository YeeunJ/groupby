package com.group.by.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.group.by.dbconnection.connection;

public class usersDAO {
	private Connection conn = connection.getInstance().getConnection();
	protected PreparedStatement pstmt;
	protected ResultSet rs;
	private StringBuffer query;
	protected String sql;
	protected Boolean result = false;
	
	public final void prepareDB() throws ClassNotFoundException, SQLException {
		
	    query = new StringBuffer();
	    query.append(sql);
	    
	    pstmt = conn.prepareStatement(query.toString());
	}
}
