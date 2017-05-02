package com.github.jxc.dao;

import com.github.jxc.pojo.Store;

import java.util.List;

public interface StoreDao {
	
	List<Store> selectAll();
	
	Store selectByStoreName(String storeName);
}
