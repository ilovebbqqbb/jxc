package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.ReturnPreview;
import com.github.jxc.pojo.SellStatisticsTimeKey;

public interface ReturnPreviewService {
	
	int insertSelective(ReturnPreview returnPreview);
	
	List<ReturnPreview> selectByStatus(String returnStatus);
	
	ReturnPreview selectByPrimaryKey(String returnId);
	
	int updateByPrimaryKeySelective(ReturnPreview returnPreview);
	
	int deleteByPrimartKey(String returnId);
	
	List<ReturnPreview> selectByNotStatus(String returnStatus);
	
	List<ReturnPreview> selectByStoreId(Integer storeId);
	
	List<ReturnPreview> selectByTime(SellStatisticsTimeKey sellStatisticsTimeKey);
}
