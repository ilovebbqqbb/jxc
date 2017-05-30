package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.DepartmentDao;
import com.github.jxc.pojo.Department;
import com.github.jxc.service.DepartmentService;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService{

	@Resource
	DepartmentDao departmentDao;
	@Override
	public int deleteByPrimaryKey(Integer departmentId) {
		return this.departmentDao.deleteByPrimaryKey(departmentId);
	}

	@Override
	public int insert(Department record) {
		return this.departmentDao.insert(record);
	}

	@Override
	public int insertSelective(Department record) {
		return this.departmentDao.insertSelective(record);
	}

	@Override
	public Department selectByPrimaryKey(Integer departmentId) {
		return this.departmentDao.selectByPrimaryKey(departmentId);
	}

	@Override
	public int updateByPrimaryKeySelective(Department record) {
		return this.departmentDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Department record) {
		return this.departmentDao.updateByPrimaryKey(record);
	}

	@Override
	public List<Department> selectAllParentDepartment() {
		return this.departmentDao.selectAllParentDepartment();
	}

	@Override
	public List<Department> selectAllDepartment() {
		return this.departmentDao.selectAllDepartment();
	}

	@Override
	public int deleteByParentId(Integer parentId) {
		return this.departmentDao.deleteByParentId(parentId);
	}

	@Override
	public List<Department> selectByParentId(Integer parentId) {
		return this.departmentDao.selectByParentId(parentId);
	}

	@Override
	public Department selectDepartByName(String departName) {
		return this.departmentDao.selectDepartByName(departName);
	}

}
