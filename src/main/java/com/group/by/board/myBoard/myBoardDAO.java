package com.group.by.board.myBoard;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.sql.PreparedStatement; 
import java.sql.ResultSet;
import java.sql.SQLException;

import com.group.by.dbconnection.connection;
import com.group.by.dto.groupinfoDTO;
import com.group.by.dto.missionDTO;
import com.group.by.dto.participationDTO;
import com.group.by.dto.progressDTO;

public class myBoardDAO {
	   Connection conn = connection.getInstance().getConnection();
	   protected PreparedStatement pstmt;
	   protected PreparedStatement pstmt1;
	   protected PreparedStatement pstmt2;
	   protected ResultSet rs;
	   protected ResultSet rs1;
	   protected ResultSet rs2;
	   protected String sql;
	   protected String sql1;
	   protected String sql2;
	   private StringBuffer query;
	   private StringBuffer query1;
	   private StringBuffer query2;
	   protected Boolean result = false;
	   
	   public ArrayList<progressDTO> getRightsideInfo(int groupID) throws ClassNotFoundException, SQLException{
	       ArrayList<progressDTO> groupData = new ArrayList<progressDTO>();
	       
	       sql1 = "select u.id, u.name, count(*) as allMission from mission_info as mission join users as u on u.id = mission.userID where mission.group_info = ? group by u.id;";
	       sql2 = "select u.id, u.name, count(*) as completeMission from mission_info as mission join users as u on u.id = mission.userID where mission.group_info = ? and mission.complete = 1 group by u.id ORDER BY completeMISSION desc;";
	       query1 = new StringBuffer();
	        query2 = new StringBuffer();
	        query1.append(sql1);
	        query2.append(sql2);
	        pstmt1 = conn.prepareStatement(query1.toString());
	        pstmt2 = conn.prepareStatement(query2.toString());
	        pstmt1.setInt(1, groupID);
	        pstmt2.setInt(1, groupID);
	        rs1 = pstmt1.executeQuery();
	        rs2 = pstmt2.executeQuery();
	        rs2.next();
	        while(rs1.next()) {   
	           progressDTO data = new progressDTO();
	           data.setName(rs1.getString("name"));
	           
	           data.setAllMission(rs1.getInt("allMission"));
	           
	              data.setCompleteMission(rs2.getInt("completeMission"));
	              rs2.next();
	           
	           groupData.add(data);
	           System.out.println("Groupdatais " + groupData);
	        }
	        
	       return groupData;
	    }
	   
	   public void waitAssign(int userID, int groupID) throws SQLException {
		   sql=("UPDATE participation SET state=1 WHERE userID=? AND groupID=?");
		   query = new StringBuffer();
			query.append(sql);
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, userID);
			pstmt.setInt(2, groupID);
			pstmt.executeUpdate();
	   }
	   
	   
	   public void waitReject(int userID, int groupID) throws SQLException {
		   sql=("UPDATE participation SET state=-1 WHERE userID=? AND groupID=?");
		   query = new StringBuffer();
			query.append(sql);
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, userID);
			pstmt.setInt(2, groupID);
			pstmt.executeUpdate();
	   }
	   
	
	public ArrayList<participationDTO> waitStudent(int gid) throws SQLException {
		ArrayList<participationDTO> list = new ArrayList<participationDTO>();
		sql=("SELECT * FROM participation WHERE state=? and groupID=?");
		query = new StringBuffer();
		query.append(sql);
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setInt(1, 0);
		pstmt.setInt(2, gid);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			do {
				participationDTO pdto = new participationDTO();
				pdto.setId(rs.getInt("id"));
				pdto.setUserID(rs.getInt("userID"));
				pdto.setGroupID(rs.getInt("groupID"));
				pdto.setName(rs.getString("name"));
				pdto.setState(rs.getInt("state"));
				pdto.setIntroduce(rs.getString("introduce"));
				pdto.setRegDate(rs.getDate("regDate"));
				pdto.setStateDate(rs.getDate("stateDate"));
				
				list.add(pdto);
			}while(rs.next());
	    } 
		return list;
	}
	
	public void missionDelete(int missionID) throws SQLException {
		
//		System.out.println("DeleteController");
		sql=("UPDATE mission SET isDelete=? WHERE id=?");
		query = new StringBuffer();
		query.append(sql);
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setInt(1, 1);
		pstmt.setInt(2, missionID);
		pstmt.executeUpdate();
	}
	
	
	public void missionTrue(int userID, int missionID) throws SQLException {
		
		sql=("UPDATE mission_info SET complete=? WHERE userID=? AND missionID=?");
		query = new StringBuffer();
		query.append(sql);
		pstmt = conn.prepareStatement(query.toString());
//		System.out.println(userID+" / "+missionID);
		pstmt.setInt(1, 1);
		pstmt.setInt(2, userID);
		pstmt.setInt(3, missionID);
		pstmt.executeUpdate();
		System.out.println("true finish");

	}

	public void missionFalse(int userID, int missionID) throws SQLException {
		
		sql=("UPDATE mission_info SET complete=? WHERE userID=? AND missionID=?");
		query = new StringBuffer();
		query.append(sql);
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setInt(1, 0);
		pstmt.setInt(2, userID);
		pstmt.setInt(3, missionID);
		pstmt.executeUpdate();

	}	
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
	public int missionAdd(String name, String cont, Date start, Date end) throws UnsupportedEncodingException  {
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
			System.out.println(name);
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("실패!!!!!!!!!!"+e);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return cnt;
	}
	
	
	public groupinfoDTO GroupInfo(int id) throws SQLException {
		groupinfoDTO ex = new groupinfoDTO();
		sql = (" SELECT * FROM group_info WHERE id=?;");
		query = new StringBuffer();
		query.append(sql);
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		
		
		if(rs.next()) {
			ex.setId(rs.getInt("id"));
			ex.setName(rs.getString("name"));
			ex.setManager(rs.getInt("manager"));
			ex.setCategory(rs.getInt("category"));
			ex.setLink(rs.getString("link"));
			ex.setReward(rs.getString("reward"));
			ex.setRwCondition(rs.getString("rwCondition"));
			ex.setIntroduce(rs.getString("introduce"));
			ex.setNotice(rs.getString("notice"));
			if(rs.getInt("createYN") == 1)
				ex.setCreateYN(true);
			else
				ex.setCreateYN(false);
			if(rs.getInt("visible") == 1)
				ex.setCreateYN(true);
			else
				ex.setCreateYN(false);
			ex.setRegDate(rs.getDate("regDate"));
			ex.setStartDate(rs.getDate("startDate"));
			ex.setEndDate(rs.getDate("endDate"));
		}
	
		
		return ex;
		
	}
	
	
	public ArrayList<Integer> completeYN() throws SQLException {
		
		ArrayList<Integer> list = new ArrayList<Integer>();
		
//		int gid = dto.getId();
		int userID = 2;
		int gid = 2;
		
		sql = ("SELECT missionID FROM mission_info WHERE userID=? AND complete=? AND group_info=?");
		query = new StringBuffer();
		query.append(sql);
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setInt(1, userID);
		pstmt.setInt(2, 1);
		pstmt.setInt(3, gid);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			do {
				
				int num = rs.getInt("missionID");
				list.add(num);

		    	
			}while(rs.next());
			
	    }

		return list;
	}
	
	
	public ArrayList<String> MissionComplete(int gid) throws SQLException {

		ArrayList<String> Comp = null;
		
//		int gid = dto.getId();

		
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
					}while(rs2.next());
				}
				Comp.add(result);
			
		    	
			}while(rs.next());
			
	    }

		return Comp;
	}



	// 미션 리스트 가져오기, 미션 수행한 사람 불러오기
	public ArrayList<missionDTO> MissionList(int gid) throws SQLException {
		
		
		ArrayList<missionDTO> list = new ArrayList<missionDTO>();

		
		sql = (" SELECT * FROM mission where groupID = ? AND isDelete=?");
		query = new StringBuffer();
		query.append(sql);
		pstmt = conn.prepareStatement(query.toString());
		pstmt.setInt(1, gid);
		pstmt.setInt(2, 0);
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