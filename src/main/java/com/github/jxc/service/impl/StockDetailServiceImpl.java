package com.github.jxc.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.StockDetailDao;
import com.github.jxc.pojo.StockDetail;
import com.github.jxc.pojo.StockDetailKey;
import com.github.jxc.service.StockDetailService;

@Service("StockDetailService")
public class StockDetailServiceImpl implements StockDetailService {
	
	@Resource
	private StockDetailDao stockDetailDao;
	
	public int updateByPrimaryKeySelective(StockDetail stockDetail){
		return stockDetailDao.updateByPrimaryKeySelective(stockDetail);
	}
	
	public StockDetail selectByPrimaryKey(StockDetailKey stockDetailKey){
		return stockDetailDao.selectByPrimaryKey(stockDetailKey);
	}
	
	public int insertSelective(StockDetail stockDetail){
		return stockDetailDao.insertSelective(stockDetail);
	}
}
