package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.CardType;

public interface CardTypeDao {
    int deleteByPrimaryKey(Integer cardTypeId);

    int insert(CardType record);

    int insertSelective(CardType record);

    CardType selectByPrimaryKey(Integer cardTypeId);

    int updateByPrimaryKeySelective(CardType record);

    int updateByPrimaryKey(CardType record);
    
    List<CardType> selectAll();
}