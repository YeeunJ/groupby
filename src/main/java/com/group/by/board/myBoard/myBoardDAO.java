package com.group.by.board.myBoard;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.sql.PreparedStatement; 
import java.sql.ResultSet;
import java.sql.SQLException;

import com.group.by.dbconnection.connection;
import com.group.by.dto.groupinfoDTO;
import com.group.by.dto.missionDTO;


public class myBoardDAO {
	Connection conn = connection.getInstance().getConnection();
	protected PreparedStatement pstmt;
	protected ResultSet rs;
	protected String sql;
	private StringBuffer query;
	protected Boolean result = false;
	// 미션 정보 수정
	
	public int updateMission(int id, String name, String content) {
		sql=("UPDATE mission SET name=?, content=? WHERE id=?");
		query = new StringBuffer();
		query.append(sql);
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, name);
			pstmt.setString(2, content);
			pstmt.setInt(3, id);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
	// 그룹 정보 수정
	public int updateGroup(String name, Date start, Date end, String reward, String reCD, String notice) throws SQLException {
		int gid = 2;
		sql = ("UPDATE group_info SET name=?, startDate=?, endDate=?, reward=?, rwCondition=?, notice=? WHERE id=?");
		query = new StringBuffer();
		query.append(sql);
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setString(1, name);
		pstmt.setDate(2, null);
		pstmt.setDate(3, null);
		pstmt.setString(4, reward);
		pstmt.setString(5, reCD);
		pstmt.setString(6, notice);
		pstmt.setInt(7,  gid);
		
		pstmt.executeUpdate();
		
		
		return 0;
	}
	
	
	
	// 그룹 구성원한테 미션 쏴주기
	public int shootMission() throws SQLException {
		//user들 리스트
		int gid = 2;
		sql = ("SELECT userID FROM participation WHERE groupID = ?;");
		// mission ID와 regDate
		String sql2 = ("SELECT id, regDate FROM mission order by id desc limit 1;");
		// 구성원 전부에게 미션 쏴주기
		String sql3 = ("INSERT INTO mission_info(missionID, userID, complete, group_info)"
				+ "VALUES (?, ?, 0, ?)");
		
				
		StringBuffer query2 = new StringBuffer();
		StringBuffer query3 = new StringBuffer();
		PreparedStatement pstmt2;
		PreparedStatement pstmt3;
		ResultSet rs2;
		ResultSet rs3;
		
		query = new StringBuffer();
		query.append(sql);
		query2.append(sql2);
		query3.append(sql3);

		pstmt = conn.prepareStatement(query.toString());
		pstmt.setInt(1, gid);
		pstmt2 = conn.prepareStatement(query2.toString());
		pstmt3 = conn.prepareStatement(query3.toString());
		rs = pstmt.executeQuery();
		rs2 = pstmt2.executeQuery();
		
		int missionID = 0;
		Date regDate = null;
		
		if(rs2.next()) {
			missionID = rs2.getInt("id");
			regDate = rs2.getDate("regDate");;
		}
		

//		System.out.println(missionID + "   //   "+regDate);
		
		if(rs.next()) {

			do {
				int user = rs.getInt("userID");
				
				System.out.println("user:      " + user);
				
				pstmt3 = conn.prepareStatement(query3.toString());
				pstmt3.setInt(1, missionID);
				pstmt3.setInt(2, user);
				pstmt3.setInt(3, gid);
				
				pstmt3.executeUpdate();
				
			}while(rs.next());
			
			
		}
		
		
		return 0;
		
	}
	// 미션 추가
	public int missionAdd(String name, String cont, Date start, Date end)  {
		int cnt = 0;
		int gid = 2;
		
		
		try {
			sql = ("INSERT INTO mission (name, groupID, content, startDate, endDate)"
					+ "VALUES (?, ?, ?, ?,?)");
			query = new StringBuffer();
			query.append(sql);
			
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, name);
			pstmt.setInt(2, gid);
			pstmt.setString(3, cont);
			pstmt.setDate(4, null);
			pstmt.setDate(5, null);
			
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("실패!!!!!!!!!!"+e);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return cnt;
	}
	
	
	public groupinfoDTO GroupInfo(groupinfoDTO dto) throws SQLException {
		groupinfoDTO ex = new groupinfoDTO();
		int gid = 2;
		sql = (" SELECT * FROM group_info WHERE id=?;");
		query = new StringBuffer();
		query.append(sql);
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setInt(1, gid);
		rs = pstmt.executeQuery();
		
		
		if(rs.next()) {
			ex.setId(rs.getInt("id"));
			ex.setName(rs.getString("name"));
			ex.setManager(rs.getInt("manager"));
			ex.setVisible(rs.getBoolean("visible"));
			ex.setLink(rs.getString("link"));
			ex.setReward(rs.getString("reward"));
			ex.setRwCondition(rs.getString("rwCondition"));
			ex.setIntroduce(rs.getString("introduce"));
			ex.setNotice(rs.getString("notice"));
			ex.setCreateYN(rs.getBoolean("createYN"));
			ex.setRegDate(rs.getDate("regDate"));
			ex.setStartDate(rs.getDate("startDate"));
			ex.setEndDate(rs.getDate("endDate"));
		}
	
		
		return ex;
		
	}
	
	public ArrayList<String> MissionComplete(groupinfoDTO dto) throws SQLException {

		ArrayList<String> Comp = null;
		
//		int gid = dto.getId();
		int gid = 2;
		
		sql = (" SELECT * FROM mission where groupID = ?");
		query = new StringBuffer();
		query.append(sql);
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setInt(1, gid);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			
			Comp = new ArrayList<String>();
			
			do {
				
				int mid = rs.getInt("id");
		    	
		    	String subsql = "select name from users where id IN (select userID from mission_info where missionID=? and complete=1)";
		    			
		    	
		    	StringBuffer query2 = new StringBuffer();
				query2.append(subsql);
				pstmt = conn.prepareStatement(query2.toString());
				pstmt.setInt(1, mid);
				ResultSet rs2 = pstmt.executeQuery();
				
				
				String result="";
				
				if(rs2.next()) {
					do {
						result += rs2.getString("name") + " ";
						System.out.print("Complete: "+result);
						
					}while(rs2.next());
				}
				Comp.add(result);
			
		    	
			}while(rs.next());
			
	    }

		return Comp;
	}
	
	// 미션 리스트 가져오기, 미션 수행한 사람 불러오기
	public ArrayList<missionDTO> MissionList(groupinfoDTO dto) throws SQLException {
		
		
		ArrayList<missionDTO> list = null;
		ArrayList<String> Comp = null;
		
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
			Comp = new ArrayList<String>();
			

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
	
	