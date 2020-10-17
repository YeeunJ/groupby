package com.group.by.dto;

import java.sql.Date;

public class missioninfoDTO implements DTO {
	int missionID;
	int userID;
	boolean complete;
	Date regDate;
	public int getMissionID() {
		return missionID;
	}
	public void setMissionID(int missionID) {
		this.missionID = missionID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public boolean isComplete() {
		return complete;
	}
	public void setCheck(boolean Complete) {
		this.complete = Complete;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}
