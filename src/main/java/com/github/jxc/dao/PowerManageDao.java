package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.PowerManage;
import com.github.jxc.pojo.PowerManageKey;

public interface PowerManageDao {
    int deleteByPrimaryKey(PowerManageKey key);

    int insert(PowerManage record);

    int insertSelective(PowerManage record);

    PowerManage selectByPrimaryKey(PowerManageKey key);

    int updateByPrimaryKeySelective(PowerManage record);

    int updateByPrimaryKey(PowerManage record);
    
    List<PowerManage> selectAllPowerManage();
    List<Integer> selectPowerManageByRoleId(Integer roleId);
    int deleteByRoleId(Integer roleId);
}