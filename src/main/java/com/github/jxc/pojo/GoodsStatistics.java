package com.github.jxc.pojo;

public class GoodsStatistics {
	Integer goodsId;
	Integer sellNumStatistics;
	Integer returnNumStatistics;
	Goods goods;
	
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public Integer getSellNumStatistics() {
		return sellNumStatistics;
	}
	public void setSellNumStatistics(Integer sellNumStatistics) {
		this.sellNumStatistics = sellNumStatistics;
	}
	public Integer getReturnNumStatistics() {
		return returnNumStatistics;
	}
	public void setReturnNumStatistics(Integer returnNumStatistics) {
		this.returnNumStatistics = returnNumStatistics;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
}
