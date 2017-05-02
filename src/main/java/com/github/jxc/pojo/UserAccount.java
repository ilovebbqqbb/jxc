package com.github.jxc.pojo;

import java.sql.Date;

public class UserAccount {
	
	Integer userAccountId;
	String userName;
	Integer userInfoId;
	String password;
	Date createdAt;
	Date updatedAt;
	
	public Integer getUserAccountId() {
		return userAccountId;
	}
	public void setUserAccountId(Integer userAccountId) {
		this.userAccountId = userAccountId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getUserInfoId() {
		return userInfoId;
	}
	public void setUserInfoId(Integer userInfoId) {
		this.userInfoId = userInfoId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
}
