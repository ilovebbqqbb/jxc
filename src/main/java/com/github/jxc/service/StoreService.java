package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.Store;

public interface StoreService {
	
	List<Store> selectAll();
	
	Store selectByStoreName(String storeName);
}
