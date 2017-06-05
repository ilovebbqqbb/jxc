package com.github.jxc.pojo;

import java.sql.Date;

public class DifferencePreview {
	
	String differenceId;
	Date differenceTime;
	Integer warehouseId;
	Integer storeId;
	Integer differenceNum;
	float differenceMoney;
	Integer operater;
	String differenceStatus;
	Store store;
	Warehouse warehouse;
	
	public String getDifferenceId() {
		return differenceId;
	}
	public void setDifferenceId(String differenceId) {
		this.differenceId = differenceId;
	}
	public Date getDifferenceTime() {
		return differenceTime;
	}
	public void setDifferenceTime(Date differenceTime) {
		this.differenceTime = differenceTime;
	}
	public Integer getWarehouseId() {
		return warehouseId;
	}
	public void setWarehouseId(Integer warehouseId) {
		this.warehouseId = warehouseId;
	}
	public Integer getStoreId() {
		return storeId;
	}
	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}
	public Integer getDifferenceNum() {
		return differenceNum;
	}
	public void setDifferenceNum(Integer differenceNum) {
		this.differenceNum = differenceNum;
	}
	public float getDifferenceMoney() {
		return differenceMoney;
	}
	public void setDifferenceMoney(float differenceMoney) {
		this.differenceMoney = differenceMoney;
	}
	public Integer getOperater() {
		return operater;
	}
	public void setOperater(Integer operater) {
		this.operater = operater;
	}
	public String getDifferenceStatus() {
		return differenceStatus;
	}
	public void setDifferenceStatus(String differenceStatus) {
		this.differenceStatus = differenceStatus;
	}
	public Store getStore() {
		return store;
	}
	public void setStore(Store store) {
		this.store = store;
	}
	public Warehouse getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(Warehouse warehouse) {
		this.warehouse = warehouse;
	}
}
