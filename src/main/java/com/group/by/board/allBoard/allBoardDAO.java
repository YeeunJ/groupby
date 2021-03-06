package com.group.by.board.allBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.group.by.dbconnection.connection;
import com.group.by.dto.groupinfoDTO;
import com.group.by.dto.missionDTO;

public class allBoardDAO {
	private Connection conn = connection.getInstance().getConnection();
	protected PreparedStatement pstmt;
	protected ResultSet rs;
	private StringBuffer query;
	protected String sql, sql2, sql3, sql4, sql_all;
	protected Boolean result = false;
	
	public ArrayList<groupinfoDTO> getGroupInfo(int cnt) throws SQLException {
		ArrayList<groupinfoDTO> allgroupdatas = new ArrayList<groupinfoDTO>();
		//여기 부분에서 페이지에 맞게 cnt 가져와야함
		sql_all = "SELECT * FROM `group_info` order by regDate limit ?, 10;";
		query = new StringBuffer();
		query.append(sql_all);
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setInt(1, (cnt-1)*10);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			
			groupinfoDTO allgroupdata = new groupinfoDTO();
			
			allgroupdata.setId(rs.getInt("id"));
			allgroupdata.setName(rs.getString("name"));
			allgroupdata.setManager(rs.getInt("manager"));
			allgroupdata.setVisible(rs.getBoolean("visible"));
			allgroupdata.setCnt((rs.getInt("cnt")));
			allgroupdata.setCategory(rs.getInt("category"));
			allgroupdata.setLink((rs.getString("link")));
			allgroupdata.setReward((rs.getString("reward")));
			allgroupdata.setRwCondition((rs.getString("rwCondition")));
			allgroupdata.setIntroduce((rs.getString("introduce")));
			allgroupdata.setNotice((rs.getString("notice")));
			allgroupdata.setCreateYN((rs.getBoolean("createYN")));
			allgroupdata.setRegDate((rs.getDate("regDate")));
			allgroupdata.setStartDate((rs.getDate("startDate")));
			allgroupdata.setEndDate((rs.getDate("endDate")));
			allgroupdata.setMaxNum((rs.getInt("maxNum")));
			
			allgroupdatas.add(allgroupdata);
			System.out.println(allgroupdata.toString());
		}
		return allgroupdatas;
	}
	public int joinGroup(int userID, String nickname, String introduce, int groupId) throws SQLException {
		sql = "INSERT INTO participation (userID, groupID, name, state, introduce) values (?, ?, ?, ?, ?);";
		if(groupId != 0) {
			query = new StringBuffer();
			query.append(sql);
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, userID);
			pstmt.setInt(2, groupId);
			pstmt.setString(3, nickname);
			pstmt.setInt(4, 1);
			pstmt.setString(5, introduce);
			pstmt.executeUpdate();
		}else {
			return 0;
		}	
		return 1;
	}
	
	public int  createGroup(groupinfoDTO groupInfo) throws SQLException {
		sql = "INSERT INTO group_info(name, visible, link, reward, rwCondition, introduce, notice, createYN, startDate, endDate, maxNum, manager) "
				+ "VALUES (?, ?, ?, ?,?,?,?,?,?,?,?,?);";
		sql2 = "INSERT INTO participation (userID, groupID) VALUES (?, ?);";
		sql3 = "select id from group_info where link = ?;";
		sql4 = "";
		
		if(groupInfo.getName().compareTo("")!=0) {
			query = new StringBuffer();
			query.append(sql);
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, groupInfo.getName());
			pstmt.setBoolean(2, groupInfo.isVisible());
			pstmt.setString(3, groupInfo.getLink());
			pstmt.setString(4, groupInfo.getReward());
			pstmt.setString(5, groupInfo.getRwCondition());
			pstmt.setString(6, groupInfo.getIntroduce());
			pstmt.setString(7, groupInfo.getNotice());
			pstmt.setBoolean(8, groupInfo.isCreateYN());
			if(!groupInfo.isForever()) {
				pstmt.setDate(9, groupInfo.getStartDate());
				pstmt.setDate(10, groupInfo.getEndDate());
			}else {
				pstmt.setString(9, "now()");
				pstmt.setString(10, "now()");
			}
			pstmt.setInt(11, groupInfo.getMaxNum());
			pstmt.setInt(12, groupInfo.getManager());
			pstmt.executeUpdate();
		}
		query = new StringBuffer();
		query.append(sql3);
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, groupInfo.getLink());
		rs = pstmt.executeQuery();
		groupInfo.setId(0);
		if(rs.next()) {
			groupInfo.setId(rs.getInt("id"));
		}
		System.out.println(groupInfo.getId());
		if(groupInfo.getId() != 0) {
			query = new StringBuffer();
			query.append(sql2);
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, groupInfo.getManager());
			pstmt.setInt(2, groupInfo.getId());
			pstmt.executeUpdate();
		}else {
			return 2;
		}
		
		return 1;
	}
	public ArrayList<missionDTO> getMissionInfo(int groupID) throws SQLException {
		ArrayList<missionDTO> missiondatas = new ArrayList<missionDTO>();
		sql= "SELECT * from mission where groupID=?;";
		query = new StringBuffer();
		query.append(sql);
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setInt(1, groupID);
		rs = pstmt.executeQuery();
		int count = 0;
		while(rs.next()) {
			missionDTO missiondata = new missionDTO();
			
			missiondata.setName(rs.getNString("name"));
			
			missiondatas.add(missiondata);
			count++;
			if(count==5) break;
		}
		return missiondatas;
	}
}