package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.CardTypeDao;
import com.github.jxc.pojo.CardType;
import com.github.jxc.service.CardTypeService;

@Service("CardTypeService")
public class CardTypeServiceImpl implements CardTypeService {
	
	@Resource
	private CardTypeDao cardTypeDao;
	
	@Override
	public int deleteByPrimaryKey(Integer cardTypeId) {
		// TODO Auto-generated method stub
		return cardTypeDao.deleteByPrimaryKey(cardTypeId);
	}

	@Override
	public int insert(CardType record) {
		// TODO Auto-generated method stub
		return cardTypeDao.insert(record);
	}

	@Override
	public int insertSelective(CardType record) {
		// TODO Auto-generated method stub
		return cardTypeDao.insertSelective(record);
	}

	@Override
	public CardType selectByPrimaryKey(Integer cardTypeId) {
		// TODO Auto-generated method stub
		return cardTypeDao.selectByPrimaryKey(cardTypeId);
	}

	@Override
	public int updateByPrimaryKeySelective(CardType record) {
		// TODO Auto-generated method stub
		return cardTypeDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(CardType record) {
		// TODO Auto-generated method stub
		return cardTypeDao.updateByPrimaryKey(record);
	}
	
	public List<CardType> selectAll(){
		return cardTypeDao.selectAll();
	}

}
