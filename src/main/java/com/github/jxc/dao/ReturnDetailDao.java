package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.ReturnDetail;

public interface ReturnDetailDao {
	
	int insertSelective(ReturnDetail returnDetail);
	
	List<ReturnDetail> selectByReturnId(String returnId);
}
