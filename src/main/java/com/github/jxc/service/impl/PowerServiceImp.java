package com.github.jxc.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.PowerDao;
import com.github.jxc.pojo.Power;
import com.github.jxc.service.PowerService;
@Service("PowerService")
public class PowerServiceImp implements PowerService{
	
	@Resource
	private PowerDao powerDao;
	
	@Override
	public int deleteByPrimaryKey(Integer powerId) {
		return 0;
	}

	@Override
	public int insert(Power record) {
		return 0;
	}

	@Override
	public int insertSelective(Power record) {
		return 0;
	}

	@Override
	public Power selectByPrimaryKey(Integer powerId) {
		return this.powerDao.selectByPrimaryKey(powerId);
	}

	@Override
	public int updateByPrimaryKeySelective(Power record) {
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Power record) {
		return 0;
	}

}
