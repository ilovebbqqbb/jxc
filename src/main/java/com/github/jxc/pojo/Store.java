package com.github.jxc.pojo;

import java.sql.Date;

public class Store {
	Integer storeId;
	String storeName;
	String linkman;
	String phoneNumber;
	String storeAddress;
	String stockMin;
	String stockMax;
	Date createdAt;
	Date updatedAt;
	
	public Integer getStoreId() {
		return storeId;
	}
	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getStoreAddress() {
		return storeAddress;
	}
	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}
	public String getStockMin() {
		return stockMin;
	}
	public void setStockMin(String stockMin) {
		this.stockMin = stockMin;
	}
	public String getStockMax() {
		return stockMax;
	}
	public void setStockMax(String stockMax) {
		this.stockMax = stockMax;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdateAt() {
		return updatedAt;
	}
	public void setUpdateAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
}
