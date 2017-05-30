package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.Department;

public interface DepartmentService {
	int deleteByPrimaryKey(Integer departmentId);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Integer departmentId);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
    
    List<Department> selectAllParentDepartment();

	List<Department> selectAllDepartment();
	
	int deleteByParentId(Integer parentId);
	 
	List<Department> selectByParentId(Integer parentId);
	
	Department selectDepartByName(String departName);
}
