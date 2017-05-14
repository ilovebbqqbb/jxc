package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.RoleDao;
import com.github.jxc.pojo.Role;
import com.github.jxc.service.RoleService;
@Service("RoleService")
public class RoleServiceImpl implements RoleService{

	@Resource
	RoleDao roleDao;

	@Override
	public int deleteByPrimaryKey(Integer roleId) {
		return this.roleDao.deleteByPrimaryKey(roleId);
	}

	@Override
	public int insert(Role record) {
		return this.roleDao.insert(record);
	}

	@Override
	public int insertSelective(Role record) {
		return this.roleDao.insertSelective(record);
	}

	@Override
	public Role selectByPrimaryKey(Integer roleId) {
		return this.roleDao.selectByPrimaryKey(roleId);
	}

	@Override
	public int updateByPrimaryKeySelective(Role record) {
		return this.roleDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Role record) {
		return this.roleDao.updateByPrimaryKey(record);
	}


	
	@Override
	public List<Role> selectRoleById(Integer roleId) {
		return this.roleDao.selectRoleById(roleId);
	}

	@Override
	public List<Role> selectAllRoles() {
		return this.roleDao.selectAllRoles();
	}

	
}
