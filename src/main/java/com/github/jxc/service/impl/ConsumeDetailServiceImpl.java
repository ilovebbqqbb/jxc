package com.github.jxc.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.ConsumeDetailDao;
import com.github.jxc.pojo.ConsumeDetail;
import com.github.jxc.service.ConsumeDetailService;

@Service("ConsumeDetailService")
public class ConsumeDetailServiceImpl implements ConsumeDetailService {

	@Resource
	private ConsumeDetailDao consumeDetailDao;
	
	@Override
	public int deleteByPrimaryKey(Integer consumeDetailId) {
		// TODO Auto-generated method stub
		return consumeDetailDao.deleteByPrimaryKey(consumeDetailId);
	}

	@Override
	public int insert(ConsumeDetail record) {
		// TODO Auto-generated method stub
		return consumeDetailDao.insert(record);
	}

	@Override
	public int insertSelective(ConsumeDetail record) {
		// TODO Auto-generated method stub
		return consumeDetailDao.insertSelective(record);
	}

	@Override
	public ConsumeDetail selectByPrimaryKey(Integer consumeDetailId) {
		// TODO Auto-generated method stub
		return consumeDetailDao.selectByPrimaryKey(consumeDetailId);
	}

	@Override
	public int updateByPrimaryKeySelective(ConsumeDetail record) {
		// TODO Auto-generated method stub
		return consumeDetailDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(ConsumeDetail record) {
		// TODO Auto-generated method stub
		return consumeDetailDao.updateByPrimaryKey(record);
	}

}
