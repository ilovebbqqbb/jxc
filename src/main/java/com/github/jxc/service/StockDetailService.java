package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.StockDetail;
import com.github.jxc.pojo.StockDetailKey;

public interface StockDetailService {

	int updateByPrimaryKeySelective(StockDetail stockDetail);
	
	int insertSelective(StockDetail stockDetail);
	
	StockDetail selectByPrimaryKey(StockDetailKey stockDetailKey);
	
	List<StockDetail> selectByWarehouseId(Integer warehouseId);
	List<StockDetail> selectAllStock();
}
