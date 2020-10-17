package com.group.by.board.allBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.group.by.dbconnection.connection;
import com.group.by.dto.groupinfoDTO;

public class allBoardDAO {
	private Connection conn = connection.getInstance().getConnection();
	protected PreparedStatement pstmt;
	protected ResultSet rs;
	private StringBuffer query;
	protected String sql, sql2, sql3, sql4;
	protected Boolean result = false;
	private groupinfoDTO allgroupdata;
	
	public ArrayList<groupinfoDTO> getGroupInfo(int cnt) throws SQLException {
		ArrayList<groupinfoDTO> allgroupdatas = new ArrayList<groupinfoDTO>();
		sql = "SELECT * FROM `group_info` order by regDate limit ?, 10;";
		query = new StringBuffer();
		query.append(sql);
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setNString(1, Integer.toString((cnt-1)*10));
		rs = pstmt.executeQuery();
		if(rs.next()){
			allgroupdata = null;
			allgroupdata.setId(rs.getInt("id"));
			allgroupdata.setName(rs.getString("name"));
			allgroupdata.setManager(rs.getInt("manager"));
			allgroupdata.setVisible((rs.getBoolean("visible")));
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
		}
		return allgroupdatas;
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
		System.out.println("hello");
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
}
