package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.PowerManage;
import com.github.jxc.pojo.PowerManageKey;

public interface PowerManageService {
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
