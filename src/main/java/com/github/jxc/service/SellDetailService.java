package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.SellDetail;

public interface SellDetailService {
	
	int insertSelective(SellDetail sellDetail);
	
	List<SellDetail> selectBySellId(String sellId);
	
	int deleteBySellId(String sellId);
}
