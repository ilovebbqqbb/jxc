package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.WarehouseDao;
import com.github.jxc.pojo.Warehouse;
import com.github.jxc.service.WarehouseService;

@Service("WarehouseService")
public class WarehouseServiceImpl implements WarehouseService {
	
	@Resource
	private WarehouseDao warehouseDao;
	
	public List<Warehouse> selectAll(){
		return this.warehouseDao.selectAll();
	}
	
	public Warehouse selectByWarehouseName(String warehouseName){
		return this.warehouseDao.selectByWarehouseName(warehouseName);
	}

	@Override
	public int deleteByPrimaryKey(Integer warehouseId) {
		return this.warehouseDao.deleteByPrimaryKey(warehouseId);
	}

	@Override
	public int insert(Warehouse record) {
		return this.warehouseDao.insert(record);
	}

	@Override
	public int insertSelective(Warehouse record) {
		return this.warehouseDao.insertSelective(record);
	}

	@Override
	public Warehouse selectByPrimaryKey(Integer warehouseId) {
		return this.warehouseDao.selectByPrimaryKey(warehouseId);
	}

	@Override
	public int updateByPrimaryKeySelective(Warehouse record) {
		return this.warehouseDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Warehouse record) {
		return this.warehouseDao.updateByPrimaryKey(record);
	}
}
