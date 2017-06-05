package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.Member;

public interface MemberDao {
    int deleteByPrimaryKey(Integer memberId);

    int insert(Member record);

    int insertSelective(Member record);

    Member selectByPrimaryKey(Integer memberId);

    int updateByPrimaryKeySelective(Member record);

    int updateByPrimaryKey(Member record);
    
    List<Member> selectAll();
}