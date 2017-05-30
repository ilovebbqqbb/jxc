package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.DifferencePreviewDao;
import com.github.jxc.pojo.DifferencePreview;
import com.github.jxc.service.DifferencePreviewService;

@Service("DifferencePreviewService")
public class DifferencePreviewServiceImpl implements  DifferencePreviewService{
	
	@Resource
	private DifferencePreviewDao differencePreviewDao;
	
	public int insertSelective(DifferencePreview differencePreview){
		return differencePreviewDao.insertSelective(differencePreview);
	}
	
	public List<DifferencePreview> selectByStatus(String differenceStatus){
		return differencePreviewDao.selectByStatus(differenceStatus);
	}
	
	public DifferencePreview selectByPrimaryKey(String defferenceId){
		return differencePreviewDao.selectByPrimaryKey(defferenceId);
	}
	
	public int updateByPrimaryKeySelective(DifferencePreview differencePreview){
		return differencePreviewDao.updateByPrimaryKeySelective(differencePreview);
	}
	
	public int deleteByPrimartKey(String differenceId){
		return differencePreviewDao.deleteByPrimartKey(differenceId);
	}
	
	public List<DifferencePreview> selectByNotStatus(String differenceStatus){
		return differencePreviewDao.selectByNotStatus(differenceStatus);
	}
	
	public List<DifferencePreview> selectByTwoStatus(String differenceStatus1,String differenceStatus2){
		return differencePreviewDao.selectByTwoStatus(differenceStatus1, differenceStatus2);
	}
	
	public List<DifferencePreview> selectAll(){
		return differencePreviewDao.selectAll();
	}
}
