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
	protected String sql;
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
			allgroupdata.setManager(rs.getString("manager"));
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
	
}
