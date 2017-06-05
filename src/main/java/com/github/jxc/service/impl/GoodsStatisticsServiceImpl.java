package com.github.jxc.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.GoodsStatisticsDao;
import com.github.jxc.pojo.GoodsStatistics;
import com.github.jxc.service.GoodsStatisticsService;

@Service("GoodsStatisticsService")
public class GoodsStatisticsServiceImpl implements GoodsStatisticsService {
	
	@Resource
	private GoodsStatisticsDao goodsStatisticsDao;
	
	public List<GoodsStatistics> selectAll(){
		return goodsStatisticsDao.selectAll();
	}
	
	public List<GoodsStatistics> selectByTimeKey(Date startTime,Date endTime){
		return goodsStatisticsDao.selectByTimeKey(startTime, endTime);
	}
}
