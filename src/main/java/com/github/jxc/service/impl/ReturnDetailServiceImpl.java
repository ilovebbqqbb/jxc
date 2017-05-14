package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.ReturnDetailDao;
import com.github.jxc.pojo.ReturnDetail;
import com.github.jxc.service.ReturnDetailService;

@Service("ReturnDetailService")
public class ReturnDetailServiceImpl implements ReturnDetailService {
	
	@Resource
	private ReturnDetailDao returnDetailDao;
	
	public int insertSelective(ReturnDetail returnDetail){
		return returnDetailDao.insertSelective(returnDetail);
	}
	
	public List<ReturnDetail> selectByReturnId(String returnId){
		return returnDetailDao.selectByReturnId(returnId);
	}
}
