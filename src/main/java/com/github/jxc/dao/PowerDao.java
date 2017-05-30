package com.github.jxc.dao;

import com.github.jxc.pojo.Power;

public interface PowerDao {
    int deleteByPrimaryKey(Integer powerId);

    int insert(Power record);

    int insertSelective(Power record);

    Power selectByPrimaryKey(Integer powerId);

    int updateByPrimaryKeySelective(Power record);

    int updateByPrimaryKey(Power record);
}