package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.SellDetail;
import com.github.jxc.pojo.SellPreview;

public interface SellDetailDao {
	
	int insertSelective(SellDetail sellDetail);
	
	List<SellDetail> selectBySellId(String sellId);
	
	int deleteBySellId(String sellId);
	
	List<SellDetail> selectByWarehouseIdAndSellId(SellPreview sellPreview);
}
