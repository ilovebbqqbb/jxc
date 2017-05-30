package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.StockDetail;
import com.github.jxc.pojo.StockDetailKey;

public interface StockDetailDao {
	
	int updateByPrimaryKeySelective(StockDetail stockDetail);
	
	List<StockDetail> selectByWarehouseId(Integer warehouseId);
	
	List<StockDetail> selectAllStock();

	StockDetail selectByPrimaryKey(StockDetailKey stockDetailKey);
	
	int insertSelective(StockDetail stockDetail);

}
