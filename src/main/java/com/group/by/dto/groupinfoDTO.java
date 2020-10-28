package com.group.by.dto;

import java.sql.Date;

public class groupinfoDTO implements DTO {
	int id;
	String name = "";
	int manager;
	boolean visible;
	String link;
	String reward;
	String rwCondition;
	String introduce;
	String notice;
	boolean createYN;
	boolean forever;
	Date regDate;
	Date startDate;
	Date endDate;
	int maxNum;
	int cnt;
	int category;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getManager() {
		return manager;
	}
	public void setManager(int manager) {
		this.manager = manager;
	}
	public boolean isVisible() {
		return visible;
	}
	public void setVisible(boolean visible) {
		this.visible = visible;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getReward() {
		return reward;
	}
	public void setReward(String reward) {
		this.reward = reward;
	}
	public String getRwCondition() {
		return rwCondition;
	}
	public void setRwCondition(String rwCondition) {
		this.rwCondition = rwCondition;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public boolean isCreateYN() {
		return createYN;
	}
	public void setCreateYN(boolean createYN) {
		this.createYN = createYN;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getMaxNum() {
		return maxNum;
	}
	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}
	public boolean isForever() {
		return forever;
	}
	public void setForever(boolean forever) {
		this.forever = forever;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	
	@Override
	public String toString() {
		return "groupinfoDTO [id=" + id + ", name=" + name + ", manager=" + manager + ", visible=" + visible + ", link="
				+ link + ", reward=" + reward + ", rwCondition=" + rwCondition + ", introduce=" + introduce
				+ ", notice=" + notice + ", createYN=" + createYN + ", forever=" + forever + ", regDate=" + regDate
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", maxNum=" + maxNum + ", cnt=" + cnt + "]";
	}

	
	
}
