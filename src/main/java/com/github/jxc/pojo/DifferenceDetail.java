package com.github.jxc.pojo;

public class DifferenceDetail {
	
	Integer differenceDetailId;
	String differenceId;
	Integer goodsId;
	Integer goodsNum;
	String remarks;
	Goods goods;
	StockDetail stockDetail;
	
	public Integer getDifferenceDetailId() {
		return differenceDetailId;
	}
	public void setDifferenceDetailId(Integer differenceDetailId) {
		this.differenceDetailId = differenceDetailId;
	}
	public String getDifferenceId() {
		return differenceId;
	}
	public void setDifferenceId(String differenceId) {
		this.differenceId = differenceId;
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
}
