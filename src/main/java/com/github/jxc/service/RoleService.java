package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.Role;

public interface RoleService {
	    
	int deleteByPrimaryKey(Integer roleId);

	    int insert(Role record);

	    int insertSelective(Role record);

	    Role selectByPrimaryKey(Integer roleId);

	    int updateByPrimaryKeySelective(Role record);

	    int updateByPrimaryKey(Role record);
	    
	    List<Role> selectRoleById(Integer roleId);
	    
	    List<Role> selectAllRoles();
}
