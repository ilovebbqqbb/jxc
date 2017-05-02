package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.SellDetailDao;
import com.github.jxc.pojo.SellDetail;
import com.github.jxc.service.SellDetailService;

@Service("SellDetailService")
public class SellDetailServiceImpl implements SellDetailService{
	
	@Resource
	private SellDetailDao sellDetailDao;
	
	public int insertSelective(SellDetail sellDetail){
		return sellDetailDao.insertSelective(sellDetail);
	}
	
	public List<SellDetail> selectBySellId(String sellId){
		return sellDetailDao.selectBySellId(sellId);
	}
	
	public int deleteBySellId(String sellId){
		return sellDetailDao.deleteBySellId(sellId);
	}
}
