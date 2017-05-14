package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.ReturnDetail;

public interface ReturnDetailService {
		
	int insertSelective(ReturnDetail returnDetail);
	
	List<ReturnDetail> selectByReturnId(String returnId);
}
