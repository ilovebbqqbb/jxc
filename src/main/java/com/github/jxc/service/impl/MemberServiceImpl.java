package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.MemberDao;
import com.github.jxc.pojo.Member;
import com.github.jxc.service.MemberService;

@Service("MemberService")
public class MemberServiceImpl implements MemberService{
	
	@Resource
	private MemberDao memberDao;
	
	@Override
	public int deleteByPrimaryKey(Integer memberId) {
		// TODO Auto-generated method stub
		return memberDao.deleteByPrimaryKey(memberId);
	}

	@Override
	public int insert(Member record) {
		// TODO Auto-generated method stub
		return memberDao.insert(record);
	}

	@Override
	public int insertSelective(Member record) {
		// TODO Auto-generated method stub
		return memberDao.insertSelective(record);
	}

	@Override
	public Member selectByPrimaryKey(Integer memberId) {
		// TODO Auto-generated method stub
		return memberDao.selectByPrimaryKey(memberId);
	}

	@Override
	public int updateByPrimaryKeySelective(Member record) {
		// TODO Auto-generated method stub
		return memberDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Member record) {
		// TODO Auto-generated method stub
		return memberDao.updateByPrimaryKey(record);
	}

	@Override
	public List<Member> selectAll() {
		// TODO Auto-generated method stub
		return memberDao.selectAll();
	}
}
