package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.SellDetail;
import com.github.jxc.pojo.SellPreview;

public interface SellDetailService {
	
	int insertSelective(SellDetail sellDetail);
	
	List<SellDetail> selectBySellId(String sellId);
	
	int deleteBySellId(String sellId);
	
	List<SellDetail> selectByWarehouseIdAndSellId(SellPreview sellPreview);
}
