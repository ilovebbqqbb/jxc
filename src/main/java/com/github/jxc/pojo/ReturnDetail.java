package com.github.jxc.pojo;

public class ReturnDetail {
	Integer returnDetailId;
	String returnId;
	Integer goodsId;
	Integer goodsNum;
	String remarks;
	Goods goods;
	
	public Integer getReturnDetailId() {
		return returnDetailId;
	}
	public void setReturnDetailId(Integer returnDetailId) {
		this.returnDetailId = returnDetailId;
	}
	public String getReturnId() {
		return returnId;
	}
	public void setReturnId(String returnId) {
		this.returnId = returnId;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public Integer getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(Integer goodsNum) {
		this.goodsNum = goodsNum;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public StockDetail getStockDetail() {
		return stockDetail;
	}
	public void setStockDetail(StockDetail stockDetail) {
		this.stockDetail = stockDetail;
	}
	public StoreDetail getStoreDetail() {
		return storeDetail;
	}
	public void setStoreDetail(StoreDetail storeDetail) {
		this.storeDetail = storeDetail;
	}
	StockDetail stockDetail;
	StoreDetail storeDetail;
}
