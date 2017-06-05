package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.DifferenceDetailDao;
import com.github.jxc.pojo.DifferenceDetail;
import com.github.jxc.pojo.DifferencePreview;
import com.github.jxc.service.DifferenceDetailService;

@Service("DifferenceDetailService")
public class DifferenceDetailServiceImpl implements DifferenceDetailService{
	
	@Resource
	private DifferenceDetailDao differenceDetailDao;
	
	public int insertSelective(DifferenceDetail differenceDetail){
		return differenceDetailDao.insertSelective(differenceDetail);
	}
	
	public List<DifferenceDetail> selectByDifferenceId(String differenceId){
		return differenceDetailDao.selectByDifferenceId(differenceId);
	}
	
	public int deleteByDifferenceId(String differenceId){
		return differenceDetailDao.deleteByDifferenceId(differenceId);
	}
	
	public List<DifferenceDetail> selectByWarehouseIdAndDifferenceId(DifferencePreview differencePreview){
		return differenceDetailDao.selectByWarehouseIdAndDifferenceId(differencePreview);
	}
}
