package com.oodp.projectSupporter.dao;

import java.sql.SQLException;

public class dao extends daoTemplate{
	

	public dao(function c) {
		super(c);
		// TODO Auto-generated constructor stub
	}
	public dao() {
		// TODO Auto-generated constructor stub
	}
	public void hookmethod1() {
		sql = c.sql();
	}
	public void hookmethod2() throws SQLException {
		c.setting(pstmt, rs);
	}
	
	public void changedao(function c) {
		this.c = c;
	}
}
