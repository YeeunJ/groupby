package com.group.by.dto;

public class progressDTO implements DTO{
	private String name;
	private int id;
	private int allMission;
	private int completeMission;
	private int manager;
	private int category;
	
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
	public int getManager() {
		return manager;
	}
	public void setManager(int manager) {
		this.manager = manager;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	
	@Override
	public String toString() {
		return "progressDTO [name=" + name + ", id=" + id + ", allMission=" + allMission + ", completeMission="
				+ completeMission + "]";
	}
}
