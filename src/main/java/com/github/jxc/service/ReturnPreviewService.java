package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.ReturnPreview;

public interface ReturnPreviewService {
	
	int insertSelective(ReturnPreview returnPreview);
	
	List<ReturnPreview> selectByStatus(String returnStatus);
	
	ReturnPreview selectByPrimaryKey(String returnId);
	
	int updateByPrimaryKeySelective(ReturnPreview returnPreview);
	
	int deleteByPrimartKey(String returnId);
	
	List<ReturnPreview> selectByNotStatus(String returnStatus);
}
