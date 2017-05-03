package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.UserInfo;
public interface UserInfoDao {
    int deleteByPrimaryKey(Integer userInfoId);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Integer userInfoId);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);
    
    List<UserInfo> selectAllUser();
    
    List<UserInfo> queryAllUserInfo();
    
    
}