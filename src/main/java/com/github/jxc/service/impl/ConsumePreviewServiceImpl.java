package com.github.jxc.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.ConsumePreviewDao;
import com.github.jxc.pojo.ConsumePreview;
import com.github.jxc.service.ConsumePreviewService;

@Service("ConsumePreviewService")
public class ConsumePreviewServiceImpl implements ConsumePreviewService {
	
	@Resource
	private ConsumePreviewDao consumePreviewDao;
	
	@Override
	public int deleteByPrimaryKey(String consumeId) {
		// TODO Auto-generated method stub
		return consumePreviewDao.deleteByPrimaryKey(consumeId);
	}

	@Override
	public int insert(ConsumePreview record) {
		// TODO Auto-generated method stub
		return consumePreviewDao.insert(record);
	}

	@Override
	public int insertSelective(ConsumePreview record) {
		// TODO Auto-generated method stub
		return consumePreviewDao.insertSelective(record);
	}

	@Override
	public ConsumePreview selectByPrimaryKey(String consumeId) {
		// TODO Auto-generated method stub
		return consumePreviewDao.selectByPrimaryKey(consumeId);
	}

	@Override
	public int updateByPrimaryKeySelective(ConsumePreview record) {
		// TODO Auto-generated method stub
		return consumePreviewDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(ConsumePreview record) {
		// TODO Auto-generated method stub
		return consumePreviewDao.updateByPrimaryKey(record);
	}

}
