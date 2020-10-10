package com.group.by.dto;

import java.sql.Date;

public class missioninfoDTO implements DTO {
	int missionID;
	int userID;
	boolean check;
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
	public boolean isCheck() {
		return check;
	}
	public void setCheck(boolean check) {
		this.check = check;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}
