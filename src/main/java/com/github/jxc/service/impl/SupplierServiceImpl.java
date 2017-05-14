package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.SupplierDao;
import com.github.jxc.pojo.Supplier;
import com.github.jxc.service.SupplierService;
@Service("SupplierService")
public class SupplierServiceImpl implements SupplierService{
	@Resource
	private SupplierDao supplierDao;

	@Override
	public int deleteByPrimaryKey(Integer supplierid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Supplier record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Supplier record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Supplier selectByPrimaryKey(Integer supplierid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(Supplier record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Supplier record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Supplier> selectAllSupplier() {
		return this.supplierDao.selectAllSupplier();
	}
}
