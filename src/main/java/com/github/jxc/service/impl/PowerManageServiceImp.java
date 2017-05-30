package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.PowerManageDao;
import com.github.jxc.pojo.PowerManage;
import com.github.jxc.pojo.PowerManageKey;
import com.github.jxc.service.PowerManageService;
@Service("PowerManageService")
public class PowerManageServiceImp implements PowerManageService{
	@Resource
	private PowerManageDao powerManageDao;

	@Override
	public int deleteByPrimaryKey(PowerManageKey key) {
		return this.powerManageDao.deleteByPrimaryKey(key);
	}

	@Override
	public int insert(PowerManage record) {
		return 0;
	}

	@Override
	public int insertSelective(PowerManage record) {
		return this.powerManageDao.insertSelective(record);
	}

	@Override
	public PowerManage selectByPrimaryKey(PowerManageKey key) {
		return this.powerManageDao.selectByPrimaryKey(key);
	}

	@Override
	public int updateByPrimaryKeySelective(PowerManage record) {
		return 0;
	}

	@Override
	public int updateByPrimaryKey(PowerManage record) {
		return 0;
	}

	@Override
	public List<PowerManage> selectAllPowerManage() {
		return this.powerManageDao.selectAllPowerManage();
	}

	@Override
	public List<Integer> selectPowerManageByRoleId(Integer roleId) {
		return this.powerManageDao.selectPowerManageByRoleId(roleId);
	}

	@Override
	public int deleteByRoleId(Integer roleId) {
		return this.powerManageDao.deleteByRoleId(roleId);
	}
	
	
}
