package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.Warehouse;

public interface WarehouseService {
	
	
	List<Warehouse> selectAll();
	
	Warehouse selectByWarehouseName(String warehouseName);
}
