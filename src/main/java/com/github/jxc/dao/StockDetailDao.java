package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.StockDetail;
import com.github.jxc.pojo.StockDetailKey;

public interface StockDetailDao {
	
	int updateByPrimaryKeySelective(StockDetail stockDetail);
	
	int insertSelective(StockDetail stockDetail);
	
	StockDetail selectByPrimaryKey(StockDetailKey stockDetailKey);
	
	List<StockDetail> selectByWarehouseId(Integer warehouseId);
	
	List<StockDetail> selectAllStock();
}
