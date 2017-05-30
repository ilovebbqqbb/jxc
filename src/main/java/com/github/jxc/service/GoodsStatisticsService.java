package com.github.jxc.service;

import java.util.Date;
import java.util.List;

import com.github.jxc.pojo.GoodsStatistics;

public interface GoodsStatisticsService {
	List<GoodsStatistics> selectAll();
	
	List<GoodsStatistics> selectByTimeKey(Date startTime,Date endTime);
}
