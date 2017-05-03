package com.github.jxc.pojo;

public class SellDetail {
	Integer sellDetailId;
	String sellId;
	Integer goodsId;
	Integer goodsNum;
	String remarks;
	Goods goods;
	
	public Integer getSellDetailId() {
		return sellDetailId;
	}
	public void setSellDetailId(Integer sellDetailId) {
		this.sellDetailId = sellDetailId;
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
