package com.github.jxc.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.UserAccountDao;
import com.github.jxc.pojo.UserAccount;
import com.github.jxc.service.UserAccountService;
@Service("userAccountService")
public class UserAccountServiceImpl implements UserAccountService{

	@Resource
	UserAccountDao userAccountDao;

	@Override
	public int insertSelective(UserAccount userAccount) {
		return this.userAccountDao.insertSelective(userAccount);
	}

	@Override
	public int updateByPrimaryKeySelective(UserAccount userAccount) {
		return this.userAccountDao.updateByPrimaryKeySelective(userAccount);
	}

	@Override
	public UserAccount selectByPrimaryKey(Integer id) {
		return this.userAccountDao.selectByPrimaryKey(id);
	}

	@Override
	public UserAccount selectByName(String petName) {
		return this.userAccountDao.selectByName(petName);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return this.userAccountDao.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteByUserInfoId(Integer userInfoId) {
		return this.userAccountDao.deleteByUserInfoId(userInfoId);
	}

	@Override
	public UserAccount selectByUserInfoId(Integer userInfoId) {
		return this.userAccountDao.selectByUserInfoId(userInfoId);
	}
}
