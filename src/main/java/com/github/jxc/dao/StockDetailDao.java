package com.github.jxc.dao;

import com.github.jxc.pojo.StockDetail;
import com.github.jxc.pojo.StockDetailKey;

public interface StockDetailDao {
	
	int updateByPrimaryKeySelective(StockDetail stockDetail);
	
	StockDetail selectByPrimaryKey(StockDetailKey stockDetailKey);
	
	int insertSelective(StockDetail stockDetail);
}
