package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.SellStatistics;

public interface SellStatisticsService {
	SellStatistics selectByStoreId(Integer storeId);
	
	List<SellStatistics> selectAll();
}
