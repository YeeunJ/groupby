package com.group.by.board.myBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.group.by.dbconnection.connection;
import com.group.by.dto.groupDTO;
import com.group.by.dto.missionDTO;

public class myBoardDAO {
	private Connection conn = connection.getInstance().getConnection();
	protected PreparedStatement pstmt;
	protected ResultSet rs;
	private StringBuffer query;
	protected String sql, sql2;
	protected Boolean result = false;
	
	public boolean checkDuplicateLink(String link) throws ClassNotFoundException, SQLException {
		sql = "select * from group_info where link = ?;";
	    query = new StringBuffer();
	    query.append(sql);
	    pstmt = conn.prepareStatement(query.toString());
	    pstmt.setString(1, link);
	    rs = pstmt.executeQuery();
	    if(rs.next()) {
	    	return false;
	    }
	    return true;
	}
	
	public void insertGroup(groupDTO group, ArrayList<missionDTO> missionlist, int userID) throws ClassNotFoundException, SQLException {
		sql = "INSERT INTO group_info (name, manager, visible, link, reward, rwCondition, introduce, notice, createYN, startDate, endDate) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		query = new StringBuffer();
	    query.append(sql);
	    pstmt = conn.prepareStatement(query.toString());
	    pstmt.setString(1, group.getName());
	    pstmt.setInt(2, group.getManager());
	    pstmt.setBoolean(3, group.isVisible());
	    pstmt.setString(4, group.getLink());
	    pstmt.setString(5, group.getReward());
	    pstmt.setString(6, group.getRwCondition());
	    pstmt.setString(7, group.getIntroduce());
	    pstmt.setString(8, group.getNotice());
	    pstmt.setBoolean(9, group.isCreateYN());
	    pstmt.setDate(10, group.getStartDate());
	    pstmt.setDate(11, group.getEndDate());
	    pstmt.executeUpdate();
	    
	    insertTask(group, missionlist, userID);
	}
	
	public void insertTask(groupDTO group, ArrayList<missionDTO> missionlist, int userID) throws ClassNotFoundException, SQLException {
		sql = "INSERT INTO mission (name, groupID, content) VALUES(?, ?, ?);";
		sql2 = "INSERT INTO mission_info (missionID, userID, group_info) VALUES((select id from mission where name = ?),?,(select id from group_info where link = ?))";
		query = new StringBuffer();
	    query.append(sql);
	    for(missionDTO mission: missionlist) {
	    	pstmt = conn.prepareStatement(query.toString());
	 	    pstmt.setString(1, mission.getName());
	 	    pstmt.setInt(2, mission.getGroupID());
	 	    pstmt.setString(3, mission.getContent());
	 	    pstmt.executeUpdate();
	    }
	    
	    query = new StringBuffer();
	    query.append(sql2);
	    
	    for(missionDTO mission: missionlist) {
	    	pstmt = conn.prepareStatement(query.toString());
	 	    pstmt.setString(1, mission.getName());
	 	    pstmt.setInt(2, userID);
	 	    pstmt.setString(3, group.getLink());
	 	    pstmt.executeUpdate();
	    }
	}
}
