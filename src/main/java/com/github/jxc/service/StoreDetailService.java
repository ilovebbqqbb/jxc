package com.github.jxc.service;

import com.github.jxc.pojo.StoreDetail;
import com.github.jxc.pojo.StoreDetailKey;

public interface StoreDetailService {
	
	int updateByPrimaryKeySelective(StoreDetail storeDetail);
	
	int insertSelective(StoreDetail storeDetail);
	
	StoreDetail selectByPrimaryKey(StoreDetailKey storeDetailKey);
}
