package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.Supplier;

public interface SupplierDao {
    int deleteByPrimaryKey(Integer supplierid);

    int insert(Supplier record);

    int insertSelective(Supplier record);

    Supplier selectByPrimaryKey(Integer supplierid);

    int updateByPrimaryKeySelective(Supplier record);

    int updateByPrimaryKey(Supplier record);
    
    List<Supplier> selectAllSupplier();
}