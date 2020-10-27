package com.group.by.dto;

import java.sql.Date;

public class usersDTO implements DTO {
	int id;
	String email;
	String password;
	String name;
	int age;
	String image;
	String introduce;
	Date regDdate;
	Date modifyDate;
	Date lastLoginDate;
	int loginCount;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public Date getRegDdate() {
		return regDdate;
	}
	public void setRegDdate(Date regDdate) {
		this.regDdate = regDdate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public Date getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	public int getLoginCount() {
		return loginCount;
	}
	public void setLoginCount(int loginCount) {
		this.loginCount = loginCount;
	}
	@Override
	public String toString() {
		return "usersDTO [id=" + id + ", email=" + email + ", password=" + password + ", name=" + name + ", age=" + age
				+ ", image=" + image + ", introduce=" + introduce + ", regDdate=" + regDdate + ", modifyDate="
				+ modifyDate + ", lastLoginDate=" + lastLoginDate + ", loginCount=" + loginCount + "]";
	}
}
