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
	
	public groupinfoDTO GroupInfo(groupinfoDTO dto) {
		groupinfoDTO ex = new groupinfoDTO();
		Date time = new Date();
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
		    	Mdto.CheckPrint();
		    	
		    	list.add(Mdto);
		    	
			}while(rs.next());
			
	    }
		
		
		return list;
		
		
	}
}
