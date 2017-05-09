package com.github.jxc.dao;

import com.github.jxc.pojo.StockDetail;

public interface StockDetailDao {
	
	int updateByPrimaryKeySelective(StockDetail stockDetail);
}
