package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.SellPreviewDao;
import com.github.jxc.pojo.SellPreview;
import com.github.jxc.service.SellPreviewService;

@Service("SellPreviewService")
public class SellPreviewServiceImpl implements SellPreviewService {

	@Resource
	private SellPreviewDao sellPreviewDao;
	
	public int insertSelective(SellPreview sellPreview){
		return this.sellPreviewDao.insertSelective(sellPreview);
	}
	
	public int deleteByPrimartKey(String sellId){
		return this.sellPreviewDao.deleteByPrimartKey(sellId);
	}
	
	public int updateByPrimaryKeySelective(SellPreview sellPreview){
		return this.sellPreviewDao.updateByPrimaryKeySelective(sellPreview);
	}
	
	public List<SellPreview> selectAll(){
		return this.sellPreviewDao.selectAll();
	}
	
	public List<SellPreview> selectByStatus(String sellStatus){
		return this.sellPreviewDao.selectByStatus(sellStatus);
	}
	
	public List<SellPreview> selectByTwoStatus(String sellStatus1,String SellStatus2){
		return this.sellPreviewDao.selectByTwoStatus(sellStatus1, SellStatus2);
	}
	
	public SellPreview selectByPrimaryKey(String sellId){
		return this.sellPreviewDao.selectByPrimaryKey(sellId);
	}
}
