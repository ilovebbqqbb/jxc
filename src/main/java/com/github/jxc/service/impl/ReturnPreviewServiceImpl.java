package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.ReturnPreviewDao;
import com.github.jxc.pojo.ReturnPreview;
import com.github.jxc.service.ReturnPreviewService;


@Service("ReturnPreviewService")
public class ReturnPreviewServiceImpl implements ReturnPreviewService {
	
	@Resource
	private ReturnPreviewDao returnPreviewDao;
	
	public int insertSelective(ReturnPreview returnPreview){
		return returnPreviewDao.insertSelective(returnPreview);
	}
	
	public List<ReturnPreview> selectByStatus(String returnStatus){
		return returnPreviewDao.selectByStatus(returnStatus);
	}
	
	public ReturnPreview selectByPrimaryKey(String returnId){
		return returnPreviewDao.selectByPrimaryKey(returnId);
	}
	
	public int updateByPrimaryKeySelective(ReturnPreview returnPreview){
		return returnPreviewDao.updateByPrimaryKeySelective(returnPreview);
	}
}
