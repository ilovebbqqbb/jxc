package com.github.jxc.service;

import com.github.jxc.pojo.UserAccount;

public interface UserAccountService {
	
	int insertSelective(UserAccount userAccount);
	
	int updateByPrimaryKeySelective(UserAccount userAccount);
	
	UserAccount selectByPrimaryKey(Integer id);
	
	UserAccount selectByName(String userName);
	
	int deleteByPrimaryKey(Integer id);
}
