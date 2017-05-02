package com.github.jxc.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.UserAccountDao;
import com.github.jxc.pojo.UserAccount;
import com.github.jxc.service.UserAccountService;

@Service("userAccountService")
public class UserAccountServiceImpl implements UserAccountService{
	
	@Resource
	private UserAccountDao userAccountDao;
	
	public int insertSelective(UserAccount userAccount) {
		return this.userAccountDao.insertSelective(userAccount);
	}
	
	public int updateByPrimaryKeySelective(UserAccount userAccount) {
		return this.userAccountDao.updateByPrimaryKeySelective(userAccount);
	}
	
	public UserAccount selectByPrimaryKey(Integer id) {
		return this.userAccountDao.selectByPrimaryKey(id);
	}
	
	public int deleteByPrimaryKey(Integer id) {
		return this.userAccountDao.deleteByPrimaryKey(id);
	}
	
	public UserAccount selectByName(String userName) {
		return this.userAccountDao.selectByName(userName);
	}
}
