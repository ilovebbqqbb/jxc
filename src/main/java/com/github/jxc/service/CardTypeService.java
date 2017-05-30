package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.CardType;

public interface CardTypeService {
    int deleteByPrimaryKey(Integer cardTypeId);

    int insert(CardType record);

    int insertSelective(CardType record);

    CardType selectByPrimaryKey(Integer cardTypeId);

    int updateByPrimaryKeySelective(CardType record);

    int updateByPrimaryKey(CardType record);
    
    List<CardType> selectAll();
}
