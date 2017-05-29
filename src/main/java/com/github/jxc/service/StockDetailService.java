package com.github.jxc.service;

import com.github.jxc.pojo.StockDetail;
import com.github.jxc.pojo.StockDetailKey;

public interface StockDetailService {

	int updateByPrimaryKeySelective(StockDetail stockDetail);
	
	StockDetail selectByPrimaryKey(StockDetailKey stockDetailKey);
	
	int insertSelective(StockDetail stockDetail);
}
