package com.github.jxc.dao;

import java.util.Date;
import java.util.List;

import com.github.jxc.pojo.GoodsStatistics;

public interface GoodsStatisticsDao {
	List<GoodsStatistics> selectAll();
	
	List<GoodsStatistics> selectByTimeKey(Date startTime,Date endTime);
}
