package com.github.jxc.dao;

import com.github.jxc.pojo.StoreDetail;
import com.github.jxc.pojo.StoreDetailKey;

public interface StoreDetailDao {
	
	int updateByPrimaryKeySelective(StoreDetail storeDetail);
	
	int insertSelective(StoreDetail storeDetail);
	
	StoreDetail selectByPrimaryKey(StoreDetailKey storeDetailKey);
}
