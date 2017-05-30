package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.SellStatisticsDao;
import com.github.jxc.pojo.SellStatistics;
import com.github.jxc.pojo.SellStatisticsTimeKey;
import com.github.jxc.service.SellStatisticsService;


@Service("SellStatisticsService")
public class SellStatisticsServiceImpl implements SellStatisticsService {
	
	@Resource
	private SellStatisticsDao sellStatisticsDao;
	
	public SellStatistics selectByStoreId(Integer storeId){
		return sellStatisticsDao.selectByStoreId(storeId);
	}
	
	public List<SellStatistics> selectAll(){
		return sellStatisticsDao.selectAll();
	}
	
	public SellStatistics selectByTime(SellStatisticsTimeKey sellStatisticsTimeKey){
		return sellStatisticsDao.selectByTime(sellStatisticsTimeKey);
	}
}
