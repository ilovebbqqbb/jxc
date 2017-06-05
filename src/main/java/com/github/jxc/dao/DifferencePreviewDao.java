package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.DifferencePreview;

public interface DifferencePreviewDao {
	
	int insertSelective(DifferencePreview differencePreview);
	
	List<DifferencePreview> selectByStatus(String differenceStatus);
	
	DifferencePreview selectByPrimaryKey(String defferenceId);
	
	int updateByPrimaryKeySelective(DifferencePreview differencePreview);
	
	int deleteByPrimartKey(String differenceId);
	
	List<DifferencePreview> selectByNotStatus(String differenceStatus);
	
	List<DifferencePreview> selectByTwoStatus(String differenceStatus1,String differenceStatus2);
	
	List<DifferencePreview> selectAll();
}
