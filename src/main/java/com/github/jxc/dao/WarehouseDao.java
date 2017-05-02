package com.github.jxc.dao;

import com.github.jxc.pojo.Warehouse;

import java.util.List;

public interface WarehouseDao {
	
	List<Warehouse> selectAll();
	
	Warehouse selectByWarehouseName(String warehouseName);
}
