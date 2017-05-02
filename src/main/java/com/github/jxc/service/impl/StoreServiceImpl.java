package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.StoreDao;
import com.github.jxc.pojo.Store;
import com.github.jxc.service.StoreService;

@Service("StoreService")
public class StoreServiceImpl implements StoreService {
	
	@Resource
	private StoreDao storeDao;
	
	public List<Store> selectAll(){
		return this.storeDao.selectAll();
	}
	
	public Store selectByStoreName(String storeName){
		return this.storeDao.selectByStoreName(storeName);
	}
}
