package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.SellPreview;
import com.github.jxc.pojo.SellStatisticsTimeKey;

public interface SellPreviewDao {

	int insertSelective(SellPreview sellPreview);
	
	int deleteByPrimartKey(String sellId);
	
	int updateByPrimaryKeySelective(SellPreview sellPreview);
	
	List<SellPreview> selectAll();
	
	List<SellPreview> selectByStatus(String sellStatus);
	
	List<SellPreview> selectByTwoStatus(String sellStatus1,String SellStatus2);
	
	List<SellPreview> selectByStoreId(Integer storeId);
	
	SellPreview selectByPrimaryKey(String sellId);	
	
	List<SellPreview> selectByTime(SellStatisticsTimeKey sellStatisticsTimeKey);
}
