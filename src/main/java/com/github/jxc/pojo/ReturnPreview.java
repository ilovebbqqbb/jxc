package com.github.jxc.pojo;

import java.sql.Date;

public class ReturnPreview {
	
	String returnId;
	Date returnTime;
	Integer warehouseId;
	Integer storeId;
	Integer returnNum;
	float returnMoney;
	Integer operater;
	String returnStatus;
	Store store;
	Warehouse warehouse;
	public String getReturnId() {
		return returnId;
	}
	public void setReturnId(String returnId) {
		this.returnId = returnId;
	}
	public Date getReturnTime() {
		return returnTime;
	}
	public void setReturnTime(Date returnTime) {
		this.returnTime = returnTime;
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
	public Integer getReturnNum() {
		return returnNum;
	}
	public void setReturnNum(Integer returnNum) {
		this.returnNum = returnNum;
	}
	public float getReturnMoney() {
		return returnMoney;
	}
	public void setReturnMoney(float returnMoney) {
		this.returnMoney = returnMoney;
	}
	public Integer getOperater() {
		return operater;
	}
	public void setOperater(Integer operater) {
		this.operater = operater;
	}
	public String getReturnStatus() {
		return returnStatus;
	}
	public void setReturnStatus(String returnStatus) {
		this.returnStatus = returnStatus;
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
