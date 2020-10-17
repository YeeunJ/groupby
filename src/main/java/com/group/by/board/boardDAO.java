package com.group.by.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.group.by.dbconnection.connection;
import com.group.by.dto.progressDTO;

public class boardDAO {
	private Connection conn = connection.getInstance().getConnection();
	protected PreparedStatement pstmt1, pstmt2;
	protected ResultSet rs1, rs2;
	private StringBuffer query1, query2;
	protected String sql1, sql2;
	protected Boolean result = false;
	
	public ArrayList<progressDTO> getmyBoardInfo(int userID) throws ClassNotFoundException, SQLException {
		ArrayList<progressDTO> groupData = new ArrayList<progressDTO>();
		
		sql1 = "select gi.id as id, gi.name as name, count(*) as allMission " + 
				"from mission_info as info right join group_info as gi on gi.id = info.group_info " + 
				"group by gi.id " + 
				"having gi.id in (select g.id from group_info as g join participation as p on p.groupID = g.id where p.userID = ?);";
		sql2 = "select gi.id as id, gi.name as name, count(*) as completeMission " + 
				"from mission_info as info right join group_info as gi on gi.id = info.group_info " + 
				"where info.complete = 1 " + 
				"group by gi.id " + 
				"having gi.id in (select g.id from group_info as g join participation as p on p.groupID = g.id where p.userID = ?);";
		query1 = new StringBuffer();
	    query2 = new StringBuffer();
	    query1.append(sql1);
	    query2.append(sql2);
	    pstmt1 = conn.prepareStatement(query1.toString());
	    pstmt2 = conn.prepareStatement(query2.toString());
	    pstmt1.setInt(1, userID);
	    pstmt2.setInt(1, userID);
	    rs1 = pstmt1.executeQuery();
	    rs2 = pstmt2.executeQuery();
	    
	    rs2.next();
	    while(rs1.next()) {
	    	
	    	progressDTO data = new progressDTO();
	    	data.setId(rs1.getInt("id"));
	    	data.setName(rs1.getString("name"));
	    	data.setAllMission(rs1.getInt("allMission"));
	    	System.out.println(rs2);
	    	if( rs2.getInt("id") == rs1.getInt("id")) {
	    		data.setCompleteMission(rs2.getInt("completeMission"));
	    		if(!rs2.isLast())rs2.next();
	    	}
	    	else
	    		data.setCompleteMission(0);
	    	groupData.add(data);
	    }
		return groupData;
	}
	

}
