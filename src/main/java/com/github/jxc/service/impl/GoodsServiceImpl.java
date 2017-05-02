package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.GoodsDao;
import com.github.jxc.pojo.Goods;
import com.github.jxc.service.GoodsService;

@Service("GoodsService")
public class GoodsServiceImpl implements GoodsService {
	
	@Resource
	private GoodsDao goodsDao;
	
	public List<Goods> selectAll(){
		return goodsDao.selectAll();
	}
	
	public Goods selectByPrimaryKey(Integer goodsId){
		return goodsDao.selectByPrimaryKey(goodsId);
	}
}
