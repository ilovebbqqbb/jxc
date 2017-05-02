package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.SellDetail;

public interface SellDetailDao {
	
	int insertSelective(SellDetail sellDetail);
	
	List<SellDetail> selectBySellId(String sellId);
	
	int deleteBySellId(String sellId);
}
