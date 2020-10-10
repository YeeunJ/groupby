package com.group.by.board.myBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.group.by.dbconnection.connection;
import com.group.by.dto.groupDTO;
import com.group.by.dto.groupinfoDTO;
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
	
	public groupinfoDTO GroupInfo(groupinfoDTO dto) {
		groupinfoDTO ex = new groupinfoDTO();
		ex.setId(1);
		ex.setName("3대 몇 치냐?");
		ex.setManager("이승윤");
		ex.setVisible(false);
		ex.setLink("THREEDAE");
		ex.setReward("딸기맛 프로틴 30% 할인권");
		ex.setRwCondition("매 주 3대 중량 상위 10명");
		ex.setIntroduce("웨이트 트레이닝의 대표 종목인 스쿼트, 벤치프레스, 데드리프트를 함께 할 그룹원을 찾습니다");
		ex.setNotice("양심적으로 당일 들어올린 중량을 체크리스트에 표시해주세요 체크리스트가 부족하면 추가하시면 됩니다");
		ex.setManager("이승윤");
		ex.setCreateYN(false);
		ex.setRegDate(null);
		ex.setStartDate(null);
		ex.setEndDate(null);
		
		
		return ex;
		
	}
	
	
	// 미션 리스트 가져오기
	public ArrayList<missionDTO> MissionList(groupinfoDTO dto) throws SQLException {
		
		
		ArrayList<missionDTO> list = null;
//		int gid = dto.getId();
		int gid = 2;
		
		sql = (" SELECT * FROM mission where groupID = ?");
		query = new StringBuffer();
		query.append(sql);
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setInt(1, gid);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			
			list = new ArrayList<missionDTO>();
			
			

			do {
				missionDTO Mdto = new missionDTO();
				
				Mdto.setId(rs.getInt("id"));
		    	Mdto.setName(rs.getString("name"));
		    	Mdto.setGroupID(rs.getInt("groupID"));
		    	Mdto.setContent(rs.getString("content"));;
		    	Mdto.setRegDate(rs.getDate("regDate"));
		    	Mdto.setStartDate(rs.getDate("startDate"));
		    	Mdto.setEndDate(rs.getDate("endDate"));
		    	list.add(Mdto);
		    	
			}while(rs.next());
			
	    }
		
		
		return list;
		
		
	}
}
