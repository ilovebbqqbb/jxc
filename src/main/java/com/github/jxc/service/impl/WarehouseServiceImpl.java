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
}
