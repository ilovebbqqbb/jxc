package com.github.jxc.pojo;

public class SellStatistics {
	
	Integer storeId;
	Integer sellNumStatistics;
	float sellMoneyStatistics;
	Integer returnNumStatistics;
	float returnMoneyStatistics;
	Store store;
	
	public Store getStore() {
		return store;
	}
	public void setStore(Store store) {
		this.store = store;
	}
	public Integer getStoreId() {
		return storeId;
	}
	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}
	public Integer getSellNumStatistics() {
		return sellNumStatistics;
	}
	public void setSellNumStatistics(Integer sellNumStatistics) {
		this.sellNumStatistics = sellNumStatistics;
	}
	public float getSellMoneyStatistics() {
		return sellMoneyStatistics;
	}
	public void setSellMoneyStatistics(float sellMoneyStatistics) {
		this.sellMoneyStatistics = sellMoneyStatistics;
	}
	public Integer getReturnNumStatistics() {
		return returnNumStatistics;
	}
	public void setReturnNumStatistics(Integer returnNumStatistics) {
		this.returnNumStatistics = returnNumStatistics;
	}
	public float getReturnMoneyStatistics() {
		return returnMoneyStatistics;
	}
	public void setReturnMoneyStatistics(float returnMoneyStatistics) {
		this.returnMoneyStatistics = returnMoneyStatistics;
	}
}
