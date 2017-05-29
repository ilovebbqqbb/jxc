package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.ReturnDetail;
import com.github.jxc.pojo.ReturnPreview;

public interface ReturnDetailService {
		
	int insertSelective(ReturnDetail returnDetail);
	
	List<ReturnDetail> selectByReturnId(String returnId);
	
	List<ReturnDetail> selectByStoreIdAndReturnId(ReturnPreview returnPreview);
	
	int deleteByReturnId(String returnId);
}
