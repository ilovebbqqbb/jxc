package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.SellPreview;

public interface SellPreviewService {
	
	int insertSelective(SellPreview sellPreview);
	
	int deleteByPrimartKey(String sellId);
	
	int updateByPrimaryKeySelective(SellPreview sellPreview);
	
	List<SellPreview> selectAll();
	
	List<SellPreview> selectByStatus(String sellStatus);
	
	List<SellPreview> selectByTwoStatus(String sellStatus1,String SellStatus2);
	
	List<SellPreview> selectByStoreId(Integer storeId);
	
	SellPreview selectByPrimaryKey(String sellId);	
}
