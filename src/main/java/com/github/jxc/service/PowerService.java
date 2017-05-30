package com.github.jxc.service;

import com.github.jxc.pojo.Power;

public interface PowerService {
	  int deleteByPrimaryKey(Integer powerId);

	    int insert(Power record);

	    int insertSelective(Power record);

	    Power selectByPrimaryKey(Integer powerId);

	    int updateByPrimaryKeySelective(Power record);

	    int updateByPrimaryKey(Power record);
}
