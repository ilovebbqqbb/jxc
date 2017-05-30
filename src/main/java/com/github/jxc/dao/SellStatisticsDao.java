package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.SellStatistics;
import com.github.jxc.pojo.SellStatisticsTimeKey;

//销售统计
public interface SellStatisticsDao {
	
	//根据商店编号查找销售统计
	SellStatistics selectByStoreId(Integer storeId);
	
	//查找所有销售统计
	List<SellStatistics> selectAll();
	
	SellStatistics selectByTime(SellStatisticsTimeKey sellStatisticsTimeKey);
}
