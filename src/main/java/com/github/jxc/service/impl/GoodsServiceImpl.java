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


	@Override
	public List<Goods> selectBySupplierId(Integer supplierid) {
		return this.goodsDao.selectBySupplierId(supplierid);
	}

	@Override
	public Goods selectByGoodsIdAndSupplierId(Goods goods) {
		return this.goodsDao.selectByGoodsIdAndSupplierId(goods);
	}

	@Override
	public List<Goods> selectByWarehouseId(Integer warehouseId){
		return this.goodsDao.selectByWarehouseId(warehouseId);
	}
	
	@Override
	public Goods selectByPrimaryKeyAndWarehouseId(Integer goodsId,Integer warehouseId){
		return this.goodsDao.selectByPrimaryKeyAndWarehouseId(goodsId, warehouseId);
	}
}
