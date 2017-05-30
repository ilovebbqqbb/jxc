package com.github.jxc.pojo;

import java.sql.Date;

public class Warehouse {
	Integer warehouseId;
	String warehouseName;
	String linkman;
	String phoneNumber;
	String warehouseAddress;
	Integer stockMin;
	Integer stockMax;
	Date createdAt;
	Date updatedAt;
	public Integer getStockMin() {
		return stockMin;
	}
	public void setStockMin(Integer stockMin) {
		this.stockMin = stockMin;
	}
	public Integer getStockMax() {
		return stockMax;
	}
	public void setStockMax(Integer stockMax) {
		this.stockMax = stockMax;
	}
	public Integer getWarehouseId() {
		return warehouseId;
	}
	public void setWarehouseId(Integer warehouseId) {
		this.warehouseId = warehouseId;
	}
	public String getWarehouseName() {
		return warehouseName;
	}
	public void setWarehouseName(String warehouseName) {
		this.warehouseName = warehouseName;
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
	public String getWarehouseAddress() {
		return warehouseAddress;
	}
	public void setWarehouseAddress(String warehouseAddress) {
		this.warehouseAddress = warehouseAddress;
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
