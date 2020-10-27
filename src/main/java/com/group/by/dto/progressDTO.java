package com.group.by.dto;

public class progressDTO implements DTO{
	private String name;
	private int id;
	private int allMission;
	private int completeMission;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAllMission() {
		return allMission;
	}
	public void setAllMission(int allMission) {
		this.allMission = allMission;
	}
	public int getCompleteMission() {
		return completeMission;
	}
	public void setCompleteMission(int completeMission) {
		this.completeMission = completeMission;
	}
	
	@Override
	public String toString() {
		return "progressDTO [name=" + name + ", id=" + id + ", allMission=" + allMission + ", completeMission="
				+ completeMission + "]";
	}
}
