package com.github.jxc.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.StoreDetailDao;
import com.github.jxc.pojo.StoreDetail;
import com.github.jxc.pojo.StoreDetailKey;
import com.github.jxc.service.StoreDetailService;

@Service("StoreDetailService")
public class StoreDetailServiceImpl implements StoreDetailService {
	
	@Resource
	private StoreDetailDao storeDetailDao;
	
	public int updateByPrimaryKeySelective(StoreDetail storeDetail){
		return storeDetailDao.updateByPrimaryKeySelective(storeDetail);
	}
	
	public int insertSelective(StoreDetail storeDetail){
		return storeDetailDao.insertSelective(storeDetail);
	}
	
	public StoreDetail selectByPrimaryKey(StoreDetailKey storeDetailKey){
		return storeDetailDao.selectByPrimaryKey(storeDetailKey);
	}
}
