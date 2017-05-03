package com.github.jxc.dao;

import com.github.jxc.pojo.UserAccount;
public interface UserAccountDao {
	
	int insertSelective(UserAccount userAccount);
	
	int updateByPrimaryKeySelective(UserAccount userAccount);
	
	UserAccount selectByPrimaryKey(Integer id);
	
	UserAccount selectByName(String petName);
	
	int deleteByPrimaryKey(Integer id);
	
    int deleteByUserInfoId(Integer userInfoId);
    
    UserAccount selectByUserInfoId(Integer userInfoId);
}
