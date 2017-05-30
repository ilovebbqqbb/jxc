package com.github.jxc.service.impl;

import java.util.List;

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

	@Override
	public int insertSelective(StockDetail stockDetail) {
		return this.stockDetailDao.insertSelective(stockDetail);
	}

	@Override
	public StockDetail selectByPrimaryKey(StockDetailKey stockDetailKey) {
		return this.stockDetailDao.selectByPrimaryKey(stockDetailKey);
	}

	@Override
	public List<StockDetail> selectByWarehouseId(Integer warehouseId) {
		return this.stockDetailDao.selectByWarehouseId(warehouseId);
	}

	@Override
	public List<StockDetail> selectAllStock() {
		return this.stockDetailDao.selectAllStock();
	}
}
