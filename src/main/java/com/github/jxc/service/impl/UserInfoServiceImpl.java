package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.UserInfoDao;
import com.github.jxc.pojo.UserInfo;
import com.github.jxc.service.UserInfoService;
@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService{
	@Resource
	UserInfoDao userInfoDao;

	@Override
	public int deleteByPrimaryKey(Integer userInfoId) {
		return this.userInfoDao.deleteByPrimaryKey(userInfoId);
	}

	@Override
	public int insert(UserInfo record) {
		return this.userInfoDao.insert(record);
	}

	@Override
	public int insertSelective(UserInfo record) {
		return this.userInfoDao.insertSelective(record);
	}

	@Override
	public UserInfo selectByPrimaryKey(Integer userInfoId) {
		return this.userInfoDao.selectByPrimaryKey(userInfoId);
	}

	@Override
	public int updateByPrimaryKeySelective(UserInfo record) {
		return this.userInfoDao.updateByPrimaryKey(record);
	}

	@Override
	public int updateByPrimaryKey(UserInfo record) {
		return this.userInfoDao.updateByPrimaryKey(record);
	}

	@Override
	public List<UserInfo> selectAllUser() {
		return this.userInfoDao.selectAllUser();
	}

	@Override
	public List<UserInfo> queryAllUserInfo() {
		return this.userInfoDao.queryAllUserInfo();
	}
}
