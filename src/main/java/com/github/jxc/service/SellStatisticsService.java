package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.SellStatistics;
import com.github.jxc.pojo.SellStatisticsTimeKey;

public interface SellStatisticsService {
	SellStatistics selectByStoreId(Integer storeId);
	
	List<SellStatistics> selectAll();
	
	SellStatistics selectByTime(SellStatisticsTimeKey sellStatisticsTimeKey);
}
