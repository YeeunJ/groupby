package com.group.by.dbconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public interface connection_info {
	public Connection getConnection();
	public void close(PreparedStatement pstmt, ResultSet rs) throws SQLException;
}
