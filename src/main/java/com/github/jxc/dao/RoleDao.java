package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.Role;
public interface RoleDao {
    int deleteByPrimaryKey(Integer roleId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleId);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    List<Role> selectRoleById(Integer roleId);
    
    List<Role> selectAllRoles();
    
    Role selectByName(String roleName);
}