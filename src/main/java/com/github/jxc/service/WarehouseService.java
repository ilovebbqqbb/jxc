package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.Warehouse;

public interface WarehouseService {
	
	
	List<Warehouse> selectAll();
	
	Warehouse selectByWarehouseName(String warehouseName);
	
	int deleteByPrimaryKey(Integer warehouseId);

    int insert(Warehouse record);

    int insertSelective(Warehouse record);

    Warehouse selectByPrimaryKey(Integer warehouseId);

    int updateByPrimaryKeySelective(Warehouse record);

    int updateByPrimaryKey(Warehouse record);
}
