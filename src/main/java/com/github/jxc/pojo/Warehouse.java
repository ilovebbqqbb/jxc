package com.github.jxc.pojo;

import java.sql.Date;

public class Warehouse {
	Integer warehouseId;
	String warehouseName;
	String linkman;
	String phoneNumber;
	String warehouseAddress;
	String stockMin;
	String stockMax;
	Date createdAt;
	Date updatedAt;
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
