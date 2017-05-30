package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.RechargeDao;
import com.github.jxc.pojo.Recharge;
import com.github.jxc.service.RechargeService;

@Service("RechargeService")
public class RechargeServiceImpl implements RechargeService {

	@Resource
	private RechargeDao rechargeDao;
	@Override
	public int deleteByPrimaryKey(Integer rechargeId) {
		// TODO Auto-generated method stub
		return rechargeDao.deleteByPrimaryKey(rechargeId);
	}

	@Override
	public int insert(Recharge record) {
		// TODO Auto-generated method stub
		return rechargeDao.insert(record);
	}

	@Override
	public int insertSelective(Recharge record) {
		// TODO Auto-generated method stub
		return rechargeDao.insertSelective(record);
	}

	@Override
	public Recharge selectByPrimaryKey(Integer rechargeId) {
		// TODO Auto-generated method stub
		return rechargeDao.selectByPrimaryKey(rechargeId);
	}

	@Override
	public int updateByPrimaryKeySelective(Recharge record) {
		// TODO Auto-generated method stub
		return rechargeDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Recharge record) {
		// TODO Auto-generated method stub
		return rechargeDao.updateByPrimaryKey(record);
	}
	
	@Override
	public List<Recharge> selectAll() {
		// TODO Auto-generated method stub
		return rechargeDao.selectAll();
	}

}
