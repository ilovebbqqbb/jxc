package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.Supplier;

public interface SupplierService {
	 int deleteByPrimaryKey(Integer supplierid);

	    int insert(Supplier record);

	    int insertSelective(Supplier record);

	    Supplier selectByPrimaryKey(Integer supplierid);

	    int updateByPrimaryKeySelective(Supplier record);

	    int updateByPrimaryKey(Supplier record);
	    
	    List<Supplier> selectAllSupplier();
}
