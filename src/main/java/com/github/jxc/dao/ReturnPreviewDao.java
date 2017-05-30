package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.ReturnPreview;
import com.github.jxc.pojo.SellStatisticsTimeKey;

public interface ReturnPreviewDao {
	
	int insertSelective(ReturnPreview returnPreview);
	
	List<ReturnPreview> selectByStatus(String returnStatus);
	
	ReturnPreview selectByPrimaryKey(String returnId);
	
	int updateByPrimaryKeySelective(ReturnPreview returnPreview);
	
	int deleteByPrimartKey(String returnId);
	
	List<ReturnPreview> selectByNotStatus(String returnStatus);
	
	List<ReturnPreview> selectByStoreId(Integer storeId);
	
	List<ReturnPreview> selectByTime(SellStatisticsTimeKey sellStatisticsTimeKey);
}
