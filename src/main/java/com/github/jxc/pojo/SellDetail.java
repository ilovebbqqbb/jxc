package com.github.jxc.pojo;

public class SellDetail {
	Integer sellDetailId;
	String sellId;
	Integer goodsId;
	Integer goodsNum;
	String remarks;
	Goods goods;
	StockDetail stockDetail;
	StoreDetail storeDetail;
	
	public StoreDetail getStoreDetail() {
		return storeDetail;
	}
	public void setStoreDetail(StoreDetail storeDetail) {
		this.storeDetail = storeDetail;
	}
	public Integer getSellDetailId() {
		return sellDetailId;
	}
	public void setSellDetailId(Integer sellDetailId) {
		this.sellDetailId = sellDetailId;
	}
	public StockDetail getStockDetail() {
		return stockDetail;
	}
	public void setStockDetail(StockDetail stockDetail) {
		this.stockDetail = stockDetail;
	}
	public String getSellId() {
		return sellId;
	}
	public void setSellId(String sellId) {
		this.sellId = sellId;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
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
}
