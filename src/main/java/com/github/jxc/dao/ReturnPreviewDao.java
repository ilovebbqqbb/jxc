package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.ReturnPreview;

public interface ReturnPreviewDao {
	
	int insertSelective(ReturnPreview returnPreview);
	
	List<ReturnPreview> selectByStatus(String returnStatus);
	
	ReturnPreview selectByPrimaryKey(String returnId);
	
	int updateByPrimaryKeySelective(ReturnPreview returnPreview);
}
