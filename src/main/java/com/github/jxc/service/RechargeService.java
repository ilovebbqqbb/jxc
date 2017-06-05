package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.Recharge;

public interface RechargeService {
    int deleteByPrimaryKey(Integer rechargeId);

    int insert(Recharge record);

    int insertSelective(Recharge record);

    Recharge selectByPrimaryKey(Integer rechargeId);

    int updateByPrimaryKeySelective(Recharge record);

    int updateByPrimaryKey(Recharge record);
    
    List<Recharge> selectAll();
}
