package com.group.by.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.oodp.projectSupporter.dto.DTO;
import com.oodp.projectSupporter.dbconnection.connection;

public abstract class daoTemplate {
	private Connection conn = connection.getInstance().getConnection();
	protected PreparedStatement pstmt;
	protected ResultSet rs;
	private StringBuffer query;
	protected ArrayList<DTO> data = new ArrayList<DTO>();
	protected String sql;
	protected function c;
	protected Boolean result = false;
	
	public daoTemplate() {
		
	}
	public daoTemplate(function c){
		this.c = c;
	}
	
	public final void prepareDB() throws ClassNotFoundException, SQLException {
		hookmethod1();
	    query = new StringBuffer();
	    query.append(sql);
	    pstmt = conn.prepareStatement(query.toString());
	    hookmethod2();
	  }
	public abstract void hookmethod1();
	public abstract void hookmethod2() throws SQLException;
	
	public ArrayList<DTO> getdata(){
		return data;
	}
	
	public Boolean getResult() {
		return result;
	}
}
