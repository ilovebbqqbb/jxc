package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.Department;
public interface DepartmentDao {
    int deleteByPrimaryKey(Integer departmentId);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Integer departmentId);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
    
    List<Department> selectAllDepartment();
}