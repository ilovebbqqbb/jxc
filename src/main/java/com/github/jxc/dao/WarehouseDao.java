package com.github.jxc.dao;

import com.github.jxc.pojo.Warehouse;

import java.util.List;

public interface WarehouseDao {
	
	List<Warehouse> selectAll();
	
	Warehouse selectByWarehouseName(String warehouseName);
	
	int deleteByPrimaryKey(Integer warehouseId);

    int insert(Warehouse record);

    int insertSelective(Warehouse record);

    Warehouse selectByPrimaryKey(Integer warehouseId);

    int updateByPrimaryKeySelective(Warehouse record);

    int updateByPrimaryKey(Warehouse record);
}
